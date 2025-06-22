import os
import re
import json
from lib.parsing import Parsing

class InteractionMachinery:
    def __init__(self, name, parsing, path, directory,):
        self.name = name
        self.attributes = self.load_attribute(path)
        self.parsing = Parsing(parsing, self.attributes)
        self.files = self.get_file_path(directory)
        self.layer = self.get_layers()

        self.export_sql()
       

    import os

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


    def load_attribute(self, path):
        file_path = os.path.join(path, "attributes.json")
        
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"'attributes.json' not found at: {file_path}")
        
        with open(file_path, 'r', encoding='utf-8') as f:
            try:
                data = json.load(f)
                return data
            except json.JSONDecodeError as e:
                raise ValueError(f"Invalid JSON in 'attributes.json': {e}")
            
    def get_layers(self):
        """Process each Java file and extract relevant information."""
        self.parsing.process(self.files)
        return self.parsing.get_layer()


    def export_sql(self):
        res = ""
        for layer in self.layer:
            res +="\n" + layer.generate_sql()

        # Ensure the viewgen folder exists
        os.makedirs("viewgen", exist_ok=True)

        # Build full path
        filepath = os.path.join("viewgen", f"{self.name}_publisher_view.sql")
        
        with open(filepath, "w", encoding="utf-8") as f:
            f.write(res)