import re
import json
from collections import defaultdict, deque
from lib.feature import Feature
from lib.property import Property

class Parsing :
    def __init__(self, parsing, inheritance, input_path):
        self.parsing = parsing
        self.input_path = input_path
        # self.snowflake_set = attribute["snowflake"]
        self.ignore_set = set(inheritance["ignore"])
        self.feature_set = set(inheritance["features"])
        self.timeslice_parent_set = set(inheritance["timeslice_parent"])
        self.object_set = set(inheritance["objects"])
        self.property_parent_set = set(inheritance["property_parent"])

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
        propeties_layers = self.property.values()
    
        # Create a mapping from view name to the view object
        view_map = {layer.get_name(): layer for layer in propeties_layers}

        in_degree = defaultdict(int)
        graph = defaultdict(list)

        for layer in propeties_layers:
            for dep in layer.get_dependecy():
                if dep not in view_map:
                    print(f"⚠️ Missing dependency: {dep} (required by {layer.get_name()})")

                else :
                    graph[dep].append(layer.get_name())
                    in_degree[layer.get_name()] += 1

        # Queue for views with no dependencies
        queue = deque([name for name in view_map if in_degree[name] == 0])
        sorted_layers = {}

        while queue:

            name = queue.popleft()
            layer = view_map[name]
            dependencies = layer.get_dependecy()

            sorted_layers[layer.get_type()] = ((layer, dependencies))

            for neighbor in graph[name]:
                in_degree[neighbor] -= 1
                if in_degree[neighbor] == 0:
                    queue.append(neighbor)

        for prop in self.property.values():
            if prop.get_type() not in sorted_layers:
                print(" * : ", prop.get_type() + "Missing in sorted_layers")
  
        # Merge with features
        feaures_layers = list(self.feature.values())
        for item in feaures_layers:
            item.generate_sql()
            dependencies = item.get_dependecy()
            sorted_layers[item.get_type()] = (item, dependencies)

        return sorted_layers

    
    def _load_content(self, path):
        with open(path, 'r', encoding='utf-8') as file:
            content = file.read()
        return content
    
    def process(self, path_list):
        for file in path_list:
            self._classify_file(file)
        #     self.feature_list(file)

        # print(json.dumps({"parent_name": list(self.name)}, indent=4))

        # for file in path_list:
        #     self._process_file(file)

        # for key,feature in self.feature.items():
        #     feature.generate_sql()
        #     feature.genrate_prj()

        # for key,property in self.property.items():
        #     property.generate_sql()
        #     property.genrate_prj()

    def feature_list(self, path):
        content = self._load_content(path)
        table_name = re.search(self.parsing["table"]["method"], content)
        class_name = re.findall(self.parsing["class"]["method"], content)
        parent_name = re.findall(self.parsing["extends"]["method"], content)

        if class_name and class_name[0] in self.feature_set :
            return

        elif parent_name and parent_name[0] in self.property_parent_set:
            return
        
        elif class_name and class_name[0] in self.object_parent_set:
            # self.name.add(class_name[0])
            return
        
        elif parent_name and parent_name[0] in self.timeslice_parent_set:
            self.name.add(class_name[0])
            return
        
        elif class_name and class_name[0] in self.ignore_set:
            return
        
        elif parent_name :
            self.name.add(class_name[0])


    def _classify_file(self, path):
        content = self._load_content(path)
        core =  self.extract_core(content)
        class_name = core["class"]
        parent_name = core["extends"]
        table_name = core["table"]
        schema_name = core["schema"]

        # files are either in: 
        # - Ignored 
        # - Feature
        # - Object
        if class_name in self.ignore_set:
            return  # Ignore specific classes
            
        if  class_name in self.feature_set :
            if class_name not in self.feature.keys() : 
                self.feature[class_name] = Feature(self.input_path, class_name, schema_name)
        
        elif parent_name in self.property_parent_set:
            # if class_name in self.snowflake_set:
            #     self.property[class_name] = Property(self.input_path, class_name, table_schema, True)  
            #     self.property[class_name].load_sql(self.snowflake_set[class_name].get("path"))
            #     self.property[class_name].load_dependecy(self.snowflake_set[class_name].get("dependency"))

            if class_name not in self.property.keys() : 
                self.property[class_name] = Property(self.input_path, class_name, schema_name)
        
    def _process_file(self, path):
        content = self._load_content(path)
        core =  self.extract_core(content)
        class_name = core["class"]
        parent_name = core["extends"]
        table_name = core["table"]
        schema_name = core["schema"]

        # files are either in: 
        # - Ignored 
        # - Feature
        # - Property
        if class_name in self.ignore_set:
            return  # Ignore specific classes

        elif parent_name in self.timeslice_parent_set :
            if class_name.replace("TimeSlice","") in self.feature_set:
                self._process_time_slice(self.feature[class_name.replace("TimeSlice","")], content)

            else : 
                ValueError(f"[ERROR] is a timeslice extension but wasn't part of feature layer generation: {class_name} / {content}")

        elif class_name in self.object_set :
            if class_name.replace("Type","PropertyType") in self.property.keys():
                self._process_object(self.property[class_name.replace("Type","PropertyType")], content)

            else : 
                ValueError(f"[ERROR] is a object extension but wasn't part of the property layer generation :{class_name} / {content}")
            

    def _process_time_slice(self, layer, content):
        for item in self.extract_embedded_columns_two(content):
            layer.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            layer.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        for item in self.extract_one_to_one(content):
            type = item.get("type")

            if type in self.ignore_set:
                pass
            
            # elif type in self.snowflake_set.keys():
            #     schema = self.snowflake_set[type].get("schema")
            #     attribute = self.snowflake_set[type].get("one").get("attribute")
            #     group = self.snowflake_set[type].get("one").get("group")
            #     publish = self.snowflake_set[type].get("one").get("publish")
            #     layer.add_association_snowflake_one(schema, name, publish, attribute, group, item.get("col"), item.get("role"))
                        
            elif type in self.property.keys():
                schema = self.property[type].get_schema()
                layer.add_association_object_one(schema, type, item.get("role"),item.get("col"))
            
            elif type in self.feature.keys():
                schema = self.feature[type].get_schema()
                layer.add_association_feature_one(schema, type, item.get("role"),item.get("col"))
            
            else : 
                ValueError(f"[ERROR] {type} can not be found in property, feature, snowflake, ignore:")

        for item in self.extract_one_to_many(content):
            type = item.get("type")

            if type in self.ignore_set:
                pass
            
            elif type in self.snowflake_set.keys():
                schema = self.snowflake_set[type].get("schema")
                argument = self.snowflake_set[type].get("many").get("argument")
                attribute = self.snowflake_set[type].get("many").get("attribute")
                publish = self.snowflake_set[type].get("many").get("publish")
                layer.add_association_snowflake_many(schema, type, publish, argument, attribute, item.get("col"), item.get("role"))
                        
            elif type in self.property.keys():
                schema = self.property[type].get_schema()
                layer.add_association_object_many(schema, type, item.get("role"),item.get("col"))
            
            elif type in self.feature.keys():
                schema = self.feature[type].get_schema()
                layer.add_association_feature_many(schema, type, item.get("role"),item.get("col"))
            
            else : 
                ValueError(f"[ERROR] {type} can not be found in property, feature, snowflake, ignore:")


    def _process_object(self, property, content):
        for item in self.extract_embedded_columns_two(content):
            property.add_attributes_two(item.get("value"), item.get("nil"))

        for item in self.extract_embedded_columns_three(content):
            property.add_attributes_three(item.get("value"), item.get("uom"), item.get("nil"))

        for item in self.extract_one_to_one(content):
            type = item.get("type")

            if type in self.ignore_set:
                pass
            
            elif type in self.snowflake_set.keys():
                schema = self.snowflake_set[type].get("schema")
                attribute = self.snowflake_set[type].get("one").get("attribute")
                group = self.snowflake_set[type].get("one").get("group")
                publish = self.snowflake_set[type].get("one").get("publish")
                property.add_association_snowflake_one(schema, type, publish, attribute, group, item.get("col"), item.get("role"))
                        
            elif type in self.property.keys():
                schema = self.property[type].get_schema()
                property.add_association_object_one(schema, type, item.get("role"),item.get("col"))
            
            elif type in self.feature.keys():
                schema = self.feature[type].get_schema()
                property.add_association_feature_one(schema, type, item.get("role"),item.get("col"))
            
            else : 
                ValueError(f"[ERROR] {type} can not be found in property, feature, snowflake, ignore:")

        for item in self.extract_one_to_many(content):
            type = item.get("type")

            if type in self.ignore_set:
                pass

            elif type in self.snowflake_set.keys():
                schema = self.snowflake_set[type].get("schema")
                argument = self.snowflake_set[type].get("many").get("argument")
                attribute = self.snowflake_set[type].get("many").get("attribute")
                publish = self.snowflake_set[type].get("many").get("publish")
                property.add_association_snowflake_many(schema, type, publish, argument, attribute, item.get("col"), item.get("role"))

            elif type in self.property.keys():
                schema = self.property[type].get_schema()
                property.add_association_object_many(schema, type, item.get("role"), item.get("type"))

            elif type in self.feature.keys():
                schema = self.feature[type].get_schema()
                property.add_association_feature_many(schema, type, item.get("role"), item.get("type"))

            else : 
                ValueError(f"[ERROR] {type} can not be found in property, feature, snowflake, ignore:")

    def extract_core(self, content):
        class_name = re.findall(self.parsing["class"]["method"], content)
        parent_name = re.findall(self.parsing["extends"]["method"], content)
        table_name = re.findall(self.parsing["table"]["method"], content)

        if table_name :
            table_name, table_schema = table_name.groups()

        else : 
            raise ValueError(f"[ERROR] parsing table name: {content}")
        
        if class_name :
            class_name = class_name[0]

        else : 
            raise ValueError(f"[ERROR] parsing class name: {content}")
        
        if parent_name :
            parent_name = parent_name[0]

        else : 
            raise ValueError(f"[ERROR] parsing parent name: {content}")
        
        res = {
            "class" : class_name,
            "table" : table_name,
            "parent": parent_name,
            "schema": table_schema
        }
        
        return res

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
            value, nil, type, role = column[0], column[1], column[2], column[3]
            embedded_columns.append({
                "value" : value,
                "nil" : nil,
                "type" : type,
                "role" : role.lower()
            })

        return embedded_columns
    
    def extract_embedded_columns_three(self, content):
        """Extract embedded attributes (2 or 3 columns)."""
        embedded_columns = []
        raw_embedded_three = re.findall(self.parsing["embedded_three"]["method"], content)
        for column in raw_embedded_three:
            value, uom, nil, type, role = column[0], column[1], column[2], column[3], column[4]
            embedded_columns.append({
                "value" : value,
                "uom" : uom,
                "nil" : nil,
                "type" : type,
                "role" : role.lower()
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

    def extract_one_to_many(self, content):
        """Extract one-to-many relationships."""
        res = []
        raw_one_to_many = re.findall(self.parsing["one_to_many"]["method"], content)
        for column in raw_one_to_many:
            join, ref_in, ref_out, type, role = column[0], column[1], column[2], column[3], column[4]
            res.append({
                "col" : join,
                "ref_in" : ref_in,
                "ref_out" : ref_out,
                "type" : type,
                "role" : role.lower()
            })
        return res