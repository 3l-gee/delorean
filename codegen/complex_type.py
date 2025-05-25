from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb, Xml
from view import View
from content import Content
from field_handler import FieldHandler


class ComplexType: 
    @staticmethod
    def generate_complex_types(type):
        res = []
        for element in type:
            result = ComplexType.runner(element)
            if result:
                res.extend(result)
        return res 
    
    @staticmethod
    def runner(element) :
        node = []
        if element is None :    
            Control.log_action(
                what="element is None",
                success=False,
                why=str(element),
            )
            return node

        if element.attrib["name"] in Content.get_ignore():
            return node

        schema = View.get_schema(element.attrib.get("name"))

        node.append(Jaxb.complex(element.attrib["name"]))
        node.extend(ComplexType.class_writer(element, schema))
        node.append(Jaxb.end)

        parent_xpath = Jaxb.complex_xpath(element.attrib.get("name"))
        node.extend(FieldHandler.field_writer(element, parent_xpath))
            
        return node
    
    @staticmethod
    def class_writer(element, schema="public"):
        node = []
        
        list_element_content = element.findall(".//"+ Tag.element) or []
        # TODO : why do we need this ?
        # ownership = False
        # association = False

        # for attribute in element.findall(".//"+ Tag.attribute_group) or []:
        #     if attribute.attrib.get("ref") == "gml:OwnershipAttributeGroup" : 
        #         ownership = True

        #     if attribute.attrib.get("ref") == "gml:AssociationAttributeGroup" : 
        #         association = True

        for element_content in list_element_content:
            if element_content.attrib.get("name") == "dbid" :
                if "TimeSlicePropertyType" in element.attrib.get("name"):
                    xmlt_type_name = element.attrib.get("name").replace("TimeSlicePropertyType", "")
                    if xmlt_type_name.isupper():
                        xmlt_type_name = xmlt_type_name.lower() + "TimeSlice"

                    else:
                        xmlt_type_name = xmlt_type_name[0].lower() + xmlt_type_name[1:] + "TimeSlice"

                    node.append(Annox.class_add(Xml.type(element.attrib["name"], xmlt_type_name)))
                    continue

                elif "PropertyType" in element.attrib.get("name"):
                    node.append(Annox.class_add(Xml.type(element.attrib["name"])))

        # TODO : why do we need this ?
        # if Debug.entity.get("mode") == True and element.attrib.get("name") not in Debug.entity.get("name", []):
        #     node.append(Annox.class_add(Jpa.embeddable))
        #     return node

        # Abstract types are entity and have a inheritance strategy
        if element.attrib.get("name") in Content.get_abstract().keys() :
            Content.append_entity(element.attrib["name"])
            node.append(Annox.class_add(Jpa.entity))
            node.append(Annox.class_add(Jpa.relation.inhertiance()))
            return node

        # Types that are embeddable 
        if element.attrib.get("name") in Content.get_embed().keys():
            node.append(Annox.class_add(Jpa.embeddable))
            return node
        
        Content.append_entity(element.attrib["name"])
        node.append(Annox.class_add(Jpa.entity))
        base = element.find(".//" + Tag.restriction) or element.find(".//" + Tag.extension) 
        if base is not None:
            node.append(Annox.class_add(Jpa.table(element.attrib["name"],schema)))
        else :  
            node.append(Annox.class_add(Jpa.table(element.attrib["name"],schema)))
        return node