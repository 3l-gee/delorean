import os
import json
from lxml import etree
from lxml import html
from lib.parsing import Parsing
from lib.helper_function import HeleperFunction
import copy


class InteractionMachinery:
    def __init__(self, name, parsing, input_path, output_path, directory,):
        self.name = name
        # Attribute
        self.qlr_attr = HeleperFunction.load_json(input_path, "qlr.json")
        self.inheritance_attr = HeleperFunction.load_json(input_path, "inheritance.json")
        self.formated_sql = HeleperFunction.load_json(input_path, "sql.json")
        self.ignore_set = set(self.inheritance_attr["ignore"])

        # Templates
        self.publisher_qgis = HeleperFunction.load_xml(input_path, "xml/publisher.qgs.ftl")
        self.layer_tree_group = HeleperFunction.load_xml(input_path, "xml/layer-tree-group.xml")

        self.parsing = Parsing(parsing, self.inheritance_attr, self.formated_sql, input_path)
        self.files = self.get_file_path(directory)
        self.layers = self.get_layers()
        
        self.populate_qgis_prj(self.publisher_qgis)
        self.export_sql(output_path, "postgres/view.sql")
        self.export_publish_qgis(output_path, "qgis/publisher.qgs.ftl")
       
    def get_file_path(self, directory):
        # Common JAXB-generated files to ignore
        jaxb_ignored_files = {
            "package-info.java",
            "ObjectFactory.java"
        }

        return [
            os.path.join(directory, f)
            for f in os.listdir(directory)
            if f.endswith(".java") and f not in jaxb_ignored_files
        ]
                   
    def export_publish_qgis(self, output_path, name):
        file_path = os.path.join(output_path, name).replace("\\", "/")

        try:
            xml_str = etree.tostring(self.publisher_qgis, method='xml', encoding='utf-8', pretty_print=True)

            with open(file_path, 'wb') as f:
                f.write(xml_str)

        except Exception as e:
            raise IOError(f"Failed to export XML to '{file_path}': {e}")

            
    def export_sql(self, output_path, name):
        file_path = os.path.join(output_path, name)

        res = ""
        for layer, deps in self.layers.values():
            res += f"-- {layer.get_type()}\n" + f"-- {deps}\n" + layer.get_sql() + "\n"
        
        with open(file_path, "w", encoding="utf-8") as f:
            f.write(res)

    def get_layers(self):
        """Process each Java file and extract relevant information."""
        self.parsing.process(self.files)
        return self.parsing.get_layer()
    
    def populate_qgis_prj(self, prj) : 
        project_layers = prj.find(".//projectlayers")
        layer_tree_group = prj.find(".//layer-tree-group")

        layer_tree_group_dict = {}
        
        for layer, _ in self.layers.values():
            if layer.get_type() not in self.ignore_set:
                
                if not layer_tree_group_dict.get(layer.get_schema()) and layer_tree_group_dict.get(layer.get_schema()) is not None:
                    layer_tree_group_schema = copy.deepcopy(self.layer_tree_group)
                    layer_tree_group_schema.set("name", layer.get_schema())
                    layer_tree_group_dict[layer.get_schema()] = layer_tree_group_schema

                for publish_layer in layer.get_publish_layer():
                    project_layers.append(publish_layer.get("maplayer"))
                    layer_tree_group_dict[layer.get_schema()].append(publish_layer.get("layertree"))
            else : 
                print("Ignored : ", layer.get_type())
        
        for key, group in layer_tree_group_dict.items() :
            layer_tree_group.append(group)
