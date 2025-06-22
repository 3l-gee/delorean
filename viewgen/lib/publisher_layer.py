


class Layer :

    def __init__ (self, name, group) : 
        self.name = name
        self.group = group
        self.attributes = {}
        self.association = {}
        self.sql = {"attributes" : {}}
        self.sql["view"] = self.generate_view(name, group)
        self.sql["select"] = self.generate_select(name, group)
        self.sql["attributes"]["generic"] = self.generate_attributes(name, group)
        self.sql["attributes"]["feature"] = []
        self.sql["association"] = []
        self.sql["inner"] = self.generate_inner(name, group)
        self.sql["left"] = []
        self.sql["where"] = self.generate_where(name, group)
        self.sql["order"] = self.genrate_order(name, group)

    def generate_sql(self):
        # Combine both attribute lists
        attributes = []
        if self.sql["attributes"]["generic"]:
            attributes.extend(self.sql["attributes"]["generic"])
        if self.sql["attributes"]["feature"]:
            attributes.extend(self.sql["attributes"]["feature"])

        # Join attributes with comma and indentation
        attributes_sql = ",\n    ".join(attributes)

        sql_parts = [
            self.sql["view"],
            self.sql["select"],
            f"    {attributes_sql}" if attributes_sql else "",
            self.sql["inner"].strip(),
            f"where {self.sql['where']}",
            self.sql["order"]
        ]

        full_sql = "\n".join(part for part in sql_parts if part.strip())
        return full_sql

    def generate_view(self, name, group) :
        return f"create or replace view {group}.{name}_publisher_view as"

    def generate_select(self, name, group) :
        return f"select distinct on ({name}.identifier,{name}_ts.sequence_number)"
    
    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar) || ' ' || {self.group}.{self.name}_ts.{uom}, '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
    
    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar), '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
    
    def generate_attributes(self, name, group) : 
        res = ["(row_number() OVER ())::integer AS row"]
        res.append(f"{group}.{name}.id")
        res.append(f"{group}.{name}_ts.id as ts_id")
        res.append(f"{group}.{name}_tsp.id as tsp_id")
        res.append(f"{group}.{name}.identifier")
        res.append(f"{group}.{name}_ts.interpretation")
        res.append(f"{group}.{name}_ts.sequence_number")
        res.append(f"{group}.{name}_ts.correction_number")        
        res.append(f"{group}.{name}_ts.valid_time_begin")
        res.append(f"{group}.{name}_ts.valid_time_end")
        res.append(f"{group}.{name}_ts.feature_lifetime_begin")
        res.append(f"{group}.{name}_ts.feature_lifetime_end")
        return res
    
    def generate_inner(self,name, group) : 
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
        return f"""
from {group}.{name} 
inner join master_join mj2 on {group}.{name}.id = mj2.source_id
inner join {group}.{name}_tsp on mj2.target_id = {group}.{name}_tsp.id
inner join {group}.{name}_ts on {group}.{name}_tsp.{name}timeslice_id = {group}.{name}_ts.id
    """

    def generate_where(self, name, group) : 
        return f"{name}_ts.feature_status = 'APPROVED'"
    
    def genrate_order(self, name, group) : 
        return f"order by {name}.identifier, {name}_ts.sequence_number, {name}_ts.correction_number DESC;"