import os
import json
import xml.etree.ElementTree as ET

class HeleperFunction:

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
            tree = ET.parse(file_path)
            root = tree.getroot()
            return root
        except ET.ParseError as e:
            raise ValueError(f"Invalid XML in '{name}': {e}")

