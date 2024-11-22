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
    "strategie" : Machinery.strategie.feature,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.feature",
    "manual" : []
}

data_types = {
    "name" : "AIXM_DataTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    "strategie" : Machinery.strategie.data_type,
    "manual" : {}
}

abstract = {
    "name" : "AIXM_AbstractGML_ObjectTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategie" : Machinery.strategie.abstract,
    "manual" : {}
}

message = {
    "name" : "AIXM_BasicMessage",
    "path" : "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    "strategie" : Machinery.strategie.other,
    "package" : "com.aixm.delorean.core.schema.a5_1_1.aixm.message",
    "manual" : {}
}

machinery = Machinery.runner(config, [data_types, feature, abstract])