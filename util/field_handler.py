from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb, Xml, Xpath
from content import Content


class FieldHandler: 
    @staticmethod
    def field_writer(type, parent_xpath):
        node = []
        
        # Process simpleContent
        node.extend(FieldHandler.process_simple_content(type, parent_xpath))
        
        # Process sequence
        node.extend(FieldHandler.process_sequence(type, parent_xpath))
        
        # Process complexContent
        node.extend(FieldHandler.process_complex_content(type, parent_xpath))
        
        return node

    @staticmethod
    def process_simple_content(parent, parent_xpath):
        """Process the simpleContent flow."""
        node = []
        simple_content = parent.find(Tag.simple_content)
    
        if simple_content is not None:
            extension = simple_content.find(Tag.extension)
            restriction = simple_content.find(Tag.restriction)

            attribute_list = []

            if extension is not None:
                attribute_list.extend(extension.findall(".//" + Tag.attribute))
            
            if restriction is not None:
                attribute_list.extend(restriction.findall(".//" + Tag.attribute))

            for attribute in attribute_list:
                node.extend(FieldHandler.handel_simple_attribute(attribute, parent, parent_xpath))

        return node
    
    @staticmethod
    def process_sequence(parent, parent_xpath):
        """Process the sequence flow."""
        node = []
        sequence_list = parent.findall(Tag.sequence) or []
        for sequence in sequence_list:

            element_list = sequence.findall(".//" + Tag.element, Tag.namespaces) or []
            attribute_list = sequence.findall(".//" + Tag.attribute, Tag.namespaces) or []

            for element in element_list :
                node.extend(FieldHandler.handle_sequence_element(element, parent, parent_xpath))

            for attribute in attribute_list :
                node.extend(FieldHandler.handle_sequence_attribute(attribute, parent, parent_xpath))
        
        return node

    @staticmethod
    def process_complex_content(parent, parent_xpath) :
        """Process the complexContent flow."""
        node = []
        complex_content = parent.find(Tag.complex_content)
        if complex_content is not None:
            extension = complex_content.find(Tag.extension)
            restriction = complex_content.find(Tag.restriction)

            attribute_list = []
            element_list = []

            if extension is not None:
                attribute_list.extend(extension.findall(".//" + Tag.attribute))
                element_list.extend(extension.findall(".//" + Tag.element)) 

            if restriction is not None:
                attribute_list.extend(restriction.findall(".//" + Tag.attribute))
                element_list.extend(restriction.findall(".//" + Tag.element)) 

            for attribute in attribute_list:
                node.extend(FieldHandler.handle_complex_attribute(attribute, parent, parent_xpath))

            for element in element_list:
                node.extend(FieldHandler.handle_complex_element(element, parent, parent_xpath))
        
        return node
    
    @staticmethod
    def handel_simple_attribute(attribute, parent, parent_xpath):
        """Handle attributes in simpleContent."""
        node = []
        node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath))

        if str(parent.attrib.get("name","") + "." + attribute.attrib.get("name","")) in Content.get_ignore():
            return node

        if attribute.attrib.get("name") in Content.get_transient() or attribute.attrib.get("ref") in Content.get_transient() or attribute.attrib.get("type") in Content.get_transient():
            node.append(Annox.field_add(Jpa.transient))
            node.append(Jaxb.end)
            return node

        if attribute.attrib.get("name") == "name":
            node.append(Jaxb.property.name())

        name = parent.attrib.get("name") + "_" + attribute.attrib.get("name")
        node.append(Annox.field_add(Jpa.column(name)))
        node.append(Jaxb.end)
        return node

    @staticmethod
    def handle_sequence_element(element, parent, parent_xpath):
        """Handle elements in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + element.attrib.get("name","")) in Content.get_ignore():
            return node
        
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Jaxb.element(element.attrib.get("ref"),parent=parent_xpath, xpath=Xpath.GLOBAL.value ,at="ref"))
            if element.attrib.get("name") in Content.get_transient() or element.attrib.get("ref") in Content.get_transient() or element.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if element.attrib.get("name") in Content.get_transient() or element.attrib.get("ref") in Content.get_transient() or element.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annox.field_add(Jpa.id))
                node.append(Annox.field_add(Jpa.generated_value("delorean_seq_gen")))
                node.append(Annox.field_add(Jpa.sequence_generator("delorean_seq_gen")))
                node.append(Annox.field_add(Jpa.column("id", nullable=False, unique=True)))
                node.append(Annox.field_add(Xml.transient))
                node.append(Jaxb.end)
                return node
            
            else :
                if element.attrib.get("name") == "name":
                    node.append(Jaxb.property.name_element())
                else :
                    node.append(Jaxb.property.element)

        else :
            print(element.attrib)

        node.extend(Validation.generate_cardinality(parent, element, Content.get_embed()))
        node.append(Jaxb.end)

        return node

    @staticmethod
    def handle_sequence_attribute(attribute, parent, parent_xpath):
        """Handle restrictions in content."""
        node = []

        if str(parent.attrib.get("name","") + "." + attribute.parent.attrib.get("name","")) in Content.get_ignore():
            return node
        
        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in Content.get_transient() or attribute.attrib.get("ref") in Content.get_transient() or attribute.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in Content.get_transient() or attribute.attrib.get("ref") in Content.get_transient() or attribute.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            if attribute.attrib.get("name") == "name":
                node.append(Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(Validation.generate_cardinality(parent, attribute, Content.get_embed()))
        node.append(Jaxb.end)

        return node

    @staticmethod
    def handle_complex_element(element, parent, parent_xpath):
        """Handle attributes in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + element.attrib.get("name","")) in Content.get_ignore():
            return node
    
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Jaxb.element(element.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if element.attrib.get("name") in Content.get_transient() or element.attrib.get("ref") in Content.get_transient() or element.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if element.attrib.get("name") in Content.get_transient() or element.attrib.get("ref") in Content.get_transient() or element.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annox.field_add(Jpa.id))
                node.append(Annox.field_add(Jpa.generated_value("delorean_seq_gen")))
                node.append(Annox.field_add(Jpa.sequence_generator("delorean_seq_gen")))
                node.append(Annox.field_add(Jpa.column("id", nullable=False, unique=True)))
                node.append(Annox.field_add(Xml.transient))
                node.append(Annox.end)
                return node
            
            annotation = element.find("{http://www.w3.org/2001/XMLSchema}annotation/{http://www.w3.org/2001/XMLSchema}documentation")
            snowflake_text = annotation.text if annotation is not None and annotation.text else ""

            if snowflake_text == "aixm:DateTimeType" :
                node.append(Jaxb.java_type("com.aixm.delorean.core.adapter.type.date.AixmTimestamp"))
                node.append(Annox.field_add(Xml.element(element.attrib.get("name"), "com.aixm.delorean.core.schema." + Content.get_version() + ".aixm.DateTimeType.class", False)))
                node.append(Annox.field_add(Xml.adapter("com.aixm.delorean.core.adapter." + Content.get_version() + ".date.DateTimeTypeAdapter.class")))

            if snowflake_text == "aixm:DateType" :
                node.append(Jaxb.java_type("com.aixm.delorean.core.adapter.type.date.AixmTimestamp"))
                node.append(Annox.field_add(Xml.element(element.attrib.get("name"), "com.aixm.delorean.core.schema." + Content.get_version() + ".aixm.DateType.class", False)))
                node.append(Annox.field_add(Xml.adapter("com.aixm.delorean.core.adapter." + Content.get_version() + ".date.DateTypeAdapter.class")))
            
            if element.attrib.get("name") == "name":
                node.append(Jaxb.property.name_element())
            else :
                node.append(Jaxb.property.element)
        else : 
            print(element.attrib)

        node.extend(Validation.generate_cardinality(parent, element, Content.get_embed()))
        node.append(Jaxb.end)

        return node

    @staticmethod
    def handle_complex_attribute(attribute, parent, parent_xpath):
        """Handle elements in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + attribute.attrib.get("name","")) in Content.get_ignore():
            return node

        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in Content.get_transient() or attribute.attrib.get("ref") in Content.get_transient() or attribute.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in Content.get_transient() or attribute.attrib.get("ref") in Content.get_transient() or attribute.attrib.get("type") in Content.get_transient():
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if attribute.attrib.get("name") == "name":
                node.append(Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(Validation.generate_cardinality(parent, attribute, Content.get_embed()))
        node.append(Jaxb.end)

        return node