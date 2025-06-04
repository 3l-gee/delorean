import os
import re
import json

# Configuration for extracting annotations
parsing_config = {
    "table": {
        "method": r'@Table\(name = "([A-Z|a-z|0-9|_]+)", schema = "([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "class" : {
        "method" : r'public\s+(?:abstract\s+)?class\s+([A-Za-z0-9_]+)',
        "ignore" : []
    },
    "extends" : {
        "method" : r'extends ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "column" : {
        "method" : r'    @Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\)',
        "ignore" : [],
    },
    "embedded_three": {
        "method": r'@AttributeOverrides\({\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\n.*protected ([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "embedded_two" : {
        "method" : r'@AttributeOverrides\({\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\n.*protected ([A-Z|a-z|0-9|_]+)',
        "ignore" : [],
    },
    "one_to_one": {
        "method": r'@JoinColumn\(name = \"([A-Z|a-z|0-9|_]+)\", referencedColumnName = \"([A-Z|a-z|0-9|_]+).*\n.*protected ([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "one_to_many": {
        "method": r'@JoinTable\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\(name = \"([A-Z|a-z|0-9|_]+).*\n.*\n.*\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\n.*protected List<([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    }
}

attributes_config = {
    "feature_parents" : [
        "AbstractAIXMFeatureType",
        "AbstractAirportHeliportProtectionAreaType",
        "AbstractGroundLightSystemType",
        "AbstractMarkingType",
        "AbstractRadarEquipmentType",
        "AbstractServiceType",
        "AbstractNavigationSystemCheckpointType",
        "AbstractNavaidEquipmentType",
        "AbstractProcedureType",
        "AbstractSegmentLegType",
    ],
    "parents_attributes" : {
        "AbstractAIXMPropertyType" : [
            "id"
        ],
        "AbstractAIXMObjectType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractSurfaceContaminationType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractUsageConditionType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractDirectFlightType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractPropertiesWithScheduleType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractPropertiesWithScheduleType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractPropertiesWithScheduleType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractSegmentPointType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractAIXMTimeSliceType" : [
            "id",
            "xml_id",
            "interpretation",
            "sequence_number",
            "correction_number",
            "valid_time_begin",
            "valid_time_end",
            "feature_lifetime_begin",
            "feature_lifetime_end"
        ],
        "AbstractAIXMFeatureType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractAirportHeliportProtectionAreaType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractGroundLightSystemType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractMarkingType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractRadarEquipmentType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractSurveillanceRadarType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractServiceType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractTrafficSeparationServiceType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractAirportGroundServiceType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractNavigationSystemCheckpointType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractNavaidEquipmentType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractProcedureType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractSegmentLegType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ],
        "AbstractApproachLegType" : [
            "id",
            "identifier",
            "identifier_code_space",
            "xml_id"
        ]
    },
    "snowflake_attributes" : {
        "PointPropertyType" : "geom",
        "CurvePropertyType" : "geom",
        "SurfacePropertyType" : "geom",
        "ElevatedPointPropertyType" : "geom",
        "ElevatedCurvePropertyType" : "geom",
        "ElevatedSurfacePropertyType" : "geom"
    },
    "ignore" : [
        "PointPropertyType",
        "PointType",
        "CurvePropertyType",
        "CurveType",
        "SurfacePropertyType",
        "SurfaceType",
        "ElevatedPointPropertyType",
        "ElevatedPointType",
        "ElevatedCurvePropertyType",
        "ElevatedCurveType",
        "ElevatedSurfacePropertyType"
        "ElevatedSurfaceType",
        "AbstractAIXMPropertyType",
        "AbstractAIXMObjectType",
        "AbstractSurfaceContaminationType",
        "AbstractUsageConditionType",
        "AbstractDirectFlightType",
        "AbstractPropertiesWithScheduleType",
        "AbstractPropertiesWithScheduleType",
        "AbstractPropertiesWithScheduleType",
        "AbstractSegmentPointType",
        "AbstractAIXMTimeSliceType",
        "AbstractAIXMFeatureType",
        "AbstractAirportHeliportProtectionAreaType",
        "AbstractGroundLightSystemType",
        "AbstractMarkingType",
        "AbstractRadarEquipmentType",
        "AbstractSurveillanceRadarType",
        "AbstractServiceType",
        "AbstractTrafficSeparationServiceType",
        "AbstractAirportGroundServiceType",
        "AbstractNavigationSystemCheckpointType",
        "AbstractNavaidEquipmentType",
        "AbstractProcedureType",
        "AbstractSegmentLegType",
        "AbstractApproachLegType"
    ]
}


class ViewGenerationScript:
    def __init__(self, parsing_config, attributes_config, directory):
        self.parsing = parsing_config
        self.attributes = attributes_config
        self.directory = directory
        self.files = [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith(".java")]
        self.views = {"top_timeslice_selection" : [], "table_name": {}, "feature" : {}}
        self.type_table = {}
        self.sql = ""

        self.extract_attributes()
        self.create_views()

        self.suffix_replacements = {
            "TimeSlicePropertyType": "",
            "PropertyGroup": "",
            "PropertyType": "",
            "TimeSliceType": "",
            "TimeSlice": "",
            "Type": "", 
        }

    def extract_attributes(self):
        """Process each Java file and extract relevant information."""
        for file in self.files:
            self.process_file(file)
        self.save_to_json_file()

    def create_views(self):
        """Create views in the database."""
        for key, value in self.views["feature"].items():
            self.generate_sql(key, value)

        self.save_to_txt_file()
    

    def generate_sql(self, key, feature):
        KEY = key
        HEAD = f"CREATE OR REPLACE VIEW {key.lower()}_view AS"
        SELECT = f"SELECT\n"
        SELECT += self.generate_select(key, feature["columns"])
        FROM = f"FROM\n"
        JOIN_1 = self.one_to_one_join(key, feature["one_to_one"])
        JOIN_2 = self.one_to_many_join(key, feature["one_to_many"])
        res = KEY + "\n" + HEAD + "\n" + SELECT + "\n" + FROM + "\n" + JOIN_1 + "\n" + JOIN_2
        self.sql += res + ";\n\n"

    def generate_select(self, key, columns):
        res = "    jsonb_build_object(\n"
        for column in columns:
            res += f"       '{column.split('.')[-1]}', {column},\n"
        if res.endswith(",\n"):
            res = res[:-2]
        res += f"\n    ) AS {key.lower()}"
        return res
    
    def one_to_one_join(self, key, features):
        joins = ""
        for feature in features:
            source = feature["source"]
            alias = feature["alias"]
            join_condition = feature["join_condition"]
            joins += f"-- {alias}\n"
            joins += f"LEFT JOIN {source}\nON {join_condition}\n"
        return joins

    def one_to_many_join(self, key, features):
        joins = ""
        for feature in features:
            source = feature["source"]
            alias = feature["alias"]
            join_table = feature["join_table"]
            first_join = feature["first_join"]
            second_join = feature["second_join"]
            joins += f"-- {alias}\n"
            joins += (
                f"LEFT JOIN {join_table}\nON {first_join}\n"
                f"LEFT JOIN {source}\nON {second_join}\n"
            )
        return joins

    def generate_join(self, table_name, column_name, parent_table_name, parent_column_name, inner_join = True):
        """Generate a join statement."""
        return f"LEFT JOIN {parent_table_name} ON {table_name}.{column_name} = {parent_table_name}.{parent_column_name}"
                

    def process_file(self, file_path):
        """Extract table, class, and column information from a Java file."""
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        table_match = re.search(self.parsing["table"]["method"], content)
        if not table_match:
            return  # Skip files that do not contain table annotations

        table_name, schema = table_match.groups()
        full_table_name = str(schema + "." + table_name)
        class_name = re.findall(self.parsing["class"]["method"], content) or [None]
        if class_name[0] in self.attributes["ignore"]:
            return  # Ignore specific classes
    
        self.views["table_name"][class_name[0]] = full_table_name

        feature_name = self.clean_feature_name(class_name[0])
        class_name = {
            "info": class_name[0],
            "table": full_table_name
        }
        parent_name = re.findall(self.parsing["extends"]["method"], content) or [None]
        
        if parent_name[0] in self.attributes["feature_parents"] :
            self.views["top_timeslice_selection"].append(full_table_name)


        columns = self.extract_columns(schema, table_name, content)
        parent_columns = self.extract_parent_columns(schema, table_name, parent_name)
        embedded_columns = self.extract_embedded_columns(schema, table_name, content)
        one_to_one = self.extract_one_to_one(schema, table_name, content)
        one_to_many = self.extract_one_to_many(schema, table_name, content)

        self.update_views(feature_name, class_name, parent_name, columns, parent_columns, embedded_columns, one_to_one, one_to_many)

    def clean_feature_name(self, class_name):
        """Remove suffixes from feature names for consistency."""
        # for suffix, replacement in self.suffix_replacements.items():
        #     class_name = class_name.replace(suffix, replacement)
        return class_name

    def extract_columns(self, schema, table, content):
        """Extract simple column definitions."""
        raw_columns = re.findall(self.parsing["column"]["method"], content)
        return [f"{schema}.{table}.{col}" for col in raw_columns]

    def extract_parent_columns(self, schema, table, parent_name):
        """Extract inherited columns from parent classes."""
        parent_columns = self.attributes["parents_attributes"].get(parent_name[0], [])
        return [f"{schema}.{table}.{col}" for col in parent_columns]

    def extract_embedded_columns(self, schema, table, content):
        """Extract embedded attributes (2 or 3 columns)."""
        embedded_columns = []
        raw_embedded_two = re.findall(self.parsing["embedded_two"]["method"], content)
        raw_embedded_three = re.findall(self.parsing["embedded_three"]["method"], content)

        for column in raw_embedded_two + raw_embedded_three:
            column_type = column[-1]
            for col_name in column[:-1]:  # Exclude the last element (which is the type)
                embedded_columns.append(f"{schema}.{table}.{col_name}")
        return embedded_columns

    def extract_one_to_one(self, schema, table, content):
        """Extract one-to-one relationships."""
        res = []
        raw_one_to_one = re.findall(self.parsing["one_to_one"]["method"], content)
        for col in raw_one_to_one:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[2],
                "join_condition": f"{schema}.{table}.{col[0]} = {col[2]}.{col[1]}"
            })
        return res

    def extract_one_to_many(self, schema, table, content):
        """Extract one-to-many relationships."""
        res = []
        raw_one_to_many = re.findall(self.parsing["one_to_many"]["method"], content)
        for col in raw_one_to_many:
            res.append({
                "source": f"{schema}.{table}",
                "alias": col[3],
                "join_table": f"{schema}.{col[0]}",
                "first_join": f"{schema}.{table}.id = {col[0]}.{col[1]}",
                "second_join" : f"{col[0]}.{col[2]} = {col[3]}.id"
            })
        return res
    
    def update_views(self, feature_name, class_name, parent_name, columns, parent_columns, embedded_columns, one_to_one, one_to_many):
        """Update the `views` dictionary with extracted information."""
        if feature_name not in self.views["feature"]:
            self.views["feature"][feature_name] = {
                "info": {"class": [], "parent": []},
                "columns": [], "one_to_one": [], "one_to_many": [], "geom": []
            }        

        feature = self.views["feature"][feature_name]
        feature["info"]["class"].append(class_name)
        feature["info"]["parent"].extend(parent_name)
        feature["columns"].extend(columns + embedded_columns + parent_columns) #parent_columns
        feature["one_to_one"].extend(one_to_one)
        feature["one_to_many"].extend(one_to_many)

    def save_to_json_file(self):
        """Save extracted data to a JSON file."""
        output_path = os.path.join('sqlgen/views.json')
        with open(output_path, 'w', encoding='utf-8') as file:
            json.dump(self.views, file, indent=4)
        print(f"Saved view definitions to {output_path}")

    def save_to_txt_file(self):
        """Save SQL commands to a text file."""
        output_path = os.path.join('sqlgen/views.sql')
        with open(output_path, 'w', encoding='utf-8') as file:
            file.write(self.sql)
        print(f"Saved SQL commands to {output_path}")

    

# Run the script
# compilationScript = ViewGenerationScript(parsing_config, attributes_config, "util/postgres/test_dir")

compilationScript = ViewGenerationScript(parsing_config, attributes_config, "src/main/java/com/aixm/delorean/core/schema/a5_1_1/aixm")