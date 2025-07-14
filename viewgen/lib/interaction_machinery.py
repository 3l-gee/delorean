import os
import re
import json
import xml.etree.ElementTree as ET
from lib.parsing import Parsing
from lib.helper_function import HeleperFunction


class InteractionMachinery:
    def __init__(self, name, parsing, input_path, output_path, directory,):
        self.name = name
        self.attributes = HeleperFunction.load_json(input_path, "attributes.json")
        self.publisher_qgis = HeleperFunction.load_xml(input_path, "xml/publisher.qgs.ftl")
        self.parsing = Parsing(parsing, self.attributes, input_path)
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

    def load_json(self, path, name):
        file_path = os.path.join(path, name)
        
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'{name}' not found at: {file_path}")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            try:
                data = json.load(f)
                return data
            except json.JSONDecodeError as e:
                raise ValueError(f"Invalid JSON in '{name}': {e}")
            
    def load_xml(self, path, name):
        file_path = os.path.join(path, name)

        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'{name}' not found at: {file_path}")

        try:
            tree = ET.parse(file_path)
            root = tree.getroot()
            return root
        except ET.ParseError as e:
            raise ValueError(f"Invalid XML in '{name}': {e}")
        

    def export_publish_qgis(self, output_path, name):
        file_path = os.path.join(output_path, name)

        try:
            tree = ET.ElementTree(self.publisher_qgis)
            tree.write(file_path, "utf-8", True)
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
        
        # count = 0
        for layer, _ in self.layers.values():
            for key, publish_layer in layer.get_publish_layer().items():
                # if count % 10 == 0:
                project_layers.append(publish_layer.get("maplayer"))
                layer_tree_group.append(publish_layer.get("layertree"))
                # count += 1

    # def populate_tree_layer(self, noide, layer) :
    #     layer_tree_group = {}
    #     for layer, _ in self.layers.values():
    #         for publish_layer in layer.get_publish_layer():
    #             if layer_tree_group.get(layer.get_schema()) :
    #                 layer_tree_group[layer.get_schema()] = [{
    #                     "name" : layer.get_name(),
    #                     "id" :
    #                 }]


    #         schema_set.add(layer.get_schema())
    #         layer.get_name()

        

            
        # if title is not None:
        #     title.text = "test"
