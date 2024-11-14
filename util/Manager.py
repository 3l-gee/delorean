import Machinery

config = {
    "ignore": ["ignore"],
    "embedable": ["embedable"],
    "embedded": ["embedded"],
    "constraint_methode": "psql",
    "package": "com.aixm.delorean.core.schema.a5_1_1.aixm"
}

feature = {
    "name" : "AIXM_Features",
    "path" : "src/main/resources/a5_1_1/AIXM_Features.xsd",
    "strategie" : Machinery.strategie.feature
}

data_types = {
    "name" : "AIXM_DataTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    "strategie" : Machinery.strategie.data_type
}

abstract = {
    "name" : "AIXM_AbstractGML_ObjectTypes",
    "path" : "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    "strategie" : Machinery.strategie.abstract
}

message = {
    "name" : "AIXM_BasicMessage",
    "path" : "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    "strategie" : Machinery.strategie.other
}

machinery = Machinery.runner(config, [data_types, feature, abstract, message])