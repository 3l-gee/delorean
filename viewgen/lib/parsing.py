import re

from lib.publisher_layer import Layer

class Parsing :
    def __init__(self, parsing, attribute):
        self.parsing = parsing
        self.ignore_set = set(attribute["ignore"])
        self.feature_parent_set = set(attribute["feature_parents"])
        self.timeslice_parent_set = set(attribute["timeslice_parents"])
        self.object_parent_set = set(attribute["object_parents"])
        self.property_paremt_set = set(attribute["property_parents"])

        self.suffix = {
            "TimeSlicePropertyType": "",
            "PropertyType": "",
            "TimeSliceType": "",
            "TimeSlice": "",
            "Type": "", 
        }
        
        self.feature = {}
        self.datatype = {}

    def load_content(self, path):
        with open(path, 'r', encoding='utf-8') as file:
            content = file.read()
        return content
    
    def process(self, path_list):
        for file in path_list:
            self.classify_file(file)

    def get_layer(self):
        return list(self.feature.values())

    def classify_file(self, path):
        content = self.load_content(path)

        table = re.search(self.parsing["table"]["method"], content)
        if not table:
            return  # Skip files that do not contain table annotations
                
        table_name, table_schema = table.groups()
        class_name = re.findall(self.parsing["class"]["method"], content)
        parent_name = re.findall(self.parsing["extends"]["method"], content)

        if class_name[0] in self.ignore_set:
            return  # Ignore specific classes
        
        if parent_name and parent_name[0] in self.feature_parent_set:
            name = class_name[0]
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()
            
            if name not in self.feature.keys() : 
                self.feature[name] = self.process_layer(name, content, Layer(name, table_schema))
            if name in self.feature.keys() : 
                self.feature[name] = self.process_layer(name, content, self.feature[name])

        if parent_name and parent_name[0] in self.timeslice_parent_set:
            name = class_name[0]
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()

            if name not in self.feature.keys() : 
                self.feature[name] = self.process_layer(name, content, Layer(name, table_schema))
            if name in self.feature.keys() : 
                self.feature[name] = self.process_layer(name, content, self.feature[name])

        if parent_name and parent_name[0] in self.property_paremt_set:
            return

        if parent_name and parent_name[0] in self.object_parent_set:
            return
        
    def process_layer(self, name, content, layer):

        for item in self.extract_embedded_columns_two(content):
            layer.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            layer.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        return layer
    
    def process_file_old(self, path):
        """Extract table, class, and column information from a Java file."""

        content = self.load_content(path)



        table_name, schema = table_match.groups()
        full_table_name = str(schema + "." + table_name)
        class_name = re.findall(self.parsing["class"]["method"], content)
        if class_name and class_name[0] in  self.ignore_set:
            return
    
        self.views["table_name"][class_name[0]] = full_table_name

        feature_name = class_name[0]
        class_name = {
            "info": class_name[0],
            "table": full_table_name
        }
        parent_name = re.findall(self.parsing["extends"]["method"], content) or [None]
        
        if parent_name[0] in self.attributes["feature_parents"] :
            self.views["top_timeslice_selection"].append(full_table_name)


        columns = self.extract_columns(schema, table_name, content)
        parent_columns = self.extract_parent_columns(schema, table_name, parent_name)
        embedded_columns = self.extract_embedded_columns(schema, table_name, content)
        one_to_one = self.extract_one_to_one(schema, table_name, content)
        one_to_many = self.extract_one_to_many(schema, table_name, content)

        self.update_views(feature_name, class_name, parent_name, columns, parent_columns, embedded_columns, one_to_one, one_to_many)

        

    def extract_columns(self, schema, table, content):
        """Extract simple column definitions."""
        raw_columns = re.findall(self.parsing["column"]["method"], content)
        return [f"{schema}.{table}.{col}" for col in raw_columns]

    def extract_parent_columns(self, schema, table, parent_name):
        """Extract inherited columns from parent classes."""
        parent_columns = self.attributes["parents_attributes"].get(parent_name[0], [])
        return [f"{schema}.{table}.{col}" for col in parent_columns]

    def extract_embedded_columns_two(self, content):
        """Extract embedded attributes (2 or 3 columns)."""
        embedded_columns = []
        raw_embedded_two = re.findall(self.parsing["embedded_two"]["method"], content)
        for column in raw_embedded_two:
            print(column)
            value, nil, type = column[0], column[1], column[2]
            embedded_columns.append({
                "value" : value,
                "nil" : nil,
                "type" : type
            })

        return embedded_columns
    
    def extract_embedded_columns_three(self, content):
        """Extract embedded attributes (2 or 3 columns)."""
        embedded_columns = []
        raw_embedded_three = re.findall(self.parsing["embedded_three"]["method"], content)
        for column in raw_embedded_three:
            print(column)
            value, uom, nil, type = column[0], column[1], column[2], column[3]
            embedded_columns.append({
                "value" : value,
                "uom" : uom,
                "nil" : nil,
                "type" : type
            })


        return embedded_columns

    def extract_one_to_one(self, schema, table, content):
        """Extract one-to-one relationships."""
        res = []
        raw_one_to_one = re.findall(self.parsing["one_to_one"]["method"], content)
        for col in raw_one_to_one:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[2],
                "join_condition": f"{schema}.{table}.{col[0]} = {col[2]}.{col[1]}"
            })
        return res

    def extract_one_to_many(self, schema, table, content):
        """Extract one-to-many relationships."""
        res = []
        raw_one_to_many = re.findall(self.parsing["one_to_many"]["method"], content)
        for col in raw_one_to_many:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[3],
                "join_table": f"{schema}.{col[0]}",
                "first_join": f"{schema}.{table}.id = {col[0]}.{col[1]}",
                "second_join" : f"{col[0]}.{col[2]} = {col[3]}.id"
            })
        return res