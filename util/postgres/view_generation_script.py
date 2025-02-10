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
        "method" : r'public class ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "extends" : {
        "method" : r'extends ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "embedded_three": {
        "method": r'@AttributeOverrides\({\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\n.*protected ([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "embedded_two" : {
        "method" : r'@AttributeOverrides\({\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*@Column\(name = \"([A-Z|a-z|0-9|_]+)\".*\n.*\n.*protected ([A-Z|a-z|0-9|_]+)',
        "ignore" : [],
    },
    "type" : {
        "method" : r'protected ([A-Z|a-z|0-9|_]+)',
        "ignore" : []
    },
    "one_to_one": {
        "method": r'@JoinColumn\(name = "([A-Z|a-z|0-9|_]+)", referencedColumnName = "([A-Z|a-z|0-9|_]+)',
        "ignore": [],
    },
    "one_to_many": {
        "method": r'@JoinTable\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*,\s*joinColumns\s*=\s*\{\s*@JoinColumn\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*\)\s*\},\s*inverseJoinColumns\s*=\s*\{\s*@JoinColumn\s*\(\s*name\s*=\s*"([A-Z|a-z|0-9|_]+)"\s*\)\s*\}\s*\)',
        "ignore": [],
    },
}

attributes_config = {
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
        "ElevatedSurfaceType"
    ]
}


class ViewGenerationScript:
    def __init__(self, parsing_config, attributes_config, directory):
        self.parsing = parsing_config
        self.attributes = attributes_config
        self.directory = directory
        self.files = [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith(".java")]
        self.views = {
            "features": {},
            "objects": {},
            "properties": {},
            "time_slices": {},
        }

    def run(self):
        for file in self.files:
            self.process_file(file)

        self.save_to_file(self.views)

    def process_file(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()

        table_match = re.search(self.parsing["table"]["method"], content)
        if table_match:
            table_name = table_match.group(1)
            schema = table_match.group(2)
            full_table_name = f"{schema}.{table_name}"

            class_name = re.findall(self.parsing["class"]["method"], content)
            if class_name[0] in self.attributes["ignore"]:
                return
            
            parent_name = re.findall(self.parsing["extends"]["method"], content) or [None]
            raw_parents_columns = self.attributes["parents_attributes"].get(parent_name[0], [])
            raw_embedded_two = re.findall(self.parsing["embedded_two"]["method"], content)	
            raw_embedded_three = re.findall(self.parsing["embedded_three"]["method"], content)
            raw_one_to_one = re.findall(self.parsing["one_to_one"]["method"], content)
            raw_one_to_many = re.findall(self.parsing["one_to_many"]["method"], content)

            parent_columns = self.process_columns(schema, table_name, raw_parents_columns)
            columns, geom = self.process_embedded(schema, table_name, list(raw_embedded_two + raw_embedded_three), self.attributes["snowflake_attributes"])
            one_to_one = self.process_one_to_one(schema, table_name, raw_one_to_one)
            one_to_many = self.process_one_to_many(schema, table_name, raw_one_to_many)

            self.views[full_table_name] = {
                "info" : {
                    "class" : list(class_name),
                    "parent" : list(parent_name)
                },
                "columns" : list(columns + parent_columns),
                "one_to_one" : list(one_to_one),
                "one_to_many" : list(one_to_many),
                "geom" : geom
            }

    @staticmethod
    def process_embedded(schema, name, columns, snowflake_attributes):
        columns = []
        geoms = []
        for column in columns:
            print(column)
            # if column in snowflake_attributes:
            #     geoms.append(column)
            # else:
            #     columns.append(column)
        return columns, geoms


    @staticmethod
    def process_columns(schema, name, columns):
        res = []
        for column in columns:
            res.append(f"{schema}.{name}.{column}")
        return res

    @staticmethod
    def process_one_to_one(schema, name, columns):
        res = []
        for column in columns:
            res.append(f"{schema}.{name}.{column}")
        return res
    
    @staticmethod
    def process_one_to_many(schema, name, columns):
        res = []
        for column in columns:
            res.append(f"{schema}.{name}.{column}")
        return res


    def save_to_file(self, views):
        with open('util/postgres/views.json', 'w', encoding='utf-8') as file:
            json.dump(views, file, indent=4)

# Run the script
compilationScript = ViewGenerationScript(parsing_config, attributes_config, "util/postgres/test_dir")
compilationScript.run()
