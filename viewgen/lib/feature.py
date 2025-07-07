import random
import string
from lib.layer import Layer

class Feature(Layer) :

    def get_name(self):
        return f"{self.schema}.{self.name}_view"

    def generate_view(self, name, schema) :
        return [
            f"drop materialized view if exists {schema}.{name}_view cascade;",
            f"create materialized view {schema}.{name}_view as"
            ]

    def generate_select(self, name, schema) :
        return [f"select distinct on ({name}.identifier,{name}_ts.sequence_number)"]
   
    def generate_attributes(self, name, schema) : 
        res = ["(row_number() OVER ())::integer AS row"]
        res.append(f"{schema}.{name}.id")
        res.append(f"{schema}.{name}_ts.id as ts_id")
        res.append(f"{schema}.{name}_tsp.id as tsp_id")
        res.append(f"{schema}.{name}.identifier")
        res.append(f"{schema}.{name}_ts.interpretation")
        res.append(f"{schema}.{name}_ts.sequence_number")
        res.append(f"{schema}.{name}_ts.correction_number")        
        res.append(f"{schema}.{name}_ts.valid_time_begin")
        res.append(f"{schema}.{name}_ts.valid_time_end")
        res.append(f"{schema}.{name}_ts.feature_lifetime_begin")
        res.append(f"{schema}.{name}_ts.feature_lifetime_end")
        return res
        
    def generate_inner(self, name, schema) : 
    # TODO : once basic messgae is linked with master_join and that the new ts are linked back to the old dataset
#         return f"""
# from aixm_basic_message 
# inner join master_join mj1 on aixm_basic_message.id = mj1.source_id
# inner join basic_message_member	on mj1.target_id = basic_message_member.id
# inner join {group}.{name} on basic_message_member.abstract_aixm_feature_id = {group}.{name}.id
# inner join master_join mj2 on {group}.{name}.id = mj2.source_id
# inner join {group}.{name}_tsp on mj2.target_id = {group}.{name}_tsp.id
# inner join {group}.{name}_ts on {group}.{name}_tsp.{name}_timeslice_id = {group}.{name}_ts.id
#     """
        return [
            f"from {schema}.{name} ", 
            f"inner join master_join mj2 on {schema}.{name}.id = mj2.source_id",
            f"inner join {schema}.{name}_tsp on mj2.target_id = {schema}.{name}_tsp.id",
            f"inner join {schema}.{name}_ts on {schema}.{name}_tsp.{name}timeslice_id = {schema}.{name}_ts.id"
        ]

    def generate_left(self, name, schema) :
        return [
        ]

    def generate_where(self, name, schema) : 
        return [
            f"{schema}.{name}.feature_status = 'APPROVED'",
            f"{schema}.{name}_ts.feature_status = 'APPROVED'"
        ]
    
    def generate_order(self, name, schema) : 
        return [
            f"order by {name}.identifier",
            f"{name}_ts.sequence_number",
            f"{name}_ts.correction_number DESC"
        ]
    
    def generate_group(self, name, schema) :
        res = [f"{schema}.{name}.id"]
        res.append(f"{schema}.{name}_ts.id")
        res.append(f"{schema}.{name}_tsp.id")
        res.append(f"{schema}.{name}.identifier")
        res.append(f"{schema}.{name}_ts.interpretation")
        res.append(f"{schema}.{name}_ts.sequence_number")
        res.append(f"{schema}.{name}_ts.correction_number")        
        res.append(f"{schema}.{name}_ts.valid_time_begin")
        res.append(f"{schema}.{name}_ts.valid_time_end")
        res.append(f"{schema}.{name}_ts.feature_lifetime_begin")
        res.append(f"{schema}.{name}_ts.feature_lifetime_end")
        return res 

    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}_ts.{value} as varchar) || ' ' || {self.schema}.{self.name}_ts.{uom}, '(' || {self.schema}.{self.name}_ts.{nil} || ')') as {name}")
        self.add_group(str(self.name + "_ts"), value, self.schema)
        self.add_group(str(self.name + "_ts"), uom, self.schema)
        self.add_group(str(self.name + "_ts"), nil, self.schema)

    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}_ts.{value} as varchar), '(' || {self.schema}.{self.name}_ts.{nil} || ')') as {name}")
        self.add_group(str(self.name + "_ts"), value, self.schema)
        self.add_group(str(self.name + "_ts"), nil, self.schema)

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

        self.sql["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")
    
    def add_association_object_one(self, schema, name, role, col):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        self.sql["attributes"][name].extend([
            f"{hash}.id AS {role}"
        ])

        self.add_group(hash, "id")

        self.sql["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")

    def add_association_feature_many(self, schema, name, role, type):
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.sql["left"].extend([
            f"left join master_join {hash_one} on {self.schema}.{self.name}_ts.id = {hash_one}.source_id",
            f"left join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id"
        ])

        self.sql["attributes"][name].extend([
            f"jsonb_agg(DISTINCT jsonb_build_object('id', {hash_two}.id",
            f"'title', coalesce(cast({hash_two}.title AS varchar), '(' || {hash_two}.nilreason[1] || ')')",
            f"'href', {hash_two}.href)) AS {role}"
        ])

    def add_association_object_many(self, schema, name, role, type):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        self.sql["left"].extend([
            f"left join master_join {hash_one} on {self.schema}.{self.name}_ts.id = {hash_one}.source_id",
            f"left join {schema}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id"
        ])

        self.sql["attributes"][name].extend([
            f"jsonb_agg(DISTINCT {hash_two}.id) AS {role}"
        ])

    def add_association_snowflake_one(self, schema, name, attribute, group, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash, role=role) for attr in attribute]
        formatted_group = [grp.format(alias=hash) for grp in group]

        self.sql["attributes"][name].extend(formatted_attribute)
        self.sql["group"].extend(formatted_group)

        self.sql["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")


    def add_association_snowflake_many(self, schema, name, attribute, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.sql["attributes"].get(name):
            self.sql["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash_two, name=name, role=role) for attr in attribute]
        self.sql["attributes"][name].extend(formatted_attribute)

        self.sql["left"].extend([
            f"left join master_join {hash_one} on {self.schema}.{self.name}_ts.id = {hash_one}.source_id",
            f"left join {schema}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id"
        ])