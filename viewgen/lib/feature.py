import random
import string

class Feature :

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

        full_sql = "\n".join(part for part in sql_parts if part.strip()) + ";"
        return full_sql

    def generate_view(self, name, group) :
        return [f"create or replace view {group}.{name}_publisher_view as"]

    def generate_select(self, name, group) :
        return [f"select distinct on ({name}.identifier,{name}_ts.sequence_number)"]
    
    def generate_letter_hash(self, prefix, length=6):
        return prefix + '_' + ''.join(random.choices(string.ascii_lowercase, k=length))
    

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
        res.append(f"jsonb_agg(notes.note_view.note) AS feature_annotation")
        return res
        
    def generate_inner(self, name, group) : 
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
            f"from {group}.{name} ", 
            f"inner join master_join mj2 on {group}.{name}.id = mj2.source_id",
            f"inner join {group}.{name}_tsp on mj2.target_id = {group}.{name}_tsp.id",
            f"inner join {group}.{name}_ts on {group}.{name}_tsp.{name}timeslice_id = {group}.{name}_ts.id"
        ]

    def generate_left(self, name, group) :
        return [
            f"left join master_join mj3 on {group}.{name}_ts.id = mj3.source_id",
            f"left join notes.note_view on mj3.target_id = notes.note_view.id"
        ]

    def generate_where(self, name, group) : 
        return [
            f"{group}.{name}.feature_status = 'APPROVED'",
            f"{group}.{name}_ts.feature_status = 'APPROVED'"
        ]
    
    def genrate_order(self, name, group) : 
        return [
            f"order by {name}.identifier",
            f"{name}_ts.sequence_number",
            f"{name}_ts.correction_number DESC"
        ]
    
    def generate_group(self, name, group) :
        res = [f"{group}.{name}.id"]
        res.append(f"{group}.{name}_ts.id")
        res.append(f"{group}.{name}_tsp.id")
        res.append(f"{group}.{name}.identifier")
        res.append(f"{group}.{name}_ts.interpretation")
        res.append(f"{group}.{name}_ts.sequence_number")
        res.append(f"{group}.{name}_ts.correction_number")        
        res.append(f"{group}.{name}_ts.valid_time_begin")
        res.append(f"{group}.{name}_ts.valid_time_end")
        res.append(f"{group}.{name}_ts.feature_lifetime_begin")
        res.append(f"{group}.{name}_ts.feature_lifetime_end")
        return res 

    def add_group(self, name, column, group=None):
        if group:
            self.sql["group"].append(f"{group}.{name}.{column}")
        else:
            self.sql["group"].append(f"{name}.{column}")

    def add_attributes_three(self, value, uom, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar) || ' ' || {self.group}.{self.name}_ts.{uom}, '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
        self.add_group(str(self.name + "_ts"), value, self.group)
        self.add_group(str(self.name + "_ts"), uom, self.group)
        self.add_group(str(self.name + "_ts"), nil, self.group)

    def add_attributes_two(self, value, nil) :
        name = value.replace("_value","")
        self.sql["attributes"]["feature"].append(f"coalesce(cast({self.group}.{self.name}_ts.{value} as varchar), '(' || {self.group}.{self.name}_ts.{nil} || ')') as {name}")
        self.add_group(str(self.name + "_ts"), value, self.group)
        self.add_group(str(self.name + "_ts"), nil, self.group)

    def add_association_feature_one(self, group, name, role, col):
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

    def add_association_object_one(self):
        pass