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
        res = ["(row_number() over ())::integer as id"]
        res.append(f"{schema}.{name}.id::integer as f_id")
        res.append(f"{schema}.{name}_ts.id::integer as ts_id")
        res.append(f"{schema}.{name}_tsp.id::integer as tsp_id")
        res.append(f"{schema}.{name}.identifier::uuid")
        res.append(f"{schema}.{name}_ts.interpretation::text")
        res.append(f"{schema}.{name}_ts.sequence_number::integer")
        res.append(f"{schema}.{name}_ts.correction_number::integer")        
        res.append(f"{schema}.{name}_ts.valid_time_begin::timestamp")
        res.append(f"{schema}.{name}_ts.valid_time_end::timestamp")
        res.append(f"{schema}.{name}_ts.feature_lifetime_begin::timestamp")
        res.append(f"{schema}.{name}_ts.feature_lifetime_end::timestamp")

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
        self.attributes["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}_ts.{value} as varchar) || ' ' || {self.schema}.{self.name}_ts.{uom}, '(' || {self.schema}.{self.name}_ts.{nil} || ')')::text as {name}")
        self.add_group(str(self.name + "_ts"), value, self.schema)
        self.add_group(str(self.name + "_ts"), uom, self.schema)
        self.add_group(str(self.name + "_ts"), nil, self.schema)

        self.attributes["publish"]["form"]["attributes"].append({
                "field": f"{name}",
                "name": f"{name}",
            })

    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.attributes["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}_ts.{value} as varchar), '(' || {self.schema}.{self.name}_ts.{nil} || ')')::text as {name}")
        self.add_group(str(self.name + "_ts"), value, self.schema)
        self.add_group(str(self.name + "_ts"), nil, self.schema)

        self.attributes["publish"]["form"]["attributes"].append({
                "field": f"{name}",
                "name": f"{name}",
            })

    def add_association_feature_one(self, schema, name, role, col):
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.attributes["attributes"][name].extend([
            f"coalesce(cast({hash}.title as varchar), '(' || {hash}.nilreason[1] || ')')::text AS {role}",
            f"{hash}.href::text AS {role}_href"
        ])
        
        self.add_group(hash, "title")
        self.add_group(hash, "nilreason[1]")
        self.add_group(hash, "href")

        self.attributes["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")

        if not  self.attributes["publish"]["form"].get(schema) :
            self.attributes["publish"]["form"][schema] = []

        self.attributes["publish"]["form"][schema].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
            {
                "field": f"{role}_href",
                "name": f"Ref",
            }
        ])
    
    def add_association_object_one(self, schema, name, role, col):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        self.attributes["attributes"][name].extend([
            f"to_jsonb({hash}.*)::jsonb AS {role}"
        ])

        self.add_group(hash, "id")

        self.attributes["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")

        if not  self.attributes["publish"]["form"].get(schema) :
            self.attributes["publish"]["form"][schema] = []

        self.attributes["publish"]["form"][schema].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
        ])

    def add_association_feature_many(self, schema, name, role, type):
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_lat"))
        hash_three = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.attributes["lateral"].extend([
            f"left join lateral(",
            f"  select jsonb_agg(DISTINCT jsonb_build_object(",
            f"      'id', {hash_two}.id,",
            f"      'title', coalesce(cast({hash_two}.title AS varchar), '(' || {hash_two}.nilreason[1] || ')'),",
            f"      'href', {hash_two}.href",
            f"  )) as {role}"
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}_ts.id",
            f") as {hash_three} on TRUE"
        ])

        self.attributes["attributes"][name].extend([
            f"{hash_three}.{role}::jsonb as {role}"
        ])

        if not  self.attributes["publish"]["form"].get(schema) :
            self.attributes["publish"]["form"][schema] = []

        self.attributes["publish"]["form"][schema].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
        ])

    def add_association_object_many(self, schema, name, role, type):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_lat"))
        hash_three = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        self.attributes["lateral"].extend([
            f"left join lateral(",
            f"  select jsonb_agg(DISTINCT {hash_two}.*) as {role}",
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}_ts.id",
            f") as {hash_three} on TRUE"
        ])

        self.attributes["attributes"][name].extend([
            f"{hash_three}.{role}::jsonb as {role}"
        ])

        if not  self.attributes["publish"]["form"].get(schema) :
            self.attributes["publish"]["form"][schema] = []

        self.attributes["publish"]["form"][schema].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
        ])

    def add_association_snowflake_one(self, schema, name, publish_param, attribute, group, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash, role=role) for attr in attribute]

        self.attributes["attributes"][name].extend(formatted_attribute)

        self.attributes["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}_ts.{col} = {hash}.id")

        self.publish_handler(schema, name, role, hash, publish_param)

        if not  self.attributes["publish"]["form"].get(schema) :
            self.attributes["publish"]["form"][schema] = []
            
        self.attributes["publish"]["form"][schema].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
        ])


    def add_association_snowflake_many(self, schema, name, publish_param, argument, attribute, col, role):
        self.dependecy.add(f"{schema}.{name}_view")
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_lat"))
        hash_three = self.generate_letter_hash(str(schema + "_" + name + "_view"))

        formatted_attribute = [attr.format(alias=hash_three, name=name, role=role) for attr in attribute]
        formatted_argument = ["    " + arg.format(alias=hash_two, name=name, role=role) for arg in argument]

        self.attributes["attributes"][name].extend(formatted_attribute)

        self.attributes["lateral"].extend([
            f"left join lateral(",
            f"  select"
        ])

        self.attributes["lateral"].extend(formatted_argument)

        self.attributes["lateral"].extend([
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_view {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}_ts.id",
            f") as {hash_three} on TRUE"
        ])

        if publish_param.get("geometry") :
            self.attributes["index"].append(f"create index on {self.schema}.{self.name}_view using gist ({hash_three}.geom)")

        self.publish_handler(name, schema, role, hash_three, publish_param)
