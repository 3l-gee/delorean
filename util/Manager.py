import Machinery

# Snowflake : 
# segmentpointpropertygroup_facilitymakeup (3)
# propertieswithschedulepropertygroup_timeinterval (28)
# propertieswithschedulepropertygroup_annotation 
# propertieswithschedulepropertygroup_specialdateauthority (28)
# airspacelayerclasspropertygroup_associatedlevels 

debug = {
    "mode" : False,
    "entity" : {
        "mode" : True,
        "list" : ["PointPropertyType"]
    },
}

schema = {
    "aerial_refuelling"         : [],
    "airport_heliport"          : [],
    "airspace"                  : [],
    "geometry"                  : [],
    "navaids_points"            : [],
    "notes"                     : [],
    "obstacles"                 : [],
    "organisation"              : [],
    "procedure"                 : [],
    "route"                     : [],
    "rules_procedures"          : [],
    "service"                   : [],
    "shared"                    : [],
    "surveillance"              : [],
}

config = {
    "ignore": [
        "XHTMLType",
        "AIXMBasicMessageType",
        "AIXMBasicMessagePropertyGroup",
        "BasicMessageMemberAIXMPropertyType",
        "PointPropertyType",
        "CurvePropertyType",
        "SurfacePropertyType",
        "ElevatedPointPropertyType",
        "ElevatedCurvePropertyType",
        "ElevatedSurfacePropertyType",
        "AbstractAIXMMessageBaseType",
        "AbstractAIXMMessageType",
        "AbstractAIXMFeatureBaseType",
        "AbstractAIXMFeatureType",
        "AbstractAIXMTimeSliceBaseType",
        "AbstractAIXMTimeSliceType",
        "AbstractAIXMPropertyType",
        "AbstractAIXMObjectBaseType",
        "AbstractAIXMObjectType",
        "MessageMetadataPropertyType",
        "FeatureMetadataPropertyType",
        "FeatureTimeSliceMetadataPropertyType",
        "MessageMetadataPropertyType,",
    ],
    "transient" : [
        "aixm:AbstractDirectFlight",
        "aixm:AbstractPropertiesWithSchedule",
        "aixm:AbstractUsageConditio",
        "aixm:AbstractSurfaceContamination",
        "aixm:AbstractSegmentPoint",
        "aixm:AbstractUsageCondition",
        "extension",
        "aixm:XHTMLType",
        "aixm:AIXMBasicMessageType",
        "aixm:AIXMBasicMessagePropertyGroup",
        "aixm:BasicMessageMemberAIXMPropertyType",
        "aixm:AbstractAIXMMessageBaseType",
        "aixm:AbstractAIXMMessageType",
        "aixm:AbstractAIXMFeatureBaseType",
        "aixm:AbstractAIXMFeatureType",
        "aixm:AbstractAIXMTimeSliceBaseType",
        "aixm:AbstractAIXMTimeSliceType",
        "aixm:AbstractAIXMPropertyType",
        "aixm:AbstractAIXMObjectBaseType",
        "aixm:AbstractAIXMObjectType",
        "aixm:MessageMetadataPropertyType",
        "aixm:FeatureMetadataPropertyType",
        "aixm:FeatureTimeSliceMetadataPropertyType",
        "aixm:MessageMetadataPropertyType,",
    ],
    "embed": [
        "PointType",
        "ElevatedPointType",
        "CurveType",
        "ElevatedCurveType",
        "SurfaceType",
        "ElevatedSurfaceType",
        ],
    "abstract": [],
    "package": "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "output_path": "schema/aixm5_1_1/binding/aixm.xjb"
}

feature = {
    "name" : "../aixm/AIXM_Features",
    "path" : "schema/aixm5_1_1/aixm/AIXM_Features.xsd",
    "strategy" : Machinery.strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "manual" : "util/manual/a5_1_1/AIXM_Features.xjb"
}

data_types = {
    "name" : "../aixm/AIXM_DataTypes",
    "path" : "schema/aixm5_1_1/aixm/AIXM_DataTypes.xsd",
    "strategy" : Machinery.strategy.data_type,
    "manual" : "util/manual/a5_1_1/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
    "path" : "schema/aixm5_1_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Machinery.strategy.abstract,
    "manual" : "util/manual/a5_1_1/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "../aixm/message/AIXM_BasicMessage",
    "path" : "schema/aixm5_1_1/aixm/message/AIXM_BasicMessage.xsd",
    "strategy" : Machinery.strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.message",
    "manual" : "util/manual/a5_1_1/AIXM_BasicMessage.xjb"
}



machinery = Machinery.runner(config, debug, [data_types, feature, abstract, message],)

config = {
    "ignore": [
        "XHTMLType",
        "AIXMBasicMessageType",
        "AIXMBasicMessagePropertyGroup",
        "BasicMessageMemberAIXMPropertyType",
        "PointPropertyType",
        "CurvePropertyType",
        "SurfacePropertyType",
        "ElevatedPointPropertyType",
        "ElevatedCurvePropertyType",
        "ElevatedSurfacePropertyType",
        "AbstractAIXMMessageBaseType",
        "AbstractAIXMMessageType",
        "AbstractAIXMFeatureBaseType",
        "AbstractAIXMFeatureType",
        "AbstractAIXMTimeSliceBaseType",
        "AbstractAIXMTimeSliceType",
        "AbstractAIXMPropertyType",
        "AbstractAIXMObjectBaseType",
        "AbstractAIXMObjectType",
        "MessageMetadataPropertyType",
        "FeatureMetadataPropertyType",
        "FeatureTimeSliceMetadataPropertyType",
        "MessageMetadataPropertyType,",
    ],
    "transient" : [
        "aixm:AbstractDirectFlight",
        "aixm:AbstractPropertiesWithSchedule",
        "aixm:AbstractUsageConditio",
        "aixm:AbstractSurfaceContamination",
        "aixm:AbstractSegmentPoint",
        "aixm:AbstractUsageCondition",
        "extension",
        "aixm:XHTMLType",
        "aixm:AIXMBasicMessageType",
        "aixm:AIXMBasicMessagePropertyGroup",
        "aixm:BasicMessageMemberAIXMPropertyType",
        "aixm:AbstractAIXMMessageBaseType",
        "aixm:AbstractAIXMMessageType",
        "aixm:AbstractAIXMFeatureBaseType",
        "aixm:AbstractAIXMFeatureType",
        "aixm:AbstractAIXMTimeSliceBaseType",
        "aixm:AbstractAIXMTimeSliceType",
        "aixm:AbstractAIXMPropertyType",
        "aixm:AbstractAIXMObjectBaseType",
        "aixm:AbstractAIXMObjectType",
        "aixm:MessageMetadataPropertyType",
        "aixm:FeatureMetadataPropertyType",
        "aixm:FeatureTimeSliceMetadataPropertyType",
        "aixm:MessageMetadataPropertyType,",
    ],
    "embed": [
        "PointType",
        "ElevatedPointType",
        "CurveType",
        "ElevatedCurveType",
        "SurfaceType",
        "ElevatedSurfaceType",
        ],
    "abstract": [],
    "package": "com.aixm.delorean.core.schema.a5_1.aixm",
    "output_path": "schema/aixm5_1/binding/aixm.xjb"
}

feature = {
    "name" : "../aixm/AIXM_Features",
    "path" : "schema/aixm5_1/aixm/AIXM_Features.xsd",
    "strategy" : Machinery.strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1.aixm",
    "manual" : "util/manual/a5_1/AIXM_Features.xjb"
}

data_types = {
    "name" : "../aixm/AIXM_DataTypes",
    "path" : "schema/aixm5_1/aixm/AIXM_DataTypes.xsd",
    "strategy" : Machinery.strategy.data_type,
    "manual" : "util/manual/a5_1/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "../aixm/AIXM_AbstractGML_ObjectTypes",
    "path" : "schema/aixm5_1/aixm/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Machinery.strategy.abstract,
    "manual" : "util/manual/a5_1/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "../aixm/message/AIXM_BasicMessage",
    "path" : "schema/aixm5_1/aixm/message/AIXM_BasicMessage.xsd",
    "strategy" : Machinery.strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1.aixm.message",
    "manual" : "util/manual/a5_1/AIXM_BasicMessage.xjb"
}

machinery = Machinery.runner(config, debug, [data_types, feature, abstract, message],)