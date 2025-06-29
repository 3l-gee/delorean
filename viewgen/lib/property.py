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
        attributes_sql = ",\n    ".join(attributes) + "  ) AS json_data"
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

        full_sql = "\n".join(part for part in sql_parts if part.strip())  + ";"
        return full_sql

    def generate_view(self, name, group) :
        return [f"create or replace view {group}.{name}_view as"]

    def generate_select(self, name, group) :
        return [f"select"]
    
    def generate_letter_hash(self, prefix, length=6):
        return prefix + '_' + ''.join(random.choices(string.ascii_lowercase, k=length))
    
    def generate_attributes(self, name, group) : 
        return [
            f"{group}.{name}_pt.id",
            f"jsonb_agg(notes.note_view.note) AS {name}_annotation",
            f"jsonb_build_object("
            f"'nilreason', {group}.{name}_pt.nilreason",
        ]
        
    def generate_inner(self, name, group) : 
        return [
            f"from {group}.{name}_pt ",
            f"inner join {group}.{name} on {group}.{name}_pt.{name}_id = {group}.{name}.id"
        ]

    def generate_left(self, name, group) :
        return [
            f"left join master_join mj1 on {group}.{name}.id = mj1.source_id",
            f"left join notes.note_view on mj1.target_id = notes.note_view.id"
        ]

    def generate_where(self, name, group) : 
        return []
    
    def genrate_order(self, name, group) : 
        return []
    
    def generate_group(self, name, group) :
        return [
            f"{group}.{name}_pt.id",
            f"{group}.{name}_pt.nilreason"
        ]
    
    def add_group(self, name, column, group=None):
        if group:
            self.sql["group"].append(f"{group}.{name}.{column}")
        else:
            self.sql["group"].append(f"{name}.{column}")
    
    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        # self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}.{value} as varchar), '(' || {self.group}.{self.name}.{nil} || ')') as {name}")
        self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar), '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.group)
        self.add_group(str(self.name), nil, self.group)
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        # self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}.{value} as varchar) || ' ' || {self.group}.{self.name}.{uom}, '(' || {self.group}.{self.name}.{nil} || ')') as {name}")
        self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar) || ' ' || {self.group}.{self.name}.{uom}, '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.group)
        self.add_group(str(self.name), uom, self.group)
        self.add_group(str(self.name), nil, self.group)

    def add_association_feature_one(self, group, name, role, col):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(group + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"'{role}', {group}.{name}_view"
        ])
        
        # self.add_group(hash, "title")
        # self.add_group(hash, "nilreason")
        # self.add_group(hash, "href")

        self.sql["left"].append(f"left join {group}.{name}_pt {hash} on {self.group}.{self.name}.{col} = {hash}.id")

