import random
import string

class Layer:

    def __init__(self, name, group, snowflake=False):
        self.dependecy = 0
        self.name = name
        self.group = group
        self.snowflake = snowflake
        self.full_sql = None
        self.sql = {
            "attributes": {
                "feature": self.generate_attributes(name, group)
            },
            "view": self.generate_view(name, group),
            "select": self.generate_select(name, group),
            "inner": self.generate_inner(name, group),
            "left": self.generate_left(name, group),
            "where": self.generate_where(name, group),
            "group": self.generate_group(name, group),
            "order": self.generate_order(name, group)
        }

    def get_group(self):
        return self.group
    
    def get_sql(self):
        return self.full_sql
    
    def get_dependecy(self): 
        return self.dependecy

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


    def generate_view(self, name, group) : return []
    def generate_select(self, name, group) : return []
    def generate_letter_hash(self, prefix, length=6):
        return prefix + '_' + ''.join(random.choices(string.ascii_lowercase, k=length))

    def generate_attributes(self, name, group) : return []
    def generate_inner(self, name, group) : return []
    def generate_left(self, name, group) : return []
    def generate_where(self, name, group) : return []
    def generate_order(self, name, group) : return []
    def generate_group(self, name, group) : return []
    def add_group(self, name, column, group=None):
        if group:
            self.sql["group"].append(f"{group}.{name}.{column}")
        else:
            self.sql["group"].append(f"{name}.{column}")

    def add_attributes_three(self, value, uom, nil) : pass
    def add_attributes_two(self, value, nil) : pass
    def add_association_feature_one(self, group, name, role, col) : pass
    def add_association_object_one(self, group, name, role, type) : pass
    def add_association_feature_many(self, group, name, role, type) : pass
    def add_association_object_many(self, group, name, role, type) : pass
    def add_association_snowflake_one(self, group, name, role, type) : pass
    def add_association_snowflake_many(self, group, name, role, type) : pass
