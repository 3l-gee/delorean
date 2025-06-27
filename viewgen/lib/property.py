import random
import string

class Property :

    def __init__ (self, name, group) : 
        self.name = name
        self.group = group
        self.sql = {
            "attributes": {
                "feature": self.generate_attributes(name, group)
            },
            "view": self.generate_view(name, group),      # List[str]
            "select": self.generate_select(name, group),  # List[str]
            "inner": self.generate_inner(name, group),    # List[str]
            "left": self.generate_left(name, group),      # List[str]
            "where": self.generate_where(name, group),    # List[str]
            "group": self.generate_group(name, group),    # List[str]
            "order": self.genrate_order(name, group)      # List[str]
        }

    def get_group(self):
        return self.group

    def generate_sql(self):
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

        full_sql = "\n".join(part for part in sql_parts if part.strip())
        return full_sql

    def generate_view(self, name, group) :
        return [f"create or replace view {group}.{name}_view as"]

    def generate_select(self, name, group) :
        return [f"select"]
    
    def generate_letter_hash(self, prefix, length=6):
        return prefix + '_' + ''.join(random.choices(string.ascii_lowercase, k=length))
    
    def generate_attributes(self, name, group) : 
        return [
            f"{group}.{name}.id",
            f"{group}.{name}.nilreason"
        ]
        
    def generate_inner(self, name, group) : 
        return [
            f"from {group}.{name}_pt ",
            f"inner join {group}.{name} on {group}.{name}_pt"
        ]

    def generate_left(self, name, group) :
        return []

    def generate_where(self, name, group) : 
        return []
    
    def genrate_order(self, name, group) : 
        return []
    
    def generate_group(self, name, group) :
        return []
    
    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar), '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
        # self.add_group(str(self.name + "_ts"), value, self.group)
        # self.add_group(str(self.name + "_ts"), nil, self.group)
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar) || ' ' || {self.group}.{self.name}_ts.{uom}, '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
        # self.add_group(str(self.name + "_ts"), value, self.group)
        # self.add_group(str(self.name + "_ts"), uom, self.group)
        # self.add_group(str(self.name + "_ts"), nil, self.group)

    def add_association_feature_one(self, group, name, role, col):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(group + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"coalesce(cast({hash}.title as varchar), '(' || {hash}.nilreason[1] || ')') AS {role}",
            f"{hash}.href AS {role}_href"
        ])
        
        # self.add_group(hash, "title")
        # self.add_group(hash, "nilreason")
        # self.add_group(hash, "href")

        self.sql["left"].append(f"left join {group}.{name}_pt {hash} on {self.group}.{self.name}_ts.{col} = {hash}.id")

