from enum import Enum
import xml.etree.ElementTree as ET
from lxml import etree
from typing import List
import os
import json
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
    
    def __init__(self, config_dict: dict, debug_dict: dict, schema_dict: dict, xsds_dict: List[dict]): 
        self.xsds = [Xsd(xsd["name"], xsd["path"], xsd["strategy"], xsd["manual"], xsd.get("package")) for xsd in xsds_dict]
        self.config = Config(config_dict)
        self.debug = Debug(debug_dict) if debug_dict["mode"] else Debug({})
        self.view = View(schema_dict)
        self.xjb = self.init_xjb(self.xsds)
        self.content = self.init_content(self.xsds)
        self.abstract_feature = {}
        self.entity_feature = [] # todo make it a dict
        self.ignore_feature = {}
        self.column_definition = {}
        self.folder = {}
        self.table_name = {}

        self.generate_xjb()
        self.export_xjb()
        # for key, value in self.content.items() :
            # self.export_file("types.txt", value["simple_type"]["type"])

        # self.print_entity_class(self.entity_feature)
        # Control.print_actions(True)

    def export_file(self, file_path, content):
        with open(file_path, 'w') as f:
            f.write(json.dumps(content, indent=4))
    
    def init_content(self, xsds: List[Xsd]): 
        res = {}
        for xsd in xsds:
            simple_type_content = xsd.get_simple_type()
            inherit_graph = self.build_inheritance_graph(simple_type_content)
            attrib_graph = self.build_attribute_graph(xsd.get_complex_type())
            transposition = self.build_transposition(simple_type_content, inherit_graph)
            if xsd.strategy == Strategy.data_type:
                self.config.embed = {**self.config.embed, **self.extract_embed(xsd.root, transposition)}

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
                    "type" : xsd.get_groups(),
                }
            }

        return res
    
    def extract_embed(self, root, transposition):
        res = {}
        complexType = root.findall(Tag.complex_type) or []
        for element in complexType:
            name = element.attrib["name"]
            simple_content = element.find(Tag.simple_content)

            if simple_content is None:
                res[name] = {}
                continue

            base = simple_content.find(Tag.extension)
            base_name = base.attrib["base"]
            try : 
                base_name = base_name.split(":")[-1]
            except:
                pass
            res[name] = {"value" : transposition[base_name],}

            attributes = base.findall(Tag.attribute) or []
            for attribute in attributes:
                type = attribute.attrib.get("type", attribute.attrib.get("ref"))
                try : 
                    type = type.split(":")[-1]
                except:
                    pass
                res[name][attribute.attrib["name"]] = transposition.get(type, {})
            
        return res
    
    def build_inheritance_graph(self, type):
        res = {}
        for element in type:
            base = element.findall(Tag.extension) or element.findall(Tag.restriction) or []
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
            attributes = element.findall(".//"+ Tag.attribute) or []
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
        dict = {}
        for element in type:
            name = element.attrib["name"]
            constraints = Validation.generate_constraints(element)
            transposition[name] = constraints

        for element in type:
            name = element.attrib["name"]
            constraints = transposition[name]
            if name in graph.keys():
                for sub_name in graph[name]:
                    transposition[sub_name] = {**transposition[sub_name], **transposition[name]}
    
        return transposition
    
    def graph_traversal(self,element, name, graph, dict=None):
        if dict is None:
            dict = {}

        if name in graph.keys():
           
            deep_dict = {}
            for item in graph[name]:
                deep_dict.update({item : Validation.generate_constraints(element)})
                deep_dict.update(self.graph_traversal(element, item, graph))
                
                dict.update(deep_dict)
        return dict       
                                                    
    def generate_xjb(self):
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_simple_types(value["simple_type"]["type"], value["simple_type"]["graph"], value["simple_type"]["transposition"]))
            
            self.export_file("graph.txt", value["simple_type"]["graph"])
            self.export_file("transposition.txt", value["simple_type"]["transposition"])
            self.export_file("embed_feature.txt", self.config.embed)
            
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_complex_types(value["complex_type"]["type"], self.config.embed, self.config.abstract))
                        
        for key, value in self.content.items() :
            self.xjb[key]["auto"]["default"].extend(
                self.generate_groupe_types(value["group"]["type"], self.config.embed, self.config.abstract))
    
    def generate_simple_types(self, type, graph, transposition):
        res = []
        for element in type:
            node = []
            if element is None :
                print("element is None : ", element, type)
                continue

            if element.attrib["name"] in graph["attribute"].keys() or element.attrib["name"] in graph["inheritance"].keys() or element.attrib["name"] in self.config.ignore:
                continue

            node.append(Jaxb.simple(element.attrib["name"]))
            enum_values = element.findall(Tag.enumeration) or []
            base = element.find(".//" + Tag.restriction).attrib
            
            if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
                node.append(Annox.field_add(Jpa.transient))
                node.append(Jaxb.end)
            
            elif enum_values:
                node.append(Jaxb.enum_start(element.attrib["name"]))
                node.extend([Jaxb.enum_member(enum.attrib["value"], enum.attrib["value"]) for enum in enum_values])
                node.append(Jaxb.enum_end)
                node.append(Jaxb.end)

            else:
                constraints = {**transposition.get(element.attrib["name"], {}), **Validation.generate_constraints(element)}
                
                # if self.config.constraint_methode == "xjb":
                #     size = constraints.get("size")
                #     pattern = constraints.get("pattern")

                #     if size is not None:
                #         node.append(size)
                #     if pattern is not None:
                #         node.append(pattern)

                if base is not None and base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean", "date", "dateTime"]:
                    if base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean"] :
                        # node.append(Annox.field_add(Jpa.column(element.attrib["name"], constraints.get("column_length"))))
                        node.append(Jaxb.end)

                    elif base.get("base") == "date":
                        node.append(Jaxb.java_type("java.sql.Timestamp"))
                        # node.append(Annox.field_add(Jpa.column(element.attrib["name"], constraints.get("column_length"))))
                        node.append(Annox.field_add(Xml.adapter("com.aixm.delorean.core.adapter.date.XMLGregorianCalendarAdapter.class")))
                        node.append(Jaxb.end)
                    
                    elif base.get("base") == "dateTime":
                        node.append(Annox.field_add(Jpa.transient))
                        node.append(Jaxb.end)

                elif base is not None and "aixm" in base.get("base",None) :
                    node = []
                    # node.append(Annox.field_add(Jpa.column("value", constraints.get("column_length"))))
                    # node.append(Jaxb.end)
                    
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

            schema = self.view.get_schema(element.attrib.get("name"))

            res.append(Jaxb.complex(element.attrib["name"]))
            res.extend(self.class_writer(element, embed, abstract, schema))
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