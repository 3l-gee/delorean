import os
import re
import json

# Configuration for extracting annotations
views_config = {
    "table": {
        "method": r'@Table\(name = "([A-Z|a-z|0-9|_]+)", schema = "([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "class" : {
        "method" : r'public class ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "extends" : {
        "method" : r'extends ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "column": {
        "method": r'@Column\(name = "([A-Z|a-z|0-9|_]+)"',
        "ignore": [],
    },
    "one_to_one": {
        "method": r'@JoinColumn\(name = "([A-Z|a-z|0-9|_]+)", referencedColumnName = "([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "one_to_many": {
        "method": r'@JoinTable\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*,\s*joinColumns\s*=\s*\{\s*@JoinColumn\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*\)\s*\},\s*inverseJoinColumns\s*=\s*\{\s*@JoinColumn\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*\)\s*\}\s*\)',
        "ignore": [],
    },
}

class ViewGenerationScript:
    def __init__(self, config, directory):
        self.config = config
        self.directory = directory
        self.files = [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith(".java")]
        self.views = {
            "features": {},
            "objects": {},
            "properties": {},
            "time_slices": {},
        }

    def run(self):
        for file in self.files:
            self.process_file(file)

        self.save_to_file(self.views)

    def process_file(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        table_match = re.search(self.config["table"]["method"], content)
        if table_match:
            table_name = table_match.group(1)
            schema = table_match.group(2)
            full_table_name = f"{schema}.{table_name}"

            class_name = re.findall(self.config["class"]["method"], content)
            parent_name = re.findall(self.config["extends"]["method"], content)
            raw_columns = re.findall(self.config["column"]["method"], content)
            columns = self.process_columns(table_name, raw_columns)
            raw_one_to_one = re.findall(self.config["one_to_one"]["method"], content)
            raw_one_to_many = re.findall(self.config["one_to_many"]["method"], content)

            self.views[full_table_name] = {
                "info" : {
                    "class" : list(class_name),
                    "parent" : list(parent_name)
                },
                "selects" : list(columns),
                "one_to_one" : list(raw_one_to_one),
                "one_to_many" : list(raw_one_to_many)
            }
    
    @staticmethod
    def process_columns(name, columns):
        return [f"{name}.{column}" for column in columns]

    @staticmethod
    def process_one_to_one(name, columns):
        return [f"{name}.{column}" for column in columns]


    def save_to_file(self, views):
        with open('views.json', 'w', encoding='utf-8') as file:
            json.dump(views, file, indent=4)

# Run the script
compilationScript = ViewGenerationScript(views_config, "util/postgres/test_dir")
compilationScript.run()
