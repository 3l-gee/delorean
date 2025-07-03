import random
import string
from lib.layer import Layer

class Property(Layer) :

    def generate_view(self, name, group) :
        return [f"create or replace view {group}.{name}_view as"]

    def generate_select(self, name, group) :
        return [f"select"]
        
    def generate_attributes(self, name, group) : 
        return [
            f"{group}.{name}_pt.id",
            f"jsonb_agg(notes.note_view.note) AS {self.name}_annotation",
            f"{group}.{name}_pt.nilreason AS {self.name}_annotation",
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
        
    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}.{value} as varchar), '(' || {self.group}.{self.name}.{nil} || ')') as {name}")
        # self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar), '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.group)
        self.add_group(str(self.name), nil, self.group)
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}.{value} as varchar) || ' ' || {self.group}.{self.name}.{uom}, '(' || {self.group}.{self.name}.{nil} || ')') as {name}")
        # self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar) || ' ' || {self.group}.{self.name}.{uom}, '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.group)
        self.add_group(str(self.name), uom, self.group)
        self.add_group(str(self.name), nil, self.group)

    def add_association_object_one(self, group, name, role, col):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(group + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"{hash}.id AS {role}"
        ])
        
        # self.add_group(hash, "title")
        # self.add_group(hash, "nilreason")
        # self.add_group(hash, "href")

        self.sql["left"].append(f"left join {group}.{name}_pt {hash} on {self.group}.{self.name}.{col} = {hash}.id")

    def add_association_feature_one(self, group, name, role, col):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(group + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"coalesce(cast({hash}.title as varchar), '(' || {hash}.nilreason[1] || ')') AS {role}",
            f"{hash}.href AS {role}_href"
        ])
        
        self.add_group(hash, "title")
        self.add_group(hash, "nilreason")
        self.add_group(hash, "href")

        self.sql["left"].append(f"left join {group}.{name}_pt {hash} on {self.group}.{self.name}_ts.{col} = {hash}.id")

    def add_association_object_many(self, group, name, role, type):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(group + "_" + name + "_view"))

        self.sql["left"].extend([
            f"left join master_join {hash_one} on {self.group}.{self.name}.id = {hash_one}.source_id",
            f"left join {group}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id"
        ])

        self.sql["attributes"][name].extend([
            f"jsonb_agg({hash_two}.id) AS {role}"
        ])


    def add_association_feature_many(self, group, name, role, type):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(group + "_" + name + "_pt"))

        self.sql["left"].extend([
            f"left join master_join {hash_one} on {self.group}.{self.name}.id = {hash_one}.source_id",
            f"left join {group}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id"
        ])

        self.sql["attributes"][name].extend([
            f"jsonb_agg({hash_two}.id) AS {role}"
        ])


    def add_association_snowflake_one(self, group, name, role, type):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []
        self.sql["left"].append(f"--snowflake one {group}.{name}.{role}" + " - " + type)

    def add_association_snowflake_many(self, group, name, role, type):
        self.dependecy += 1
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []
        self.sql["left"].append(f"--snowflake many {group}.{name}.{role}" + " - " + type)


