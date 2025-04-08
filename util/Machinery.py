from enum import Enum
import xml.etree.ElementTree as ET
from lxml import etree
from typing import List
import os
import json
from content import Content
from simple_type import SimpleType
from complex_type import ComplexType
from group_type import GroupType
from annotation import Property, Annox, Strategy, Jpa, Relation, Xpath,Tag, Jaxb, Xml
from control import Control
from validation import Validation
from xsd import Xsd
from view import View


   # machinery.print_entity_class(machinery.entity_feature)

class Machinery:
    def __init__(self, config_dict: dict, xsds_dict: List[dict]): 
        self.xsds = [Xsd(xsd["name"], xsd["path"], xsd["strategy"], xsd["manual"], xsd.get("package")) for xsd in xsds_dict]
        self.xjb = self.init_xjb(self.xsds)
        Content(self.xsds, config_dict)

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
        for key, value in Content.get_content().items() :
            self.xjb[key]["auto"]["default"].extend(
                SimpleType.generate_simple_types(value["simple_type"]["type"], value["simple_type"]["graph"], value["simple_type"]["transposition"]))
                        
        for key, value in Content.get_content().items() :
            self.xjb[key]["auto"]["default"].extend(
                ComplexType.generate_complex_types(value["complex_type"]["type"]))
                        
        for key, value in Content.get_content().items() :
            self.xjb[key]["auto"]["default"].extend(
                GroupType.generate_groupe_types(value["group"]["type"]))

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
        os.makedirs(os.path.dirname(Content.get_output_path()), exist_ok=True)
        with open(Content.get_output_path(), 'w') as f:
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

        self.format_xml(Content.get_output_path())

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