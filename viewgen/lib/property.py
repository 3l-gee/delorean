import random
import string
from lib.layer import Layer

class Property(Layer) :

    def get_name(self):
        return f"{self.schema}.{self.name}_view"

    def generate_view(self, name, schema) :
        return [
            f"drop materialized view if exists {schema}.{name}_view cascade;",
            f"create materialized view {schema}.{name}_view as"
            ]

    def generate_select(self, name, schema) :
        return [f"select"]
        
    def generate_attributes(self, name, schema) : 
        return [
            f"{schema}.{name}_pt.id",
            f"{schema}.{name}_pt.nilreason AS {self.name}_nilreason",
        ]
        
    def generate_inner(self, name, schema) : 
        return [
            f"from {schema}.{name}_pt ",
            f"inner join {schema}.{name} on {schema}.{name}_pt.{name}_id = {schema}.{name}.id"
        ]

    def generate_left(self, name, schema) :
        return [
        ]

    def generate_where(self, name, schema) : 
        return []
    
    def genrate_order(self, name, schema) : 
        return []
    
    def generate_group(self, name, schema) :
        return [
            f"{schema}.{name}_pt.id",
            f"{schema}.{name}_pt.nilreason"
        ]
        
    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}.{value} as varchar), '(' || {self.schema}.{self.name}.{nil} || ')') as {name}")
        # self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar), '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.schema)
        self.add_group(str(self.name), nil, self.schema)
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}.{value} as varchar) || ' ' || {self.schema}.{self.name}.{uom}, '(' || {self.schema}.{self.name}.{nil} || ')') as {name}")
        # self.sql["attributes"]["feature"].append(f"'{name}', coalesce(cast({self.group}.{self.name}.{value} as varchar) || ' ' || {self.group}.{self.name}.{uom}, '(' || {self.group}.{self.name}.{nil} || ')')")
        self.add_group(str(self.name), value, self.schema)
        self.add_group(str(self.name), uom, self.schema)
        self.add_group(str(self.name), nil, self.schema)

    def add_association_object_one(self, schema, name, role, col):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"to_jsonb({hash}.id) AS {role}"
        ])
        
        self.add_group(hash, "id")

        self.sql["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

    def add_association_feature_one(self, schema, name, role, col):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.sql["attributes"][name].extend([
            f"coalesce(cast({hash}.title as varchar), '(' || {hash}.nilreason[1] || ')') AS {role}",
            f"{hash}.href AS {role}_href"
        ])
        
        self.add_group(hash, "title")
        self.add_group(hash, "nilreason[1]")
        self.add_group(hash, "href")

        self.sql["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

    def add_association_object_many(self, schema, name, role, type):  
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.sql["lateral"].extend([
            f"left join lateral(",
            f"  select jsonb_agg(DISTINCT {hash_two}.id) as lat_{role}",
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as lat_{role} on TRUE"
        ])

        self.sql["attributes"][name].extend([
            f"lat_{role}.lat_{role} as {role}"
        ])

        # self.sql["attributes"][name].extend([
        #     f"jsonb_agg(DISTINCT {hash_two}.id) AS {role}"
        # ])

        # self.sql["left"].extend([
        #     f"left join master_join {hash_one} on {self.schema}.{self.name}.id = {hash_one}.source_id",
        #     f"left join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id"
        # ])

    def add_association_feature_many(self, schema, name, role, type):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.sql["lateral"].extend([
            f"left join lateral(",
            f"  select jsonb_agg(DISTINCT jsonb_build_object(",
            f"      'id', {hash_two}.id,",
            f"      'title', coalesce(cast({hash_two}.title AS varchar), '(' || {hash_two}.nilreason[1] || ')'),",
            f"      'href', {hash_two}.href",
            f"  )) as lat_{role}"
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as lat_{role} on TRUE"
        ])

        self.sql["attributes"][name].extend([
            f"lat_{role}.lat_{role} as {role}"
        ])


    def add_association_snowflake_one(self, schema, name, attribute, group, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash, role=role) for attr in attribute]
        formatted_group = [grp.format(alias=hash) for grp in group]

        self.sql["attributes"][name].extend(formatted_attribute)

        self.sql["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

    def add_association_snowflake_many(self, schema, name, argument, attribute, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash_two, name=name, role=role) for attr in attribute]
        formatted_argument = ["    " + arg.format(alias=hash_two, name=name, role=role) for arg in argument]

        self.sql["attributes"][name].extend(formatted_attribute)

        self.sql["lateral"].extend([
            f"left join lateral(",
            f"  select"
        ])

        self.sql["lateral"].extend(formatted_argument)

        self.sql["lateral"].extend([
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as lat_{role} on TRUE"
        ])
        

