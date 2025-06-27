import re

from lib.feature import Feature
from lib.property import Property

class Parsing :
    def __init__(self, parsing, attribute):
        self.parsing = parsing
        self.ignore_set = set(attribute["ignore"])
        self.feature_parent_set = set(attribute["feature_parents"])
        self.timeslice_parent_set = set(attribute["timeslice_parents"])
        self.object_parent_set = set(attribute["object_parents"])
        self.property_parent_set = set(attribute["property_parents"])

        self.suffix = {
            "TimeSlicePropertyType": "",
            "PropertyType": "",
            "TimeSliceType": "",
            "TimeSlice": "",
            "Type": "", 
        }
        
        self.feature = {}
        self.property = {}
        self.datatype = {}

    def get_layer(self):
        # return list(self.feature.values()).extend(list(self.property.values()))
        return list(self.property.values())
    
    def _load_content(self, path):
        with open(path, 'r', encoding='utf-8') as file:
            content = file.read()
        return content
    
    def process(self, path_list):
        for file in path_list:
            self._classify_file(file)

        for file in path_list:
            self._process_file(file)

    def _classify_file(self, path):
        content = self._load_content(path)

        table = re.search(self.parsing["table"]["method"], content)
        if not table:
            return  # Skip files that do not contain table annotations
                
        table_name, table_schema = table.groups()
        class_name = re.findall(self.parsing["class"]["method"], content)
        parent_name = re.findall(self.parsing["extends"]["method"], content)

        if class_name[0] in self.ignore_set:
            return  # Ignore specific classes
        
        if parent_name and (parent_name[0] in self.feature_parent_set or parent_name[0] in self.timeslice_parent_set) :
            pass
            # name = class_name[0]
            # for suffix, replacement in self.suffix.items():
            #     name = name.replace(suffix, replacement)

            # name = name.lower()
            
            # if name not in self.feature.keys() : 
            #     self.feature[name] = Feature(name, table_schema)
        
        if parent_name and parent_name[0] in self.property_parent_set:
            name = class_name[0]
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()
            if name not in self.property.keys() : 
                self.property[name] = Property(name, table_schema)

        if parent_name and parent_name[0] in self.object_parent_set:
            name = class_name[0]
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()
            if name not in self.property.keys() : 
                self.property[name] = Property(name, table_schema)
        
    def _process_file(self, path):
        content = self._load_content(path)   
        class_name = re.findall(self.parsing["class"]["method"], content)
        parent_name = re.findall(self.parsing["extends"]["method"], content)
        name = class_name[0]
        for suffix, replacement in self.suffix.items():
            name = name.replace(suffix, replacement)

        name = name.lower()

        if name in self.feature.keys():
            if parent_name and parent_name[0] in self.feature_parent_set:
                pass

            if parent_name and parent_name[0] in self.timeslice_parent_set:
                self._process_time_slice(self.feature[name], content)

        if name in self.property.keys():
            if parent_name and parent_name[0] in self.object_parent_set:
                self._process_object(self.property[name], content)
            

    def _process_time_slice(self, layer, content):
        for item in self.extract_embedded_columns_two(content):
            layer.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            layer.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        for item in self.extract_one_to_one(content):
            name = item.get("type")
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()

            if name in self.feature.keys():
                group = self.feature[name].get_group()
                layer.add_association_feature_one(group, name, item.get("role"),item.get("col"))

    def _process_property(self, property, content):
        for item in self.extract_embedded_columns_two(content):
            property.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            property.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        for item in self.extract_one_to_one(content):
            name = item.get("type")
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()

            if name in self.property.keys():
                group = self.property[name].get_group()
                property.add_association_feature_one(group, name, item.get("role"),item.get("col"))

    def _process_object(self, property, content):
        for item in self.extract_embedded_columns_two(content):
            property.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            property.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        for item in self.extract_one_to_one(content):
            name = item.get("type")
            for suffix, replacement in self.suffix.items():
                name = name.replace(suffix, replacement)

            name = name.lower()

            if name in self.property.keys():
                group = self.property[name].get_group()
                property.add_association_feature_one(group, name, item.get("role"),item.get("col"))

    def process_file_old(self, path):
        """Extract table, class, and column information from a Java file."""

        content = self._load_content(path)



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
            value, uom, nil, type = column[0], column[1], column[2], column[3]
            embedded_columns.append({
                "value" : value,
                "uom" : uom,
                "nil" : nil,
                "type" : type
            })
 
        return embedded_columns

    def extract_one_to_one(self, content):
        """Extract one-to-one relationships."""
        res = []
        raw_one_to_one = re.findall(self.parsing["one_to_one"]["method"], content)
        for column in raw_one_to_one:
            col, ref, type, role = column[0], column[1], column[2], column[3]
            res.append({
                "col" : col,
                "ref" : ref,
                "type" : type,
                "role" : role.lower()
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