from enum import Enum
import xml.etree.ElementTree as ET
from typing import List
import re
import os
import Annotation
import json

def runner(config: dict, xsds: List[dict]):
    xsds = [Xsd(xsd["name"], xsd["path"], xsd["strategie"], xsd.get("package")) for xsd in xsds]
    config = Config(config)
    machinery = Machinery(xsds, config)

    machinery.xjb_initializer()
    machinery.insight_simple_types()
    machinery.field_writer_simple_type()
    machinery.xjb_writer()


class strategie(Enum):
    abstract = "abstract"
    feature = "feature"
    data_type = "data_type"
    other = "other"

class Xsd: 
    def __init__(self, name:str, path:str, strategie: strategie, package: str = None):
        self.name = name
        self.package = package
        self.path = path
        self.root = ET.parse(path).getroot()
        self.namespaces = self.get_namespaces()
        self.strategie = strategie
        self.elements = self.root.findall(Annotation.Tag.element, self.namespaces) or []
        self.groups = self.root.findall("{http://www.w3.org/2001/XMLSchema}group", self.namespaces) or []
        self.attributes = self.root.findall("{http://www.w3.org/2001/XMLSchema}attribute", self.namespaces) or []
        self.extension = self.root.findall("{http://www.w3.org/2001/XMLSchema}extension", self.namespaces) or []
        self.simple_type = self.root.findall(Annotation.Tag.simple_type, self.namespaces) or []
        self.complex_type = self.root.findall("{http://www.w3.org/2001/XMLSchema}complexType", self.namespaces) or []

    def get_elements(self):
        return self.elements
    
    def get_elements_info(self):
        for element in self.elements:
            print(element.attrib)

    def get_groups(self):
        return self.groups
    
    def get_groups_info(self):
        for group in self.groups:
            print(group.attrib)
    
    def get_attributes(self):
        return self.attributes

    def get_attributes_info(self):
        for attribute in self.attributes:
            print(attribute.attrib)

    def get_extension(self):
        return self.extension

    def get_extension_info(self):
        for extension in self.extension:
            print(extension.attrib)
    
    def get_simple_type(self):
        return self.simple_type
    
    def get_simple_type_info(self):
        for simple_type in self.simple_type:
            print(simple_type.attrib)
    
    def get_complex_type(self):
        return self.complex_type

    def get_complex_type_info(self):
        for complex_type in self.complex_type:
            print(complex_type.attrib)  
    
    def get_namespaces(self):
        namespaces = dict([
            node for _, node in ET.iterparse(self.path, events=['start-ns'])
        ])
        return namespaces

class Config:
    def __init__(self, config: dict):
        self.ignore = config["ignore"]
        self.embedable = config["embedable"]
        self.embedded = config["embedded"]
        self.constraint_methode = config["constraint_methode"] # psql / xjb
        self.output_path = config["output_path"]

class Machinery:
    def __init__(self, xsds: List[Xsd], config: Config):
        self.xsds = xsds
        self.config = config

        self.all_roots = self.get_all_roots()
        self.all_namespaces = self.get_all_namespaces()
        self.all_elements = self.get_all_elements()
        self.all_groups = self.get_all_groups()
        self.all_attributes = self.get_all_attributes()
        self.all_extensions = self.get_all_extensions()
        self.all_simple_types = self.get_all_simple_types()
        self.simple_types_base_graph = self.insight_simple_types()
        self.all_complex_types = self.get_all_complex_types()  
        self.abstract = {}
        self.entity = {}
        self.embedable = {}
        self.embedded = {}
        self.ignore = {}
        self.folder = {}

        self.xjb = {}

    def insight_elements(self):
        attrib = {}
        for key, value in self.all_elements.items():
            for element in value:
                print(key, element.attrib)

    def insight_simple_types(self):
        base = {}
        for key, value in self.all_simple_types.items():
            for element in value:
                extension = element.findall(Annotation.Tag.extension) or []
                restriction = element.findall(Annotation.Tag.restriction) or []
                if restriction != []:
                    if restriction[0].attrib["base"] not in base.keys():
                        base[restriction[0].attrib["base"]] = {"extension": [], "restriction": []}
                    base[restriction[0].attrib["base"]]["restriction"].append(element.attrib["name"])

                if extension != []:
                    if extension[0].attrib["base"] not in base.keys():
                        base[extension[0].attrib["base"]] = {"extension": [], "restriction": []}
                    base[extension[0].attrib["base"]]["extension"].append(element.attrib["name"])

        print(json.dumps(base, indent=4))
        return base

    def field_writer_simple_type(self):
        for xsd_name, list in self.all_simple_types.items():
            for element in list:
                node = []
                node.append(Annotation.Jaxb.simple(element.attrib["name"]))

                enum_values = element.findall(".//" + Annotation.Tag.enumeration) or []
                base = element.findall(".//" + Annotation.Tag.restriction) or None

                if enum_values != [] :
                    node.append(Annotation.Jaxb.enum_start(element.attrib["name"]))
                    for enum in enum_values:
                        node.append(Annotation.Jaxb.enum_member(enum.attrib["value"], enum.attrib["value"]))
                    node.append(Annotation.Jaxb.enum_end)

                if base is not None or base != "string ":
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"])))

                node.append(Annotation.Jaxb.end)

                self.xjb[xsd_name]["auto"]["default"].extend(node)



    def xjb_initializer(self):
        for xsd in self.xsds:
            start_annotations = [
                Annotation.Jaxb.schema(xsd.name)
            ]
            if xsd.package is not None:
                start_annotations.extend([
                    Annotation.Jaxb.binding_start,
                    Annotation.Jaxb.package(xsd.package),
                    Annotation.Jaxb.binding_end
                ])
            
            self.xjb[xsd.name] = {
                "start": start_annotations,
                "manual": {"default": []},
                "auto": {"default": []},
                "end": [Annotation.Jaxb.end]
            }

    def xjb_writer(self):
        os.makedirs(os.path.dirname(self.config.output_path), exist_ok=True)
        with open(self.config.output_path, 'w') as f:
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



    def class_writer(self, element):
        pass


    def get_all_roots(self):
        roots = []
        for xsd in self.xsds:
            roots.append(xsd.root)
        return roots

    def get_all_simple_types(self):
        simple_types = {}
        for xsd in self.xsds:
            if xsd.name in simple_types:
                simple_types[xsd.name].extend(xsd.get_simple_type())
            else:
                simple_types[xsd.name] = xsd.get_simple_type()
        return simple_types
    
    def get_all_complex_types(self):
        complex_types = {}
        for xsd in self.xsds:
            if xsd.strategie in complex_types:
                complex_types[xsd.strategie].extend(xsd.get_complex_type())
            else:
                complex_types[xsd.strategie] = xsd.get_complex_type()
        return complex_types

    def get_all_extensions(self):
        extensions = {}
        for xsd in self.xsds:
            if xsd.strategie in extensions:
                extensions[xsd.strategie].extend(xsd.get_extension())
            else:
                extensions[xsd.strategie] = xsd.get_extension()
        return extensions

    def get_all_attributes(self):
        attributes = {}
        for xsd in self.xsds:
            if xsd.strategie in attributes:
                attributes[xsd.strategie].extend(xsd.get_attributes())
            else:
                attributes[xsd.strategie] = xsd.get_attributes()
        return attributes

    def get_all_groups(self):
        groups = {}
        for xsd in self.xsds:
            if xsd.strategie in groups:
                groups[xsd.strategie].extend(xsd.get_groups())
            else:
                groups[xsd.strategie] = xsd.get_groups()
        return groups

    def get_all_elements(self):
        elements = {}
        for xsd in self.xsds:
            if xsd.strategie in elements:
                elements[xsd.strategie].extend(xsd.get_elements())
            else:
                elements[xsd.strategie] = xsd.get_elements()
        return elements
    
    def get_all_namespaces(self):
        namespaces = {}
        for xsd in self.xsds:
            if xsd.strategie in namespaces:
                namespaces[xsd.strategie].update(xsd.get_namespaces())
            else:
                namespaces[xsd.strategie] = xsd.get_namespaces()
        return namespaces
