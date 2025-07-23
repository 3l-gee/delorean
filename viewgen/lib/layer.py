import random
import string
from lxml import etree
import re
import uuid
import copy
from lib.generic_helper_function import GenericHeleperFunction

class Layer:

    def __init__(self, input_path, type, schema, snowflake=False):
        self.layer_type = None
        self.dependecy = set()
        self.type = type
        self.input_path = input_path
        self.name = GenericHeleperFunction.remove_suffix(self.type)
        self.schema = schema
        self.snowflake = snowflake
        self.geom_map_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/geom-maplayer.xml")
        self.table_map_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/table-maplayer.xml")
        self.layer_tree_layer_template = GenericHeleperFunction.load_xml(self.input_path, "xml/layer-tree-layer.xml")
        self.label_style = GenericHeleperFunction.load_xml(self.input_path, "xml/labelStyle.xml")
        self.attribute_editor_container = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorContainer.xml")
        self.attribut_editor_field = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorField.xml")
        self.attribut_editor_html_element = GenericHeleperFunction.load_xml(self.input_path, "xml/attributeEditorHtmlElement.xml")
        self.alias = GenericHeleperFunction.load_xml(self.input_path, "xml/alias.xml")
        self.full_sql = ""
        self.publish = {
            }
        
        self.attributes = {
            "attributes": {
                "feature": self.generate_attributes(self.name, schema)
            },
            "view": self.generate_view(self.name, schema),
            "select": self.generate_select(self.name, schema),
            "inner": self.generate_inner(self.name, schema),
            "left": self.generate_left(self.name, schema),
            "lateral" : [],
            "where": self.generate_where(self.name, schema),
            "group": self.generate_group(self.name, schema),
            "order": self.generate_order(self.name, schema),
            "index" : [f"create index on {self.schema}.{self.name}_view (id)"]
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

    def get_layer_type(self):
        return self.layer_type
    
    def get_attributes(self):
        return self.attributes
    
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
        # index_clause = ";\n".join(self.attributes["index"])

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
            order_clause,
        ]
        self.full_sql = "\n".join(part for part in sql_parts if part.strip()) + ";"

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

    def add_attributes_three(self,type, value, uom, nil) : pass
    def add_attributes_two(self, type, value, nil) : pass
    def add_association_feature_one(self, schema, name, role, col) : pass
    def add_association_object_one(self, schema, name, role, type) : pass
    def add_association_feature_many(self, schema, name, role, type) : pass
    def add_association_object_many(self, schema, name, role, type) : pass
    def add_association_snowflake_one(self, schema, name, role, type) : pass
    def add_association_snowflake_many(self, schema, name, role, type) : pass

    def publish_handler(self, schema, name, role, full_name, publish_param):
        if publish_param.get("geometry"):
            self.publish["geometry"].append({
                "geometrytype" : publish_param["geometry"].get("geometrytype"),
                "role" : role,
                "fullname" : full_name,
        })
