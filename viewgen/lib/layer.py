import random
import string
import xml.etree.ElementTree as ET
import uuid
import copy
from lib.helper_function import HeleperFunction

class Layer:

    def __init__(self, input_path, type, name, schema, snowflake=False):
        self.dependecy = set()
        self.type = type
        self.input_path = input_path
        self.name = name
        self.schema = schema
        self.snowflake = snowflake
        self.map_layer_template = HeleperFunction.load_xml(self.input_path, "xml/maplayer.xml")
        self.layer_tree_layer_template = HeleperFunction.load_xml(self.input_path, "xml/layer-tree-layer.xml")
        self.publish_layer = {}
        self.full_sql = ""
        self.attributes = {
            "publish" : {
                "geometry" : [],
                "action" : {

                },
                "html" : {

                },
            },
            "attributes": {
                "feature": self.generate_attributes(name, schema)
            },
            "view": self.generate_view(name, schema),
            "select": self.generate_select(name, schema),
            "inner": self.generate_inner(name, schema),
            "left": self.generate_left(name, schema),
            "lateral" : [],
            "where": self.generate_where(name, schema),
            "group": self.generate_group(name, schema),
            "order": self.generate_order(name, schema)
        }

    def get_schema(self):
        return self.schema
    
    def get_name(self):
        return self.name
    
    def get_sql(self):
        return self.full_sql
    
    def get_dependecy(self): 
        return list(self.dependecy)
    
    def get_type(self):
        return self.type

    def get_publish_layer(self):
        return self.publish_layer

    def genrate_prj(self):
        # Make sure the template loaded correctly
        if self.map_layer_template is None:
            print("[ERROR] Layer template not loaded")
            return
        

        geometries = self.attributes["publish"].get("geometry", [])

        # If empty, default to [None]
        if not geometries:
            geometries = [None]

        for geom in geometries:
            map_layer = copy.deepcopy(self.map_layer_template)
            layer_tree_layer = copy.deepcopy(self.layer_tree_layer_template)

            # Format name 
            layer_tree_layer.set("name", self.name)

            # Format id
            id = self.qgis_gen_id()
            map_layer.find(".//id").text = id
            layer_tree_layer.set("id", id)

            #Format layername
            layername_elem = map_layer.find(".//layername")
            if layername_elem is not None:
                if geom is None:
                    layername_elem.text = f"{self.name}"
                else:
                    role = geom.get("role")
                    if len(geometries) == 1:
                        layername_elem.text = f"{self.name}"
                    else:
                        layername_elem.text = f"{self.name}.{role}"


            # Format datasource
            if layername_elem is not None:
                if geom is None:
                    datasource = self.qgis_gen_datasource()
                else:
                    role = geom.get("role")
                    datasource = self.qgis_gen_datasource(role)
                   
            map_layer.find(".//datasource").text = datasource
            layer_tree_layer.set("source", datasource.replace('"',"&quot"))


            self.publish_layer[f"{self.name}"] = {
                "id" : id,
                "datasource" : datasource,
                "maplayer" : map_layer,
                "layertree" : layer_tree_layer,
                }

    def generate_sql(self):
        if self.snowflake :
            return None
        # Combine attributes from all attribute types
        attributes = []
        for attr_list in self.attributes["attributes"].values():
            attributes.extend(attr_list)

        # Join SQL fragments with appropriate formatting
        view_sql = "\n".join(self.attributes["view"])
        select_sql = "\n".join(self.attributes["select"])
        attributes_sql = ",\n    ".join(attributes)
        inner_sql = "\n".join(self.attributes["inner"])
        left_sql = "\n".join(self.attributes["left"])
        lateral_sql = "\n".join(self.attributes["lateral"])
        where_clause = "where " + "\n  and ".join(self.attributes["where"]) if self.attributes["where"] else ""
        group_clause = "group by\n    " + ",\n    ".join(self.attributes["group"]) if self.attributes["group"] else ""
        order_clause = ", ".join(self.attributes["order"])

        # Assemble final SQL
        sql_parts = [
            view_sql,
            select_sql,
            f"    {attributes_sql}" if attributes_sql else "",
            inner_sql,
            left_sql,
            lateral_sql,
            where_clause,
            # group_clause,
            order_clause
        ]

        self.full_sql = "\n".join(part for part in sql_parts if part.strip()) + ";" + "\n" + f"create index on {self.schema}.{self.name}_view (id);"

    def load_sql(self, path):
        try:
            with open(path, 'r', encoding='utf-8') as file:
                self.full_sql = file.read()
        except FileNotFoundError:
            print(f"Error: File not found at '{path}'")
            self.full_sql = ""
        except Exception as e:
            print(f"Error loading SQL from '{path}': {e}")
            self.full_sql = ""

    def load_template(self, path):
        try:
            tree = ET.parse(path)
            root = tree.getroot()
            return root
        except ET.ParseError as e:
            print(f"[ERROR] XML parsing failed: {e}")
            return None
        except FileNotFoundError:
            print(f"[ERROR] File not found: {path}")
            return None

    def load_dependecy(self, list):
        self.dependecy.update(list)

    def generate_view(self, name, schema) : return []
    def generate_select(self, name, schema) : return []
    def generate_letter_hash(self, prefix, length=6):
        return prefix + '_' + ''.join(random.choices(string.ascii_lowercase, k=length))

    def generate_attributes(self, name, schema) : return []
    def generate_inner(self, name, schema) : return []
    def generate_left(self, name, schema) : return []
    def generate_where(self, name, schema) : return []
    def generate_order(self, name, schema) : return []
    def generate_group(self, name, schema) : return []
    def add_group(self, name, column, group=None):
        if group:
            self.attributes["group"].append(f"{group}.{name}.{column}")
        else:
            self.attributes["group"].append(f"{name}.{column}")

    def add_attributes_three(self, value, uom, nil) : pass
    def add_attributes_two(self, value, nil) : pass
    def add_association_feature_one(self, schema, name, role, col) : pass
    def add_association_object_one(self, schema, name, role, type) : pass
    def add_association_feature_many(self, schema, name, role, type) : pass
    def add_association_object_many(self, schema, name, role, type) : pass
    def add_association_snowflake_one(self, schema, name, role, type) : pass
    def add_association_snowflake_many(self, schema, name, role, type) : pass

    def publish_handler(self, schema, name, role, full_name, publish_param):
        if publish_param.get("geometry") == True:
            self.attributes["publish"]["geometry"].append({
                "role" : role,
                "fullname" : full_name,
        })
        
        # if publish_param.get()

    def qgis_gen_id(self):
        generated_uuid = str(uuid.uuid4())
        full_id = f"{self.name}_{generated_uuid}"
        return full_id

    def qgis_gen_datasource(self, geom=None):
        res = ""
        res += "dbname='${ProjectConfig.dbname}' "
        res += "host=${ProjectConfig.host} "
        res += "port=${ProjectConfig.port} "
        res += "sslmode=disable "
        res += "key='row' "
        res += "checkPrimaryKeyUnicity='1' "
        res += f'table="{self.schema}"."{self.name}_view" '
        if geom is None:
            return res
        else:
            res += f'({geom}_geom)'
        return res
        
