import Machinery

config = {
    "ignore": [
        "AIXMBasicMessageType",
        "BasicMessageMemberAIXMPropertyType"
               ],
    "transient" : [],
    "embed": [],
    "abstract": [],
    "constraint_methode": "xjb",
    "package": "com.aixm.delorean.core.schema.a5_1_1.aixm",
    "output_path": "util/test_aixm.xjb"
}

feature = {
    "name" : "AIXM_Features",
    "path" : "src/main/resources/a5_1_1/AIXM_Features.xsd",
    "strategy" : Machinery.strategy.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.feature",
    "manual" : "util/manual/AIXM_Features.xjb"
}

data_types = {
    "name" : "AIXM_DataTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    "strategy" : Machinery.strategy.data_type,
    "manual" : "util/manual/AIXM_DataTypes.xjb"
}

abstract = {
    "name" : "AIXM_AbstractGML_ObjectTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategy" : Machinery.strategy.abstract,
    "manual" : "util/manual/AIXM_AbstractGML_ObjectTypes.xjb"
}

message = {
    "name" : "AIXM_BasicMessage",
    "path" : "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    "strategy" : Machinery.strategy.other,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.message",
    "manual" : "util/manual/AIXM_BasicMessage.xjb"
}

machinery = Machinery.runner(config, [data_types, feature, abstract, message])