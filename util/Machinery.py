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
    # machinery.print_entity_class(machinery.entity_feature)
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
        self.constraint_methode = "psql"
        self.output_path = config["output_path"]

class Machinery:
    def __init__(self, xsds: List[Xsd], config: Config):
        self.xsds = xsds
        self.config = config
        self.xjb = self.init_xjb(self.xsds)

        self.content = self.init_content(self.xsds)

        self.abstract_feature = {}
        self.entity_feature = [] # todo make it a dict
        self.ignore_feature = {}
        self.embed_feature = self.init_embed_feature(self.content)
        self.folder = {}

    def init_embed_feature(self, content):
        res = {}
        for key, value in content.items():
            for simple_type in value["simple_type"]["type"]:
                if simple_type.attrib["name"] in self.config.embed:
                    res[simple_type.attrib.get("name", simple_type.attrib.get("ref"))] = simple_type

            for complex_type in value["complex_type"]["type"]:
                if complex_type.attrib["name"] in self.config.embed:
                    res[complex_type.attrib.get("name", complex_type.attrib.get("ref"))] = complex_type

            for group in value["group"]["type"]:
                if group.attrib["name"] in self.config.embed:
                    res[group.attrib.get("name", group.attrib.get("ref"))] = group

        return res
    
    def init_content(self, xsds: List[Xsd]): 
        res = {}
        for xsd in xsds:
            simple_type_content = xsd.get_simple_type()
            inherit_graph = self.build_inheritance_graph(simple_type_content)
            attrib_graph = self.build_attribute_graph(xsd.get_complex_type())
            transposition = self.build_transposition(simple_type_content, inherit_graph)
            if xsd.strategy == strategy.data_type:
                self.config.embed.extend(self.extract_embed(xsd.root))

            res[xsd.name] = {
                "strategy" : xsd.strategy,
                "simple_type" : {
                    "type" : simple_type_content,
                    "graph" : {
                        "inheritance" : inherit_graph,
                        "attribute" : attrib_graph
                        },
                    "transposition" : transposition
                    },
                "complex_type" : {
                    "type" : xsd.get_complex_type(),
                    },
                "group" : {
                    "type" : xsd.get_groups()
                }
            }

        return res
    
    def extract_embed(self, root):
        res = []
        complexType = root.findall(Annotation.Tag.complex_type) or []
        for element in complexType:
            res.append(element.attrib["name"])
        return res
    
    def build_inheritance_graph(self, type):
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
    
    def build_attribute_graph(self, type):
        res = {}
        for element in type:
            attributes = element.findall(".//"+ Annotation.Tag.attribute) or []
            if attributes != []:
                for attribute in attributes:
                    name = attribute.attrib.get("type", attribute.attrib.get("ref"))
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
    
    def graph_traversal(self,element, name, graph, dict=None):
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
        type = element.attrib.get("type", "").replace("aixm:", "")
        name = element.attrib.get("name")
        ref = element.attrib.get("ref")
        nillable = element.attrib.get("nillable", "false").lower() == "true"
        minOccurs = int(element.attrib.get("minOccurs", "1"))
        maxOccurs = element.attrib.get("maxOccurs", "1")  # Default is 1


        if maxOccurs.lower() == "unbounded":
            maxOccurs = "unbounded"
        else:
            maxOccurs = int(maxOccurs)

        if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
            res.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
            return res

        if maxOccurs == "unbounded":
            res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.one_to_many()))
            return res

        if maxOccurs == 1:
            if type in embed.keys():
                res.append(Annotation.Annox.field_add(Annotation.Jpa.embedded))
                temp = [Annotation.Jpa.attribute_sub_override("value", element.attrib["name"])]
                for attribute in embed[type].findall(".//"+ Annotation.Tag.attribute) or []:
                    temp.append(Annotation.Jpa.attribute_sub_override(attribute.attrib["name"], element.attrib["name"]))

                res.append(Annotation.Annox.field_add(Annotation.Jpa.attribute_main_override(temp)))
                return res   
            
            else:
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.one_to_one()))
                column = Annotation.Jpa.relation.join_column(element.attrib.get("name",element.attrib.get("ref")))
                inverse_column = Annotation.Jpa.relation.join_column(parent.attrib.get("name",parent.attrib.get("ref")))

                
                if len(Annotation.Util.snake_case_table(parent.attrib.get("name",parent.attrib.get("ref"))) + "_" + Annotation.Util.snake_case_table(element.attrib.get("name",element.attrib.get("ref")))) > 63 :
                    print(parent.attrib.get("name",parent.attrib.get("ref")))
                    print(Annotation.Util.snake_case_table(parent.attrib.get("name",parent.attrib.get("ref"))) + "_" + Annotation.Util.snake_case_table(element.attrib.get("name",element.attrib.get("ref"))))
                res.append(Annotation.Annox.field_add(Annotation.Jpa.relation.join_table(
                    name = str(parent.attrib.get("name",parent.attrib.get("ref"))) + "_" + element.attrib.get("name",element.attrib.get("ref")),
                    join_columns = column,
                    inverse_join_columns = inverse_column
                )))
                return res

        if nillable:
            pass

        return res
            
    def generate_xjb(self):
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_simple_types(value["simple_type"]["type"], value["simple_type"]["graph"], value["simple_type"]["transposition"]))

        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_complex_types(value["complex_type"]["type"],self.embed_feature, self.config.abstract))
                        
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_groupe_types(value["group"]["type"], self.embed_feature, self.config.abstract))
    
    def generate_simple_types(self, type, graph, transposition):
        res = []
        for element in type:
            node = []
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in graph["attribute"].keys() or element.attrib["name"] in graph["inheritance"].keys() or element.attrib["name"] in self.config.ignore:
                continue

            node.append(Annotation.Jaxb.simple(element.attrib["name"]))
            enum_values = element.findall(Annotation.Tag.enumeration) or []
            base = element.find(".//" + Annotation.Tag.restriction).attrib
            
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
            
            elif enum_values:
                node.append(Annotation.Jaxb.enum_start(element.attrib["name"]))
                node.extend([Annotation.Jaxb.enum_member(enum.attrib["value"], enum.attrib["value"]) for enum in enum_values])
                node.append(Annotation.Jaxb.enum_end)
                node.append(Annotation.Jaxb.end)

            else:
                constraints = {**transposition.get(element.attrib["name"], {}), **self.generate_constraints(element)}
                if self.config.constraint_methode == "xjb":
                    node.extend(constraints.values())

                if base is not None and base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean", "date", "dateTime"]:
                    if base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean"] :
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"])))
                        node.append(Annotation.Jaxb.end)

                    elif base.get("base") == "date":
                        node.append(Annotation.Jaxb.java_type("java.sql.Timestamp"))
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(element.attrib["name"])))
                        node.append(Annotation.Annox.field_add(Annotation.Xml.adapter("com.aixm.delorean.core.adapter.date.XMLGregorianCalendarAdapter.class")))
                        node.append(Annotation.Jaxb.end)
                    
                    elif base.get("base") == "dateTime":
                        node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                        node.append(Annotation.Jaxb.end)

                elif base is not None and "aixm" in base.get("base",None) :
                    node = []
                    
                else:
                    print(element.attrib, base)


            res.extend(node)

        return res
    
    def generate_complex_types(self, type, embed, abstract):
        res = []
        for element in type :
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in self.config.ignore:
                continue

            res.append(Annotation.Jaxb.complex(element.attrib["name"]))
            res.extend(self.class_writer(element, embed, abstract))
            res.append(Annotation.Jaxb.end)

            parent_xpath = Annotation.Jaxb.complex_xpath(element.attrib.get("name"))
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

            parent_xpath = Annotation.Jaxb.group_xpath(element.attrib.get("name"))
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
        simple_content = parent.find(Annotation.Tag.simple_content)
        if simple_content is not None:
            extension = simple_content.find(Annotation.Tag.extension)
            restriction = simple_content.find(Annotation.Tag.restriction)

            attribute_list = []

            if extension is not None:
                attribute_list.extend(extension.findall(".//" + Annotation.Tag.attribute))
            
            if restriction is not None:
                attribute_list.extend(restriction.findall(".//" + Annotation.Tag.attribute))

            for attribute in attribute_list:
                node.extend(self.handel_simple_attribute(attribute, parent, embed, parent_xpath))

        return node
    
    def process_sequence(self, parent, embed, parent_xpath):
        """Process the sequence flow."""
        node = []
        sequence_list = parent.findall(Annotation.Tag.sequence) or []
        for sequence in sequence_list:
            element_list = sequence.findall(".//" + Annotation.Tag.element, Annotation.Tag.namespaces) or []
            attribute_list = sequence.findall(".//" + Annotation.Tag.attribute, Annotation.Tag.namespaces) or []

            for element in element_list :
                node.extend(self.handle_sequence_element(element, parent, embed, parent_xpath))

            for attribute in attribute_list :
                node.extend(self.handle_sequence_attribute(attribute, parent, embed, parent_xpath))
        
        return node

    def process_complex_content(self, parent, embed, parent_xpath) :
        """Process the complexContent flow."""
        node = []
        complex_content = parent.find(Annotation.Tag.complex_content)
        if complex_content is not None:
            extension = complex_content.find(Annotation.Tag.extension)
            restriction = complex_content.find(Annotation.Tag.restriction)

            attribute_list = []
            element_list = []

            if extension is not None:
                attribute_list.extend(extension.findall(".//" + Annotation.Tag.attribute))
                element_list.extend(extension.findall(".//" + Annotation.Tag.element)) 

            if restriction is not None:
                attribute_list.extend(restriction.findall(".//" + Annotation.Tag.attribute))
                element_list.extend(restriction.findall(".//" + Annotation.Tag.element)) 

            for attribute in attribute_list:
                node.extend(self.handle_complex_attribute(attribute, parent, embed, parent_xpath))

            for element in element_list:
                node.extend(self.handle_complex_element(element, parent, embed, parent_xpath))
        
        return node
    
    def handel_simple_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle attributes in simpleContent."""
        node = []
        node.append(Annotation.Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath))

        if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
            node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
            node.append(Annotation.Jaxb.end)
            return node

        if attribute.attrib.get("name") == "name":
            node.append(Annotation.Jaxb.property.name())

        name = parent.attrib.get("name") + "_" + attribute.attrib.get("name")
        node.append(Annotation.Annox.field_add(Annotation.Jpa.column(name)))
        node.append(Annotation.Jaxb.end)
        return node

    def handle_sequence_element(self, element, parent, embed, parent_xpath):
        """Handle elements in a sequence."""
        node = []
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Annotation.Jaxb.element(element.attrib.get("ref"),parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value ,at="ref"))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Annotation.Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annotation.Annox.field_add(Annotation.Jpa.id))
                node.append(Annotation.Annox.field_add(Annotation.Jpa.generated_value()))
                node.append(Annotation.Annox.field_add(Annotation.Jpa.column("id", nullable=False, unique=True)))
                node.append(Annotation.Annox.field_add(Annotation.Xml.transient))
                node.append(Annotation.Jaxb.end)
                return node

            else :
                if element.attrib.get("name") == "name":
                    node.append(Annotation.Jaxb.property.name_element())
                else :
                    node.append(Annotation.Jaxb.property.element)

        else :
            print(element.attrib)

        node.extend(self.generate_cardinality(parent, element, embed))
        node.append(Annotation.Jaxb.end)

        return node

    def handle_sequence_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle restrictions in content."""
        node = []
        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Annotation.Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Annotation.Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            if attribute.attrib.get("name") == "name":
                node.append(Annotation.Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(self.generate_cardinality(parent, attribute, embed))
        node.append(Annotation.Jaxb.end)

        return node

    def handle_complex_element(self, element, parent, embed, parent_xpath):
        """Handle attributes in a sequence."""
        node = []
        if element.attrib.get("ref") is not None and element.attrib.get("name") is None :
            node.append(Annotation.Jaxb.element(element.attrib.get("ref"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value, at="ref"))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node

        elif element.attrib.get("name") is not None:
            node.append(Annotation.Jaxb.element(element.attrib.get("name"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value))
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
            if element.attrib.get("name") == "dbid":
                node.append(Annotation.Jaxb.field_add(Annotation.Jpa.id))
                node.append(Annotation.Jaxb.field_add(Annotation.Jpa.generated_value))
                node.append(Annotation.Jaxb.field_add(Annotation.Jpa.column("id", nullable=False, unique=True)))
                node.append(Annotation.Jaxb.field_add(Annotation.Xml.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
            if element.attrib.get("name") == "name":
                node.append(Annotation.Jaxb.property.name_element())
            else :
                node.append(Annotation.Jaxb.property.element)
        else : 
            print(element.attrib)

        node.extend(self.generate_cardinality(parent, element, embed))
        node.append(Annotation.Jaxb.end)

        return node

    def handle_complex_attribute(self, attribute, parent, embed, parent_xpath):
        """Handle elements in a sequence."""
        node = []

        if attribute.attrib.get("ref") is not None and attribute.attrib.get("name") is None :
            node.append(Annotation.Jaxb.attribute(attribute.attrib.get("ref"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value, at="ref"))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
        elif attribute.attrib.get("name") is not None:
            node.append(Annotation.Jaxb.attribute(attribute.attrib.get("name"), parent=parent_xpath, xpath=Annotation.Xpath.GLOBAL.value))
            if attribute.attrib.get("name") in self.config.transient or attribute.attrib.get("ref") in self.config.transient or attribute.attrib.get("type") in self.config.transient:
                node.append(Annotation.Annox.field_add(Annotation.Jpa.transient))
                node.append(Annotation.Jaxb.end)
                return node
            
            if attribute.attrib.get("name") == "name":
                node.append(Annotation.Jaxb.property.name())

        else : 
            print(attribute.attrib)

        node.extend(self.generate_cardinality(parent, attribute, embed))
        node.append(Annotation.Jaxb.end)

        return node
    
    def class_writer(self, element, embed, asbtract):
        node = []
        if element.attrib.get("name") in asbtract:
            self.entity_feature.append(element.attrib["name"])
            node.append(Annotation.Annox.class_add(Annotation.Jpa.entity))
            node.append(Annotation.Annox.class_add(Annotation.Jpa.relation.inhertiance()))
            return node
        
        sub_element_list = element.findall(".//"+ Annotation.Tag.element) or []
        for sub_element in sub_element_list:
            if sub_element.attrib.get("name") == "dbid":
                xmlt_type_name = element.attrib.get("name").replace("TimeSlicePropertyType", "")
                if xmlt_type_name.isupper():
                    xmlt_type_name = xmlt_type_name.lower() + "TimeSlice"

                else:
                    xmlt_type_name = xmlt_type_name[0].lower() + xmlt_type_name[1:] + "TimeSlice"

                node.append(Annotation.Annox.class_add(Annotation.Xml.type(element.attrib["name"], xmlt_type_name)))

        if element.attrib.get("name") in embed.keys():
            node.append(Annotation.Annox.class_add(Annotation.Jpa.embeddable))
            return node
        
        self.entity_feature.append(element.attrib["name"])
        node.append(Annotation.Annox.class_add(Annotation.Jpa.entity))
        node.append(Annotation.Annox.class_add(Annotation.Jpa.table(element.attrib["name"],"public")))

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