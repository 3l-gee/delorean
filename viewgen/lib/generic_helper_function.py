import os
import json
from lxml import etree
from lxml import html

class GenericHeleperFunction:

    @staticmethod
    def load_json(path, name):
        file_path = os.path.join(path, name)
        
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'{name}' not found at: {file_path}")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            try:
                data = json.load(f)
                return data
            except json.JSONDecodeError as e:
                raise ValueError(f"Invalid JSON in '{name}': {e}")
            
    @staticmethod
    def load_xml(path, name):
        file_path = os.path.join(path, name)

        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'{name}' not found at: {file_path}")

        try:
            tree = etree.parse(file_path)
            root = tree.getroot()
            return root
        except etree .XMLSyntaxError  as e:
            raise ValueError(f"Invalid XML in '{name}': {e}")
        
    @staticmethod
    def load_html(path, name):
        file_path = os.path.join(path, name)

        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'{name}' not found at: {file_path}")

        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                raw_html = f.read()
            return raw_html
        except Exception as e:
            raise ValueError(f"Error loading HTML '{name}': {e}")
        
    @staticmethod
    def format_structure(structure, **kwargs):
        """
        Recursively formats all strings in a nested structure using Python's str.format().
        """
        if isinstance(structure, dict):
            return {k: GenericHeleperFunction.format_structure(v, **kwargs) for k, v in structure.items()}
        elif isinstance(structure, list):
            return [GenericHeleperFunction.format_structure(item, **kwargs) for item in structure]
        elif isinstance(structure, str):
            return structure.format(**kwargs)
        else:
            return structure
        
    @staticmethod
    def remove_suffix(name):
        suffixes = [
            "TimeSlicePropertyType",
            "PropertyType",
            "TimeSliceType",
            "TimeSlice",
            "Type",
        ]

        for suffix in suffixes:
            if name.endswith(suffix):
                name = name[: -len(suffix)]
                break

        return name.lower()




