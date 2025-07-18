from lib.layer import Layer, HeleperFunction

class Property(Layer) :

    def __init__(self, input_path, type, name, schema, snowflake=False):
        super().__init__(input_path, type, name, schema, snowflake)
        self.layer_type = "property"

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
            f"{schema}.{name}_pt.id::integer as id",
            f"{schema}.{name}_pt.nilreason::text AS {self.name}_nilreason",
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
        self.attributes["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}.{value} as varchar), '(' || {self.schema}.{self.name}.{nil} || ')')::text as {name}")
        self.add_group(str(self.name), value, self.schema)
        self.add_group(str(self.name), nil, self.schema)

        self.attributes["publish"]["form"]["attributes"].append({
                "field": f"{name}",
                "name": f"{name}",
            })
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.attributes["attributes"]["feature"].append(f"coalesce(cast({self.schema}.{self.name}.{value} as varchar) || ' ' || {self.schema}.{self.name}.{uom}, '(' || {self.schema}.{self.name}.{nil} || ')')::text as {name}")
        self.add_group(str(self.name), value, self.schema)
        self.add_group(str(self.name), uom, self.schema)
        self.add_group(str(self.name), nil, self.schema)

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

        self.attributes["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

        if not  self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []

        self.attributes["publish"]["form"][role].extend([
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
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.attributes["attributes"][name].extend([
            f"to_jsonb({hash}.id)::jsonb AS {role}"
        ])
        
        self.add_group(hash, "id")

        self.attributes["left"].append(f"left join {schema}.{name}_pt {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

        if not  self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []

        self.attributes["publish"]["form"][role].extend([
            {
                "field": f"{role}",
                "name": f"{role}",
            },
        ])

    def add_association_object_many(self, schema, name, role, type):  
        if not self.attributes["attributes"].get(name):
            self.attributes["attributes"][name] = []

        hash_one = self.generate_letter_hash(str("master_join"))
        hash_two = self.generate_letter_hash(str(schema + "_" + name + "_lat"))
        hash_three = self.generate_letter_hash(str(schema + "_" + name + "_pt"))

        self.attributes["lateral"].extend([
            f"left join lateral(",
            f"  select jsonb_agg(DISTINCT {hash_two}.id) as {role}",
            f"  from master_join {hash_one}",
            f"  join {schema}.{name}_pt {hash_two} on {hash_one}.target_id = {hash_two}.id",
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as {hash_three} on TRUE"
        ])

        self.attributes["attributes"][name].extend([
            f"{hash_three}.{role}::jsonb as {role}"
        ])

        if not  self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []

        self.attributes["publish"]["form"][role].extend([
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
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as {hash_three} on TRUE"
        ])

        self.attributes["attributes"][name].extend([
            f"{hash_three}.{role}::jsonb as {role}"
        ])

        if not  self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []

        self.attributes["publish"]["form"][role].extend([
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

        self.attributes["left"].append(f"left join {schema}.{name}_view {hash} on {self.schema}.{self.name}.{col} = {hash}.id")

        self.publish_handler(name, schema, role, hash, publish_param)

        if not self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []
            
        if publish_param.get("form") :
            self.attributes["publish"]["form"][role].extend(HeleperFunction.format_structure(publish_param.get("form"), role=role))

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
            f"  where {hash_one}.source_id = {self.schema}.{self.name}.id",
            f") as {hash_three} on TRUE"
        ])

        if publish_param.get("geometry") :
            self.attributes["index"].append(f"create index on {self.schema}.{self.name}_view using gist ({hash_three}.geom)")

        self.publish_handler(name, schema, role, hash_three, publish_param)

        if not self.attributes["publish"]["form"].get(role) :
            self.attributes["publish"]["form"][role] = []
            
        if publish_param.get("form") :
            self.attributes["publish"]["form"][role].extend(HeleperFunction.format_structure(publish_param.get("form"), role=role))

        