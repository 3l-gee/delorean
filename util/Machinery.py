from enum import Enum
import xml.etree.ElementTree as ET
from lxml import etree
from typing import List
import os
import json
from content import Content
from simple_type import SimpleType
from complex_type import ComplexType
from annotation import Property, Annox, Strategy, Jpa, Relation, Xpath,Tag, Jaxb, Xml
from control import Control
from validation import Validation
from xsd import Xsd
from view import View


   # machinery.print_entity_class(machinery.entity_feature)

class Config:
    def __init__(self, config: dict):
        self.ignore = config["ignore"]
        self.transient = config["transient"]
        self.embed = config["embed"]
        self.abstract = config["abstract"]
        self.constraint_methode = "xjb"
        self.output_path = config["output_path"]

class Debug:
    def __init__(self, debug: dict):
        self.mode = debug.get("mode", False)
        self.entity = debug.get("entity", {})
        self.feature = debug.get("feature", {})


class Machinery:
    def __init__(self, config_dict: dict, debug_dict: dict, xsds_dict: List[dict]): 
        self.xsds = [Xsd(xsd["name"], xsd["path"], xsd["strategy"], xsd["manual"], xsd.get("package")) for xsd in xsds_dict]
        self.config = Config(config_dict)
        self.debug = Debug(debug_dict) if debug_dict["mode"] else Debug({})
        self.xjb = self.init_xjb(self.xsds)
        self.content = Content(self.xsds, self.config)

        # self.abstract_feature = {}
        # self.entity_feature = [] # todo make it a dict
        # self.ignore_feature = {}
        # self.column_definition = {}
        # self.folder = {}
        # self.table_name = {}

        self.generate_xjb()
        self.export_xjb()
        # for key, value in self.content.items() :
            # self.export_file("types.txt", value["simple_type"]["type"])

        # self.print_entity_class(self.entity_feature)
        # Control.print_actions(True)

    def export_file(self, file_path, content):
        with open(file_path, 'w') as f:
            f.write(json.dumps(content, indent=4))
        
                                                    
    def generate_xjb(self):
        for key, value in self.content.get_content() :
            self.xjb[key]["auto"]["default"].extend(
                SimpleType.generate_simple_types(value["simple_type"]["type"], value["simple_type"]["graph"], value["simple_type"]["transposition"], self.config, self.debug))
            
        #     self.export_file("graph.txt", value["simple_type"]["graph"])
        #     self.export_file("transposition.txt", value["simple_type"]["transposition"])
        #     self.export_file("embed_feature.txt", self.config.embed)
            
        for key, value in self.content.get_content() :
            self.xjb[key]["auto"]["default"].extend(
                ComplexType.generate_complex_types(value["complex_type"]["type"], self.config.embed, self.config.abstract, self.config, self.debug))
                        
        # for key, value in self.content.items() :
        #     self.xjb[key]["auto"]["default"].extend(
        #         self.generate_groupe_types(value["group"]["type"], self.config.embed, self.config.abstract))
    
    
    def generate_complex_types(self, type, embed, abstract):
        res = []
        for element in type :
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in self.config.ignore:
                continue

            res.append(Jaxb.complex(element.attrib["name"]))
            res.extend(self.class_writer(element, embed, abstract, View.get_schema(element.attrib.get("name"))))
            res.append(Jaxb.end)

            parent_xpath = Jaxb.complex_xpath(element.attrib.get("name"))
            res.extend(self.field_writer(element, embed, parent_xpath))
            
        return res
    
    def generate_groupe_types(self, type, embed, abstract):
        res = []
        for element in type:
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in self.config.ignore:
                continue

            parent_xpath = Jaxb.group_xpath(element.attrib.get("name"))
            res.extend(self.field_writer(element, embed, parent_xpath))

        return res

    def field_writer(self, parent, embed, parent_xpath):
        node = []
        
        # Process simpleContent
        node.extend(self.process_simple_content(parent, embed, parent_xpath))
        
        # Process sequence
        node.extend(self.process_sequence(parent, embed, parent_xpath))
        
        # Process complexContent
        node.extend(self.process_complex_content(parent, embed, parent_xpath))
        
        return node

    def process_simple_content(self, parent, embed, parent_xpath):
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
                node.extend(self.handel_simple_attribute(attribute, parent, embed, parent_xpath))

        return node
    
    def process_sequence(self, parent, embed, parent_xpath):
        """Process the sequence flow."""
        node = []
        sequence_list = parent.findall(Tag.sequence) or []
        # if parent_xpath == "//xs:complexType[@name='AerialRefuellingPropertyType']":
        #         print(parent[0])
        #         print(parent.attrib)
        #         print(sequence_list)
        for sequence in sequence_list:

            element_list = sequence.findall(".//" + Tag.element, Tag.namespaces) or []
            attribute_list = sequence.findall(".//" + Tag.attribute, Tag.namespaces) or []

            for element in element_list :
                node.extend(self.handle_sequence_element(element, parent, embed, parent_xpath))

            for attribute in attribute_list :
                node.extend(self.handle_sequence_attribute(attribute, parent, embed, parent_xpath))
        
        return node

    def process_complex_content(self, parent, embed, parent_xpath) :
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
                node.extend(self.handle_complex_attribute(attribute, parent, embed, parent_xpath))

            for element in element_list:
                node.extend(self.handle_complex_element(element, parent, embed, parent_xpath))
        
        return node
    
    def handel_simple_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle attributes in simpleContent."""
        node = []
        node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath))

        if str(parent.attrib.get("name","") + "." + attribute.attrib.get("name","")) in self.config.ignore:
            return node

        if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
            node.append(Annox.field_add(Jpa.transient))
            node.append(Jaxb.end)
            return node

        if attribute.attrib.get("name") == "name":
            node.append(Jaxb.property.name())

        name = parent.attrib.get("name") + "_" + attribute.attrib.get("name")
        node.append(Annox.field_add(Jpa.column(name)))
        node.append(Jaxb.end)
        return node

    def handle_sequence_element(self, element, parent, embed, parent_xpath):
        """Handle elements in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + element.attrib.get("name","")) in self.config.ignore:
            return node
    
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Jaxb.element(element.attrib.get("ref"),parent=parent_xpath, xpath=Xpath.GLOBAL.value ,at="ref"))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annox.field_add(Jpa.id))
                node.append(Annox.field_add(Jpa.generated_value("place_holder_generator_name")))
                node.append(Annox.field_add(Jpa.sequence_generator("place_holder_generator_name")))
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

        node.extend(Validation.generate_cardinality(parent, element, embed))
        node.append(Jaxb.end)

        return node

    def handle_sequence_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle restrictions in content."""
        node = []

        if str(parent.attrib.get("name","") + "." + attribute.parent.attrib.get("name","")) in self.config.ignore:
            return node
        
        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            if attribute.attrib.get("name") == "name":
                node.append(Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(Validation.generate_cardinality(parent, attribute, embed))
        node.append(Jaxb.end)

        return node

    def handle_complex_element(self, element, parent, embed, parent_xpath):
        """Handle attributes in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + element.attrib.get("name","")) in self.config.ignore:
            return node
    
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Jaxb.element(element.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annox.field_add(Jpa.id))
                node.append(Annox.field_add(Jpa.generated_value("place_holder_generator_name")))
                node.append(Annox.field_add(Jpa.sequence_generator("place_holder_generator_name")))
                node.append(Annox.field_add(Jpa.column("id", nullable=False, unique=True)))
                node.append(Annox.field_add(Xml.transient))
                node.append(Annox.end)
                return node
            
            if element.attrib.get("name") == "name":
                node.append(Jaxb.property.name_element())
            else :
                node.append(Jaxb.property.element)
        else : 
            print(element.attrib)

        node.extend(Validation.generate_cardinality(parent, element, embed))
        node.append(Jaxb.end)

        return node

    def handle_complex_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle elements in a sequence."""
        node = []

        if str(parent.attrib.get("name","") + "." + attribute.attrib.get("name","")) in self.config.ignore:
            return node

        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
                return node
            
            if attribute.attrib.get("name") == "name":
                node.append(Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(Validation.generate_cardinality(parent, attribute, embed))
        node.append(Jaxb.end)

        return node
    
    def class_writer(self, element, embed, asbtract, schema="public"):
        node = []
        
        sub_element_list = element.findall(".//"+ Tag.element) or []
        ownership = False
        association = False

        for attribute in element.findall(".//"+ Tag.attribute_group) or []:
            if attribute.attrib.get("ref") == "gml:OwnershipAttributeGroup" : 
                ownership = True

            if attribute.attrib.get("ref") == "gml:AssociationAttributeGroup" : 
                association = True

        for sub_element in sub_element_list:

            if sub_element.attrib.get("name") == "dbid" :
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


        if self.debug.entity.get("mode") == True and element.attrib.get("name") not in self.debug.entity.get("name", []):
            node.append(Annox.class_add(Jpa.embeddable))
            return node

        if element.attrib.get("name") in asbtract :
            self.entity_feature.append(element.attrib["name"])
            node.append(Annox.class_add(Jpa.entity))
            node.append(Annox.class_add(Jpa.relation.inhertiance()))
            return node

        if element.attrib.get("name") in embed.keys():
            node.append(Annox.class_add(Jpa.embeddable))
            return node
        
        self.entity_feature.append(element.attrib["name"])
        node.append(Annox.class_add(Jpa.entity))
        base = element.find(".//" + Tag.restriction) or element.find(".//" + Tag.extension) 
        if base is not None:
            node.append(Annox.class_add(Jpa.table(element.attrib["name"],schema)))
        else :  
            node.append(Annox.class_add(Jpa.table(element.attrib["name"],schema)))
        return node


    def init_xjb(self, xsds: List[Xsd]):
        res = {}
        for xsd in xsds:
            start_annotations = [
                Jaxb.schema(xsd.name + ".xsd")
            ]
            if xsd.package is not None:
                start_annotations.extend([
                    Jaxb.binding_start,
                    Jaxb.package(xsd.package),
                    Jaxb.binding_end
                ])  
            
            res[xsd.name] = {
                "start": start_annotations,
                "manual": {"default": self.init_manual(xsd.manual)},
                "auto": {"default": []},
                "end": [Jaxb.end]
            }

        return res
    
    def init_manual(self, file_path):
        main = etree.XMLParser(remove_blank_text=True, huge_tree=True)
        tree = etree.parse(file_path, main)
        root = tree.getroot()
        bindings = root.findall(".//jaxb:bindings", namespaces=root.nsmap)
        binding_names = [f"'{binding.get('node')}'" for binding in bindings]

        isContent = False
        bindingsCounter = 0
        res = []
        with open(file_path, 'r') as file :
            for line in file :
                if isContent:
                    res.append(line.replace("\n", ""))

                if '<jaxb:bindings node="manual">' in line:
                    isContent = True

                if '<jaxb:bindings' in line:
                    bindingsCounter += 1

                if '</jaxb:bindings' in line:
                    bindingsCounter -= 1
                    if isContent and bindingsCounter == 2:
                        return res[:-1]
        return res[:-1]

    def export_xjb(self):
        os.makedirs(os.path.dirname(self.config.output_path), exist_ok=True)
        with open(self.config.output_path, 'w') as f:
            f.write(Jaxb.start)
            for xjb in self.xjb:
                for annotation in self.xjb[xjb]["start"]:
                    f.write(annotation + "\n")

                f.write("<!-- section : manual -->" + "\n")

                for key, value in self.xjb[xjb]["manual"].items():
                    f.write("<!-- part : " + key  + " -->"  + "\n")
                    for annotation in value:
                        f.write(annotation  + "\n")

                f.write("<!-- section : auto -->" + "\n")

                for key, value in self.xjb[xjb]["auto"].items():
                    f.write("<!-- part : " + key + " -->"  + "\n")
                    for annotation in value:
                        f.write(annotation + "\n")

                for annotation in self.xjb[xjb]["end"]:
                    f.write(annotation + "\n")

            f.write(Jaxb.end)

        self.format_xml(self.config.output_path)

    def format_xml(self, file_path):
        main = etree.XMLParser(remove_blank_text=True, huge_tree=True)
        tree = etree.parse(file_path, main)
        root = tree.getroot()

        for xsd in self.xsds:
            xjb_manual = xsd.manual
            xsd_name = xsd.name
            branch = etree.parse(xjb_manual, main)
            for binding in branch.getroot().findall(".//jaxb:bindings", namespaces = branch.getroot().nsmap): 
                schema_location = binding.get("schemaLocation")
                node = binding.get("node")

                match = tree.xpath(
                    f""".//jaxb:bindings[@schemaLocation="{xsd_name}.xsd"]""",
                    namespaces=root.nsmap,
                )

            tree.write(file_path, pretty_print=True, encoding='utf-8', xml_declaration=True)

    def print_entity_class(self, list):
        sorted_entities = sorted(list, key=lambda x: (not x.startswith("Message"), not x.startswith("Abstract"), x))
        for entity in sorted_entities:
            print(str("com.aixm.delorean.core.schema.a5_1_1.aixm." + str(entity) + ".class,"))