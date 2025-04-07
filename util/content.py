from typing import List
from xsd import Xsd
import json
from control import Control, Action
from annotation import Property, Annox, Strategy, Jpa, Relation, Xpath,Tag, Jaxb, Xml
from validation import Validation
import xml.etree.ElementTree as ET

class Content: 

    def __init__(self, xsds: List[Xsd], config ): 
        self.content = {}
        for xsd in xsds:
            simple_type_content = xsd.get_simple_type()
            inherit_graph = self.build_inheritance_graph(simple_type_content)
            attrib_graph = self.build_attribute_graph(xsd.get_complex_type())
            transposition = self.build_transposition(simple_type_content, inherit_graph)
            # TODO 
            # if xsd.strategy == Strategy.data_type:
            #     self.config.embed = {**self.config.embed, **self.extract_embed(xsd.root, transposition)}
            # self.export_file("test_" + xsd.name.split("/")[-1] + ".json", {**config.embed, **self.extract_embed(xsd.root, transposition)})

            self.content[xsd.name] = {
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

            Control.log_action(
                    what="XSD processed",
                    success=True,
                    why=str(xsd.name),
                )
            
    def get_content(self):
        return self.content.items()

    def build_inheritance_graph(self, xml_type_list: list) -> dict:
        res = {}
        for element in xml_type_list:
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
    
    def build_attribute_graph(self, xml_type_list: list) -> dict:
        res = {}
        for element in xml_type_list:
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
    
    def export_file(self, file_path, content):
        with open(file_path, 'w') as f:
            f.write(json.dumps(content, indent=4))
    

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
