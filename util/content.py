from typing import List
from xsd import Xsd

class Content: 

    def __init__(self, xsds: List[Xsd]): 
        self.content = {}
        for xsd in xsds:
            simple_type_content = xsd.get_simple_type()
            inherit_graph = self.build_inheritance_graph(simple_type_content)
            attrib_graph = self.build_attribute_graph(xsd.get_complex_type())
            transposition = self.build_transposition(simple_type_content, inherit_graph)
            if xsd.strategy == Strategy.data_type:
                self.config.embed = {**self.config.embed, **self.extract_embed(xsd.root, transposition)}

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
