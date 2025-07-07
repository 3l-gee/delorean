import random
import string

class Layer:

    def __init__(self, type, name, schema, snowflake=False):
        self.dependecy = set()
        self.type = type
        self.name = name
        self.schema = schema
        self.snowflake = snowflake
        self.full_sql = ""
        self.sql = {
            "attributes": {
                "feature": self.generate_attributes(name, schema)
            },
            "view": self.generate_view(name, schema),
            "select": self.generate_select(name, schema),
            "inner": self.generate_inner(name, schema),
            "left": self.generate_left(name, schema),
            "where": self.generate_where(name, schema),
            "group": self.generate_group(name, schema),
            "order": self.generate_order(name, schema)
        }

    def get_schema(self):
        return self.schema
    
    def get_sql(self):
        return self.full_sql
    
    def get_dependecy(self): 
        return list(self.dependecy)
    
    def get_type(self):
        return self.type

    def generate_sql(self):
        if self.snowflake :
            return None
        # Combine attributes from all attribute types
        attributes = []
        for attr_list in self.sql["attributes"].values():
            attributes.extend(attr_list)

        # Join SQL fragments with appropriate formatting
        view_sql = "\n".join(self.sql["view"])
        select_sql = "\n".join(self.sql["select"])
        attributes_sql = ",\n    ".join(attributes)
        inner_sql = "\n".join(self.sql["inner"])
        left_sql = "\n".join(self.sql["left"])
        where_clause = "where " + "\n  and ".join(self.sql["where"]) if self.sql["where"] else ""
        group_clause = "group by\n    " + ",\n    ".join(self.sql["group"]) if self.sql["group"] else ""
        order_clause = ", ".join(self.sql["order"])

        # Assemble final SQL
        sql_parts = [
            view_sql,
            select_sql,
            f"    {attributes_sql}" if attributes_sql else "",
            inner_sql,
            left_sql,
            where_clause,
            group_clause,
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
            self.sql["group"].append(f"{group}.{name}.{column}")
        else:
            self.sql["group"].append(f"{name}.{column}")

    def add_attributes_three(self, value, uom, nil) : pass
    def add_attributes_two(self, value, nil) : pass
    def add_association_feature_one(self, schema, name, role, col) : pass
    def add_association_object_one(self, schema, name, role, type) : pass
    def add_association_feature_many(self, schema, name, role, type) : pass
    def add_association_object_many(self, schema, name, role, type) : pass
    def add_association_snowflake_one(self, schema, name, role, type) : pass
    def add_association_snowflake_many(self, schema, name, role, type) : pass
