import os
import re
import json
from lib.viewMachinery import ViewMachinery

suffix = {
        "TimeSlicePropertyType": "",
        "PropertyGroup": "",
        "PropertyType": "",
        "TimeSliceType": "",
        "TimeSlice": "",
        "Type": "", 
    }

parsing = {
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

attributes= {
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


ViewMachinery("a5_1", parsing, attributes, "src/main/java/com/aixm/delorean/core/schema/a5_1/aixm")