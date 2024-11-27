from enum import Enum
import xml.etree.ElementTree as ET
from lxml import etree
from typing import List
import re
import os
import Annotation
import json

def runner(config: dict, xsds: List[dict]):
    xsds = [Xsd(xsd["name"], xsd["path"], xsd["strategy"], xsd["manual"], xsd.get("package")) for xsd in xsds]
    config = Config(config)
    machinery = Machinery(xsds, config)

    machinery.generate_xjb()
    machinery.export_xjb()


class strategy(Enum):
    abstract = "abstract"
    feature = "feature"
    data_type = "data_type"
    other = "other"

class Xsd: 
    def __init__(self, name:str, path:str, strategie: strategy, manual: dict, package: str = None):
        self.name = name
        self.package = package
        self.path = path
        self.strategy = strategie
        self.manual = manual
        self.root = ET.parse(path).getroot()
        self.namespaces = self.get_namespaces()
        self.elements = self.root.findall(Annotation.Tag.element, self.namespaces) or []
        self.groups = self.root.findall(Annotation.Tag.group, self.namespaces) or []
        self.attributes = self.root.findall(Annotation.Tag.attribute, self.namespaces) or []
        self.extension = self.root.findall(Annotation.Tag.extension, self.namespaces) or []
        self.simple_type = self.root.findall(Annotation.Tag.simple_type, self.namespaces) or []
        self.complex_type = self.root.findall(Annotation.Tag.complex_type, self.namespaces) or []

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
        self.transient = config["transient"]
        self.embed = config["embed"]
        self.abstract = config["abstract"]
        self.constraint_methode = config["constraint_methode"] # psql / xjb
        self.output_path = config["output_path"]

class Machinery:
    def __init__(self, xsds: List[Xsd], config: Config):
        self.xsds = xsds
        self.config = config
        self.xjb = self.init_xjb(self.xsds)

        self.content = self.init_content(self.xsds)

        self.abstract_feature = []
        self.entity_feature = []
        self.ignore_feature = []
        self.folder = {}

    def init_content(self, xsds: List[Xsd]): 
        res = {}
        for xsd in xsds:
            content = xsd.get_simple_type()
            graph = self.build_graph(content)
            transposition = self.build_transposition(content, graph)
            if xsd.strategy == strategy.data_type:
                self.config.embed.extend(self.extract_embed(xsd.root))

            res[xsd.name] = {
                "strategy" : xsd.strategy,
                "simple_type" : {
                    "type" : content,
                    "graph" : graph,
                    "transposition" : transposition
                    },
                "complex_type" : {
                    "type" : xsd.get_complex_type(),
                    }
                }

        return res
    
    def extract_embed(self, root):
        res = []
        complexType = root.findall(Annotation.Tag.complex_type) or []
        for element in complexType:
            print(element.attrib)
            res.append(element.attrib["name"])
        return res
    
    def build_graph(self, type: List):
        res = {}
        for element in type:
            base = element.findall(Annotation.Tag.extension) or element.findall(Annotation.Tag.restriction) or []
            if base != []:
                name = base[0].attrib["base"]
                try : 
                    name = name.split(":")[-1]
                except:
                    pass
                if name not in res : 
                    res[name] = [element.attrib["name"]]
                else :
                    res[name].append(element.attrib["name"])

        return res

    def build_transposition(self, type: list,  graph):
        transposition = {}
        for element in type : 
            temp_transposition = {}
            name = element.attrib["name"]
            if name in graph.keys():
                temp_transposition = self.graph_traversal(element, name, graph)

            for key, value in temp_transposition.items():
                if key in transposition:
                    transposition[key].extend(value)
                else :
                    transposition[key] = value

        return transposition
    
    def graph_traversal(self,element,  name, graph, dict=None):
        if dict is None:
            dict = {}

        if name in graph.keys():
           
            deep_dict = {}
            for item in graph[name]:
                deep_dict.update({item : self.generate_constraints(element)})
                deep_dict.update(self.graph_traversal(element, item, graph))
                
                dict.update(deep_dict)
        return dict        
            
    def generate_constraints(self, element) : 
        res = {}
        restriction = element.find(Annotation.Tag.restriction)
        if restriction is None:
            return res

        fractionDigits = restriction.find(Annotation.Tag.fractionDigits)
        length = restriction.find(Annotation.Tag.length)
        maxExclusive = restriction.find(Annotation.Tag.maxExclusive)
        minExclusive = restriction.find(Annotation.Tag.minExclusive)
        maxInclusive = restriction.find(Annotation.Tag.maxInclusive)
        minInclusive = restriction.find(Annotation.Tag.minInclusive)
        maxLength = restriction.find(Annotation.Tag.maxLength)
        minLength = restriction.find(Annotation.Tag.minLength)
        pattern = restriction.find(Annotation.Tag.pattern)
        totalDigits = restriction.find(Annotation.Tag.totalDigits)
        whiteSpace = restriction.find(Annotation.Tag.whiteSpace)

        if fractionDigits is not None:
            pass

        if length is not None:
            pass

        if maxExclusive is not None:
            pass

        if minExclusive is not None:
            pass
    
        if maxInclusive is not None:
            pass

        if minInclusive is not None:
            pass

        if minLength is not None or maxLength is not None:
            res["Size"] = (Annotation.Annox.field_add(Annotation.Jpa.constraint.size(minLength.attrib["value"], maxLength.attrib["value"])))

        if pattern is not None:
            res["Pattern"] = (Annotation.Annox.field_add(Annotation.Jpa.constraint.pattern(pattern.attrib["value"], "good luck bro...")))

        if totalDigits is not None:
            pass

        if whiteSpace is not None:
            pass        

        return res
    
    def generate_cardinality(self, parent, element, embed):
        res = []
        nillable = element.attrib.get("nillable", "false").lower() == "true"
        minOccurs = int(element.attrib.get("minOccurs", "1"))
        maxOccurs = element.attrib.get("maxOccurs", "1")  # Default is 1

        if maxOccurs.lower() == "unbounded":
            maxOccurs = "unbounded"
        else:
            maxOccurs = int(maxOccurs)

        if maxOccurs == "unbounded":
            res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.one_to_many()))
            res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.join_column(element.attrib.get("name",element.attrib.get("ref")))))

        if maxOccurs == 1:
            if element.attrib.get("name",element.attrib.get("ref")) in embed:
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.one_to_one()))
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.join_column(element.attrib.get("name",element.attrib.get("ref")))))
            else:
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.one_to_one()))
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.join_column(element.attrib.get("name",element.attrib.get("ref")))))
            

        elif minOccurs == maxOccurs_value:
            print(f"Cardinality: exactly {minOccurs}")
        else:
            print(f"Cardinality: {minOccurs}..{maxOccurs_value}")

        # Handle nillable if needed
        if nillable:
            print("Note: Element is nillable (can be explicitly nil).")

        

    def generate_xjb(self):
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_simple_types(value["simple_type"]["type"], value["simple_type"]["graph"], value["simple_type"]["transposition"]))

        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_complex_types(value["complex_type"]["type"], self.config.embed, self.config.abstract))
            
        # for key, value in self.content.items() :
        #     self.xjb[key]["auto"]["default"].extend("<!-- section : groupe -->")
    
    def generate_simple_types(self, type, graph, transposition):
        res = []
        for element in type:
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in graph.keys() or element.attrib["name"] in self.config.ignore:
                continue

            res.append(Annotation.Jaxb.simple(element.attrib["name"]))
            enum_values = element.findall(".//" + Annotation.Tag.enumeration) or []
            base = element.findall(".//" + Annotation.Tag.restriction) or None

            if element.attrib["name"] in self.config.transient:
                res.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                res.append(Annotation.Jaxb.end)
                continue
            
            elif enum_values:
                res.append(Annotation.Jaxb.enum_start(element.attrib["name"]))
                res.extend([Annotation.Jaxb.enum_member(enum.attrib["value"], enum.attrib["value"]) for enum in enum_values])
                res.append(Annotation.Jaxb.enum_end)
            else:
                constraints = {**transposition.get(element.attrib["name"], {}), **self.generate_constraints(element)}
                if self.config.constraint_methode == "xjb":
                    res.extend(constraints.values())
                res.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"], True)))

            res.append(Annotation.Jaxb.end)

        return res
    
    def generate_complex_types(self, type, embed, abstract):
        res = []
        for element in type :
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in self.config.ignore:
                continue

            #Class writer 
            res.append(Annotation.Jaxb.complex(element.attrib["name"]))
            res.extend(self.class_writer(element, embed, abstract))
            res.extend(self.field_writer(element, embed, abstract))

            res.append(Annotation.Jaxb.end)
            
        return res
    
    def generate_groupe_types(self, type, embed, abstract):
        res = []
        for element in type:
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in self.config.ignore:
                continue

            #Class writer

    def field_writer(self, parent, embed, abstract):
        node = []
        #simpleContent flow
        simple_content = parent.find(Annotation.Tag.simple_content) or None
        if simple_content is not None:
            extension = simple_content.find(Annotation.Tag.extension)
            restriction = simple_content.find(Annotation.Tag.restriction)

            parent_name = parent.attrib["name"]

            if extension is not None:
                attribute_list = extension.findall(Annotation.Tag.attribute)
                for attribute in attribute_list:
                    node.append(Annotation.Jaxb.attribute(attribute.attrib["name"]))
                    name = parent_name + "_" + attribute.attrib["name"]
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(name, True)))
                    node.append(Annotation.Jaxb.end)

            if restriction is not None:
                attribute_list = restriction.findall(Annotation.Tag.attribute)
                for attribute in attribute_list:
                    node.append(Annotation.Jaxb.attribute(attribute.attrib["name"]))
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(name, True)))
                    node.append(Annotation.Jaxb.end)


        #sequence flow
        sequence = parent.find(Annotation.Tag.sequence) or None
        if sequence is not None:
            element_list = sequence.findall(Annotation.Tag.element, Annotation.Tag.namespaces) or []
            attribute_list = sequence.findall(Annotation.Tag.attribute, Annotation.Tag.namespaces) or []

            for element in element_list:
                if element.attrib.get("ref") is not None:
                    node.append(Annotation.Jaxb.element(element.attrib["ref"]))
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["ref"], True)))
                    node.append(Annotation.Jaxb.end)

                if element.attrib.get("name") is not None:
                    node.append(Annotation.Jaxb.element(element.attrib["name"]))
                    if element.attrib.get("name") == "dbid":
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.id))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.generated_value()))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"], False, False)))
                        node.append(Annotation.Annox.field_add(Annotation.Xml.transient))
                        node.append(Annotation.Jaxb.end)
                    else :
                        node.append(Annotation.Jaxb.element(element.attrib["name"]))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"], True)))
                        node.append(Annotation.Jaxb.end)

            for attribute in attribute_list:
                if attribute.attrib.get("name") is not None:
                    node.append(Annotation.Jaxb.attribute(attribute.attrib["name"]))
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(attribute.attrib["name"], True)))
                    node.append(Annotation.Jaxb.end)
                if attribute.attrib.get("ref") is not None:
                    node.append(Annotation.Jaxb.attribute(attribute.attrib["ref"]))
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(attribute.attrib["ref"], True)))
                    node.append(Annotation.Jaxb.end)
                else : 
                    print(attribute.attrib)


        #complexContent flow
        complex_content = parent.find(Annotation.Tag.complex_content) or None
        if complex_content is not None:
            extension = complex_content.find(Annotation.Tag.extension)
            restriction = complex_content.find(Annotation.Tag.restriction)

            if extension is not None:
                attribute_list = extension.findall(Annotation.Tag.attribute)
                element_list = extension.findall(Annotation.Tag.element)
                for attribute in attribute_list:
                    node.append(Annotation.Jaxb.attribute(attribute.attrib["name"]))
                    node.append(Annotation.Annox.field_add(Annotation.Jpa.column(attribute.attrib["name"], True)))
                    node.append(Annotation.Jaxb.end)

                for element in element_list:
                    node.append(Annotation.Jaxb.element(element.attrib["name"]))
                    if element.attrib.get("name") == "dbid":
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.id))
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.generated_value))
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.column(element.attrib["name"], False, False)))
                        node.append(Annotation.Jaxb.field_add(Annotation.Xml.transient))
                    else :
                        node.append(Annotation.Jaxb.element(element.attrib["name"]))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"], True)))
                        node.append(Annotation.Jaxb.end)
            
            if restriction is not None:
                attribute_list = restriction.findall(Annotation.Tag.attribute)
                element_list = restriction.findall(Annotation.Tag.element)
                for attribute in attribute_list:
                    if attribute.attrib.get("name") is not None:
                        node.append(Annotation.Jaxb.attribute(attribute.attrib["name"]))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(attribute.attrib["name"], True)))
                        node.append(Annotation.Jaxb.end)
                    if attribute.attrib.get("ref") is not None:
                        node.append(Annotation.Jaxb.attribute(attribute.attrib["ref"]))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(attribute.attrib["ref"], True)))
                        node.append(Annotation.Jaxb.end)
                    else : 
                        print(attribute.attrib)

                for element in element_list:
                    node.append(Annotation.Jaxb.element(element.attrib["name"]))
                    if element.attrib.get("name") == "dbid":
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.id))
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.generated_value))
                        node.append(Annotation.Jaxb.field_add(Annotation.Jpa.column(element.attrib["name"], False, False)))
                        node.append(Annotation.Jaxb.field_add(Annotation.Xml.transient))
                    else :
                        node.append(Annotation.Jaxb.element(element.attrib["name"]))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"], True)))
                        node.append(Annotation.Jaxb.end)
        return node

    def class_writer(self, element, embed, asbtract):
        node = []
        if element.attrib.get("name") in asbtract:
            self.entity_feature.append(element.attrib["name"])
            node.append(Annotation.Annox.class_add(Annotation.Jpa.entity))
            node.append(Annotation.Annox.class_add(Annotation.Jpa.relation.inhertiance()))
            return node

        if element.attrib.get("name") in embed :
            node.append(Annotation.Annox.class_add(Annotation.Jpa.embeddable))
            return node
        
        self.entity_feature.append(element.attrib["name"])
        node.append(Annotation.Annox.class_add(Annotation.Jpa.entity))
        node.append(Annotation.Annox.class_add(Annotation.Jpa.table(Annotation.Util.snake_case(element.attrib["name"]),"public")))

        return node


    def init_xjb(self, xsds: List[Xsd]):
        res = {}
        for xsd in xsds:
            start_annotations = [
                Annotation.Jaxb.schema(xsd.name + ".xsd")
            ]
            if xsd.package is not None:
                start_annotations.extend([
                    Annotation.Jaxb.binding_start,
                    Annotation.Jaxb.package(xsd.package),
                    Annotation.Jaxb.binding_end
                ])  
            
            res[xsd.name] = {
                "start": start_annotations,
                "manual": {"default": self.init_manual(xsd.manual)},
                "auto": {"default": []},
                "end": [Annotation.Jaxb.end]
            }

        return res
    
    def init_manual(self, file_path):
        main = etree.XMLParser(remove_blank_text=True, huge_tree=True)
        tree = etree.parse(file_path, main)
        root = tree.getroot()
        bindings = root.findall(".//jaxb:bindings", namespaces=root.nsmap)
        binding_names = [f"'{binding.get('node')}'" for binding in bindings]
        print(binding_names)

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
            f.write(Annotation.Jaxb.start)
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

            f.write(Annotation.Jaxb.end)

        self.format_xml(self.config.output_path)

    def format_xml(self, file_path):
        main = etree.XMLParser(remove_blank_text=True, huge_tree=True)
        tree = etree.parse(file_path, main)
        root = tree.getroot()
        branch = etree.parse("util/manual/AIXM_BasicMessage.xjb", main)

        for binding in branch.getroot().findall(".//jaxb:bindings", namespaces = branch.getroot().nsmap): 
            schema_location = binding.get("schemaLocation")
            node = binding.get("node")

            match = tree.xpath(
                """.//jaxb:bindings[@schemaLocation="AIXM_BasicMessage.xsd"]""",
                namespaces=root.nsmap,
            )
            print(match[0].tag)  
            # if match :
            #     for child in binding:
            #         match[0].append(child)

            # else : 
            #     root.append(binding)


        tree.write(file_path, pretty_print=True, encoding='utf-8', xml_declaration=True)


    def get_all_roots(self):
        roots = []
        for xsd in self.xsds:
            roots.append(xsd.root)
        return roots

    def get_all_content(self, xsds: List[Xsd]): 
        res = {
            "simple_type" : {},
            "complex_type" : {}
        }
        for xsd in xsds:
            if xsd.name in res["simple_type"]:
                res["simple_type"][xsd.name].extend(xsd.get_simple_type())
            else:
                res["simple_type"][xsd.name] = xsd.get_simple_type()

            if xsd.name in res["complex_type"]:
                res["complex_type"][xsd.name].extend(xsd.get_complex_type())
            else:
                res["complex_type"][xsd.name] = xsd.get_complex_type()

        return res