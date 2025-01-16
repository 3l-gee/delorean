import re
from enum import Enum

TABLE = []

class Strategy(Enum):
    abstract = "abstract"
    feature = "feature"
    data_type = "data_type"
    other = "other"
    debug = "debug"

class Xpath(Enum):
    RELATIVE= "/xs:"
    ABSOLUTE= "xs:"
    GLOBAL =  "//xs:"

SQL_FORBIDEN_KEY_WORD = [
    "A",
    "ABORT",
    "ABS",
    "ABSENT",
    "ABSOLUTE",
    "ACCESS",
    "ACCORDING",
    "ACOS",
    "ACTION",
    "ADA",
    "ADD",
    "ADMIN",
    "AFTER",
    "AGGREGATE",
    "ALL",
    "ALLOCATE",
    "ALSO",
    "ALTER",
    "ALWAYS",
    "ANALYSE",
    "ANALYZE",
    "AND",
    "ANY",
    "ANY_VALUE",
    "ARE",
    "ARRAY",
    "ARRAY_AGG",
    "ARRAY_MAX_CARDINALITY",
    "AS",
    "ASC",
    "ASENSITIVE",
    "ASIN",
    "ASSERTION",
    "ASSIGNMENT",
    "ASYMMETRIC",
    "AT",
    "ATAN",
    "ATOMIC",
    "ATTACH",
    "ATTRIBUTE",
    "ATTRIBUTES",
    "AUTHORIZATION",
    "AVG",
    "BACKWARD",
    "BASE64",
    "BEFORE",
    "BEGIN",
    "BEGIN_FRAME",
    "BEGIN_PARTITION",
    "BERNOULLI",
    "BETWEEN",
    "BIGINT",
    "BINARY",
    "BIT",
    "BIT_LENGTH",
    "BLOB",
    "BLOCKED",
    "BOM",
    "BOOLEAN",
    "BOTH",
    "BREADTH",
    "BTRIM",
    "BY",
    "C",
    "CACHE",
    "CALL",
    "CALLED",
    "CARDINALITY",
    "CASCADE",
    "CASCADED",
    "CASE",
    "CAST",
    "CATALOG",
    "CATALOG_NAME",
    "CEIL",
    "CEILING",
    "CHAIN",
    "CHAINING",
    "CHAR",
    "CHARACTER",
    "CHARACTERISTICS",
    "CHARACTERS",
    "CHARACTER_LENGTH",
    "CHARACTER_SET_CATALOG",
    "CHARACTER_SET_NAME",
    "CHARACTER_SET_SCHEMA",
    "CHAR_LENGTH",
    "CHECK",
    "CHECKPOINT",
    "CLASS",
    "CLASSIFIER",
    "CLASS_ORIGIN",
    "CLOB",
    "CLOSE",
    "CLUSTER",
    "COALESCE",
    "COBOL",
    "COLLATE",
    "COLLATION",
    "COLLATION_CATALOG",
    "COLLATION_NAME",
    "COLLATION_SCHEMA",
    "COLLECT",
    "COLUMN",
    "COLUMNS",
    "COLUMN_NAME",
    "COMMAND_FUNCTION",
    "COMMAND_FUNCTION_CODE",
    "COMMENT",
    "COMMENTS",
    "COMMIT",
    "COMMITTED",
    "COMPRESSION",
    "CONCURRENTLY",
    "CONDITION",
    "CONDITIONAL",
    "CONDITION_NUMBER",
    "CONFIGURATION",
    "CONFLICT",
    "CONNECT",
    "CONNECTION",
    "CONNECTION_NAME",
    "CONSTRAINT",
    "CONSTRAINTS",
    "CONSTRAINT_CATALOG",
    "CONSTRAINT_NAME",
    "CONSTRAINT_SCHEMA",
    "CONSTRUCTOR",
    "CONTAINS",
    "CONTENT",
    "CONTINUE",
    "CONTROL",
    "CONVERSION",
    "CONVERT",
    "COPARTITION",
    "COPY",
    "CORR",
    "CORRESPONDING",
    "COS",
    "COSH",
    "COST",
    "COUNT",
    "COVAR_POP",
    "COVAR_SAMP",
    "CREATE",
    "CROSS",
    "CSV",
    "CUBE",
    "CUME_DIST",
    "CURRENT",
    "CURRENT_CATALOG",
    "CURRENT_DATE",
    "CURRENT_DEFAULT_TRANSFORM_GROUP",
    "CURRENT_PATH",
    "CURRENT_ROLE",
    "CURRENT_ROW",
    "CURRENT_SCHEMA",
    "CURRENT_TIME",
    "CURRENT_TIMESTAMP",
    "CURRENT_TRANSFORM_GROUP_FOR_TYPE",
    "CURRENT_USER",
    "CURSOR",
    "CURSOR_NAME",
    "CYCLE",
    "DATA",
    "DATABASE",
    "DATALINK",
    "DATE",
    "DATETIME_INTERVAL_CODE",
    "DATETIME_INTERVAL_PRECISION",
    "DAY",
    "DB",
    "DEALLOCATE",
    "DEC",
    "DECFLOAT",
    "DECIMAL",
    "DECLARE",
    "DEFAULT",
    "DEFAULTS",
    "DEFERRABLE",
    "DEFERRED",
    "DEFINE",
    "DEFINED",
    "DEFINER",
    "DEGREE",
    "DELETE",
    "DELIMITER",
    "DELIMITERS",
    "DENSE_RANK",
    "DEPENDS",
    "DEPTH",
    "DEREF",
    "DERIVED",
    "DESC",
    "DESCRIBE",
    "DESCRIPTOR",
    "DETACH",
    "DETERMINISTIC",
    "DIAGNOSTICS",
    "DICTIONARY",
    "DISABLE",
    "DISCARD",
    "DISCONNECT",
    "DISPATCH",
    "DISTINCT",
    "DLNEWCOPY",
    "DLPREVIOUSCOPY",
    "DLURLCOMPLETE",
    "DLURLCOMPLETEONLY",
    "DLURLCOMPLETEWRITE",
    "DLURLPATH",
    "DLURLPATHONLY",
    "DLURLPATHWRITE",
    "DLURLSCHEME",
    "DLURLSERVER",
    "DLVALUE",
    "DO",
    "DOCUMENT",
    "DOMAIN",
    "DOUBLE",
    "DROP",
    "DYNAMIC",
    "DYNAMIC_FUNCTION",
    "DYNAMIC_FUNCTION_CODE",
    "EACH",
    "ELEMENT",
    "ELSE",
    "EMPTY",
    "ENABLE",
    "ENCODING",
    "ENCRYPTED",
    "END",
    "END-EXEC",
    "END_FRAME",
    "END_PARTITION",
    "ENFORCED",
    "ENUM",
    "EQUALS",
    "ERROR",
    "ESCAPE",
    "EVENT",
    "EVERY",
    "EXCEPT",
    "EXCEPTION",
    "EXCLUDE",
    "EXCLUDING",
    "EXCLUSIVE",
    "EXEC",
    "EXECUTE",
    "EXISTS",
    "EXP",
    "EXPLAIN",
    "EXPRESSION",
    "EXTENSION",
    "EXTERNAL",
    "EXTRACT",
    "FALSE",
    "FAMILY",
    "FETCH",
    "FILE",
    "FILTER",
    "FINAL",
    "FINALIZE",
    "FINISH",
    "FIRST",
    "FIRST_VALUE",
    "FLAG",
    "FLOAT",
    "FLOOR",
    "FOLLOWING",
    "FOR",
    "FORCE",
    "FOREIGN",
    "FORMAT",
    "FORTRAN",
    "FORWARD",
    "FOUND",
    "FRAME_ROW",
    "FREE",
    "FREEZE",
    "FROM",
    "FS",
    "FULFILL",
    "FULL",
    "FUNCTION",
    "FUNCTIONS",
    "FUSION",
    "G",
    "GENERAL",
    "GENERATED",
    "GET",
    "GLOBAL",
    "GO",
    "GOTO",
    "GRANT",
    "GRANTED",
    "GREATEST",
    "GROUP",
    "GROUPING",
    "GROUPS",
    "HANDLER",
    "HAVING",
    "HEADER",
    "HEX",
    "HIERARCHY",
    "HOLD",
    "HOUR",
    # "ID",
    "IDENTITY",
    "IF",
    "IGNORE",
    "ILIKE",
    "IMMEDIATE",
    "IMMEDIATELY",
    "IMMUTABLE",
    "IMPLEMENTATION",
    "IMPLICIT",
    "IMPORT",
    "IN",
    "INCLUDE",
    "INCLUDING",
    "INCREMENT",
    "INDENT",
    "INDEX",
    "INDEXES",
    "INDICATOR",
    "INHERIT",
    "INHERITS",
    "INITIAL",
    "INITIALLY",
    "INLINE",
    "INNER",
    "INOUT",
    "INPUT",
    "INSENSITIVE",
    "INSERT",
    "INSTANCE",
    "INSTANTIABLE",
    "INSTEAD",
    "INT",
    "INTEGER",
    "INTEGRITY",
    "INTERSECT",
    "INTERSECTION",
    "INTERVAL",
    "INTO",
    "INVOKER",
    "IS",
    "ISNULL",
    "ISOLATION",
    "JOIN",
    "JSON",
    "JSON_ARRAY",
    "JSON_ARRAYAGG",
    "JSON_EXISTS",
    "JSON_OBJECT",
    "JSON_OBJECTAGG",
    "JSON_QUERY",
    "JSON_SCALAR",
    "JSON_SERIALIZE",
    "JSON_TABLE",
    "JSON_TABLE_PRIMITIVE",
    "JSON_VALUE",
    "K",
    "KEEP",
    "KEY",
    "KEYS",
    "KEY_MEMBER",
    "KEY_TYPE",
    "LABEL",
    "LAG",
    "LANGUAGE",
    "LARGE",
    "LAST",
    "LAST_VALUE",
    "LATERAL",
    "LEAD",
    "LEADING",
    "LEAKPROOF",
    "LEAST",
    "LEFT",
    "LENGTH",
    "LEVEL",
    "LIBRARY",
    "LIKE",
    "LIKE_REGEX",
    "LIMIT",
    "LINK",
    "LISTAGG",
    "LISTEN",
    "LN",
    "LOAD",
    "LOCAL",
    "LOCALTIME",
    "LOCALTIMESTAMP",
    "LOCATION",
    "LOCATOR",
    "LOCK",
    "LOCKED",
    "LOG",
    "LOG10",
    "LOGGED",
    "LOWER",
    "LPAD",
    "LTRIM",
    "M",
    "MAP",
    "MAPPING",
    "MATCH",
    "MATCHED",
    "MATCHES",
    "MATCH_NUMBER",
    "MATCH_RECOGNIZE",
    "MATERIALIZED",
    "MAX",
    "MAXVALUE",
    "MEASURES",
    "MEMBER",
    "MERGE",
    "MERGE_ACTION",
    "MESSAGE_LENGTH",
    "MESSAGE_OCTET_LENGTH",
    "MESSAGE_TEXT",
    "METHOD",
    "MIN",
    "MINUTE",
    "MINVALUE",
    "MOD",
    "MODE",
    "MODIFIES",
    "MODULE",
    "MONTH",
    "MORE",
    "MOVE",
    "MULTISET",
    "MUMPS",
    "NAME",
    "NAMES",
    "NAMESPACE",
    "NATIONAL",
    "NATURAL",
    "NCHAR",
    "NCLOB",
    "NESTED",
    "NESTING",
    "NEW",
    "NEXT",
    "NFC",
    "NFD",
    "NFKC",
    "NFKD",
    "NIL",
    "NO",
    "NONE",
    "NORMALIZE",
    "NORMALIZED",
    "NOT",
    "NOTHING",
    "NOTIFY",
    "NOTNULL",
    "NOWAIT",
    "NTH_VALUE",
    "NTILE",
    "NULL",
    "NULLABLE",
    "NULLIF",
    "NULLS",
    "NULL_ORDERING",
    "NUMBER",
    "NUMERIC",
    "OBJECT",
    "OCCURRENCE",
    "OCCURRENCES_REGEX",
    "OCTETS",
    "OCTET_LENGTH",
    "OF",
    "OFF",
    "OFFSET",
    "OIDS",
    "OLD",
    "OMIT",
    "ON",
    "ONE",
    "ONLY",
    "OPEN",
    "OPERATOR",
    "OPTION",
    "OPTIONS",
    "OR",
    "ORDER",
    "ORDERING",
    "ORDINALITY",
    "OTHERS",
    "OUT",
    "OUTER",
    "OUTPUT",
    "OVER",
    "OVERFLOW",
    "OVERLAPS",
    "OVERLAY",
    "OVERRIDING",
    "OWNED",
    "OWNER",
    "P",
    "PAD",
    "PARALLEL",
    "PARAMETER",
    "PARAMETER_MODE",
    "PARAMETER_NAME",
    "PARAMETER_ORDINAL_POSITION",
    "PARAMETER_SPECIFIC_CATALOG",
    "PARAMETER_SPECIFIC_NAME",
    "PARAMETER_SPECIFIC_SCHEMA",
    "PARSER",
    "PARTIAL",
    "PARTITION",
    "PASCAL",
    "PASS",
    "PASSING",
    "PASSTHROUGH",
    "PASSWORD",
    "PAST",
    "PATH",
    "PATTERN",
    "PER",
    "PERCENT",
    "PERCENTILE_CONT",
    "PERCENTILE_DISC",
    "PERCENT_RANK",
    "PERIOD",
    "PERMISSION",
    "PERMUTE",
    "PIPE",
    "PLACING",
    "PLAN",
    "PLANS",
    "PLI",
    "POLICY",
    "PORTION",
    "POSITION",
    "POSITION_REGEX",
    "POWER",
    "PRECEDES",
    "PRECEDING",
    "PRECISION",
    "PREPARE",
    "PREPARED",
    "PRESERVE",
    "PREV",
    "PRIMARY",
    "PRIOR",
    "PRIVATE",
    "PRIVILEGES",
    "PROCEDURAL",
    "PROCEDURE",
    "PROCEDURES",
    "PROGRAM",
    "PRUNE",
    "PTF",
    "PUBLIC",
    "PUBLICATION",
    "QUOTE",
    "QUOTES",
    "RANGE",
    "RANK",
    "READ",
    "READS",
    "REAL",
    "REASSIGN",
    "RECHECK",
    "RECOVERY",
    "RECURSIVE",
    "REF",
    "REFERENCES",
    "REFERENCING",
    "REFRESH",
    "REGR_AVGX",
    "REGR_AVGY",
    "REGR_COUNT",
    "REGR_INTERCEPT",
    "REGR_R2",
    "REGR_SLOPE",
    "REGR_SXX",
    "REGR_SXY",
    "REGR_SYY",
    "REINDEX",
    "RELATIVE",
    "RELEASE",
    "RENAME",
    "REPEATABLE",
    "REPLACE",
    "REPLICA",
    "REQUIRING",
    "RESET",
    "RESPECT",
    "RESTART",
    "RESTORE",
    "RESTRICT",
    "RESULT",
    "RETURN",
    "RETURNED_CARDINALITY",
    "RETURNED_LENGTH",
    "RETURNED_OCTET_LENGTH",
    "RETURNED_SQLSTATE",
    "RETURNING",
    "RETURNS",
    "REVOKE",
    "RIGHT",
    "ROLE",
    "ROLLBACK",
    "ROLLUP",
    "ROUTINE",
    "ROUTINES",
    "ROUTINE_CATALOG",
    "ROUTINE_NAME",
    "ROUTINE_SCHEMA",
    "ROW",
    "ROWS",
    "ROW_COUNT",
    "ROW_NUMBER",
    "RPAD",
    "RTRIM",
    "RULE",
    "RUNNING",
    "SAVEPOINT",
    "SCALAR",
    "SCALE",
    "SCHEMA",
    "SCHEMAS",
    "SCHEMA_NAME",
    "SCOPE",
    "SCOPE_CATALOG",
    "SCOPE_NAME",
    "SCOPE_SCHEMA",
    "SCROLL",
    "SEARCH",
    "SECOND",
    "SECTION",
    "SECURITY",
    "SEEK",
    "SELECT",
    "SELECTIVE",
    "SELF",
    "SEMANTICS",
    "SENSITIVE",
    "SEQUENCE",
    "SEQUENCES",
    "SERIALIZABLE",
    "SERVER",
    "SERVER_NAME",
    "SESSION",
    "SESSION_USER",
    "SET",
    "SETOF",
    "SETS",
    "SHARE",
    "SHOW",
    "SIMILAR",
    "SIMPLE",
    "SIN",
    "SINH",
    "SIZE",
    "SKIP",
    "SMALLINT",
    "SNAPSHOT",
    "SOME",
    "SORT_DIRECTION",
    "SOURCE",
    "SPACE",
    "SPECIFIC",
    "SPECIFICTYPE",
    "SPECIFIC_NAME",
    "SQL",
    "SQLCODE",
    "SQLERROR",
    "SQLEXCEPTION",
    "SQLSTATE",
    "SQLWARNING",
    "SQRT",
    "STABLE",
    "STANDALONE",
    "START",
    "STATE",
    "STATEMENT",
    "STATIC",
    "STATISTICS",
    "STDDEV_POP",
    "STDDEV_SAMP",
    "STDIN",
    "STDOUT",
    "STORAGE",
    "STORED",
    "STRICT",
    "STRING",
    "STRIP",
    "STRUCTURE",
    "STYLE",
    "SUBCLASS_ORIGIN",
    "SUBMULTISET",
    "SUBSCRIPTION",
    "SUBSET",
    "SUBSTRING",
    "SUBSTRING_REGEX",
    "SUCCEEDS",
    "SUM",
    "SUPPORT",
    "SYMMETRIC",
    "SYSID",
    "SYSTEM",
    "SYSTEM_TIME",
    "SYSTEM_USER",
    "T",
    "TABLE",
    "TABLES",
    "TABLESAMPLE",
    "TABLESPACE",
    "TABLE_NAME",
    "TAN",
    "TANH",
    "TARGET",
    "TEMP",
    "TEMPLATE",
    "TEMPORARY",
    "TEXT",
    "THEN",
    "THROUGH",
    "TIES",
    "TIME",
    "TITLE"
    "TIMESTAMP",
    "TIMEZONE_HOUR",
    "TIMEZONE_MINUTE",
    "TO",
    "TOKEN",
    "TOP_LEVEL_COUNT",
    "TRAILING",
    "TRANSACTION",
    "TRANSACTIONS_OMMITTED",
    "TRANSACTIONS_ROLLED_BACK",
    "TRANSACTION_ACTIVE",
    "TRANSFORM",
    "TRANSFORMS",
    "TRANSLATE",
    "TRANSLATE_REGEX",
    "TRANSLATION",
    "TREAT",
    "TRIGGER",
    "TRIGGER_CATALOG",
    "TRIGGER_NAME",
    "TRIGGER_SCHEMA",
    "TRIM",
    "TRIM_ARRAY",
    "TRUE",
    "TRUNCATE",
    "TRUSTED",
    "TYPE",
    "TYPES",
    "UESCAPE",
    "UNBOUNDED",
    "UNCOMMITTED",
    "UNCONDITIONAL",
    "UNDER",
    "UNENCRYPTED",
    "UNION",
    "UNIQUE",
    "UNKNOWN",
    "UNLINK",
    "UNLISTEN",
    "UNLOGGED",
    "UNMATCHED",
    "UNNAMED",
    "UNNEST",
    "UNTIL",
    "UNTYPED",
    "UPDATE",
    "UPPER",
    "URI",
    "USAGE",
    "USER",
    "USER_DEFINED_TYPE_CATALOG",
    "USER_DEFINED_TYPE_CODE",
    "USER_DEFINED_TYPE_NAME",
    "USER_DEFINED_TYPE_SCHEMA",
    "USING",
    "UTF16",
    "UTF32",
    "UTF8",
    "VACUUM",
    "VALID",
    "VALIDATE",
    "VALIDATOR",
    # "VALUE",
    "VALUES",
    "VALUE_OF",
    "VARBINARY",
    "VARCHAR",
    "VARIADIC",
    "VARYING",
    "VAR_POP",
    "VAR_SAMP",
    "VERBOSE",
    "VERSION",
    "VERSIONING",
    "VIEW",
    "VIEWS",
    "VOLATILE",
    "WHEN",
    "WHENEVER",
    "WHERE",
    "WHITESPACE",
    "WIDTH_BUCKET",
    "WINDOW",
    "WITH",
    "WITHIN",
    "WITHOUT",
    "WORK",
    "WRAPPER",
    "WRITE",
    "XML",
    "XMLAGG",
    "XMLATTRIBUTES",
    "XMLBINARY",
    "XMLCAST",
    "XMLCOMMENT",
    "XMLCONCAT",
    "XMLDECLARATION",
    "XMLDOCUMENT",
    "XMLELEMENT",
    "XMLEXISTS",
    "XMLFOREST",
    "XMLITERATE",
    "XMLNAMESPACES",
    "XMLPARSE",
    "XMLPI",
    "XMLQUERY",
    "XMLROOT",
    "XMLSCHEMA",
    "XMLSERIALIZE",
    "XMLTABLE",
    "XMLTEXT",
    "XMLVALIDATE",
    "YEAR",
    "YES",
    "ZONE",
]

class Util:
    @staticmethod
    def modify_forbiden_key_word(name):
        if name.upper() in SQL_FORBIDEN_KEY_WORD:
            name += "_"
        return name

    @staticmethod
    def snake_case(name):
        value = Util.short_name(name)
        try: 
            value = value.split(':')[-1]
        except:
            pass
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
        result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower()
        result = Util.modify_forbiden_key_word(result)
        return result

    @staticmethod
    def snake_case_table(name):
        value = Util.short_name(name)

        try: 
            value = value.split(':')[-1]
        except:
            pass
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
        result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower()
        result = Util.modify_forbiden_key_word(result)  
        return result

    def short_name(name):  
        replacements = {
            "TimeSlicePropertyType": "_Tsp",
            "PropertyGroup": "_Pg",
            "PropertyType": "_Pt",
            "TimeSliceType": "_Ts",
            "Type": "",
        }
        
        for key, value in replacements.items():
            name = name.replace(key, value)

        return name    

    def snake_case_join_table(name1, name2):

        name1 = Util.snake_case_table(name1)
        name2 = Util.snake_case_table(name2)

        result = f"{name1}_{name2}"

        result = Util.modify_forbiden_key_word(result)

        return result

    def snake_case_column(name):
        # value = Util.short_name(name)
        value = name

        try: 
            value = value.split(':')[-1]
        except:
            pass

        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
        result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower().replace("_base_type", "").replace("_type", "")
        result = Util.modify_forbiden_key_word(result)
        return result
    
    @staticmethod
    def bool_str(value):
        return str(value).lower()
    

class Property:
    @staticmethod
    def name(name="aixmName"):
        return f'<jaxb:property name="{name}"/>'
    
    element = '<jaxb:property generateElementProperty="false"/>'

    @staticmethod
    def name_element(name="aixmName"):
        return f'<jaxb:property name="{name}" generateElementProperty="false"/>'


class Jaxb:

    @staticmethod
    def java_type(name, type=None):
        if type:
            return f'''<jaxb:javaType name="{name}" xmlType="{type}" />'''
        
        return f'''<jaxb:javaType name="{name}" />'''
    
    @staticmethod
    def schema(value):
        return f'''<jaxb:bindings schemaLocation="{value}" node="/xs:schema">'''
    
    @staticmethod
    def package(value):
        return f'''<jaxb:package name="{value}" />'''

    @staticmethod
    def simple(value, xpath = Xpath.GLOBAL.value, at="name", ):
        return f'''<jaxb:bindings node="{xpath}simpleType[@{at}='{value}']">'''
    
    @staticmethod
    def complex(value, xpath = Xpath.GLOBAL.value, at="name"):
        return f'''<jaxb:bindings node="{xpath}complexType[@{at}='{value}']">'''
    
    @staticmethod
    def complex_xpath(value, xpath = Xpath.GLOBAL.value, at="name"):
        return f'''{xpath}complexType[@{at}='{value}']'''

    @staticmethod
    def group(value, xpath = Xpath.GLOBAL.value, at="name"):
        return f'''<jaxb:bindings node="{xpath}group[@{at}='{value}']">'''
    
    @staticmethod
    def group_xpath(value, xpath = Xpath.GLOBAL.value, at="name"):
        return f'''{xpath}group[@{at}='{value}']'''
    
    @staticmethod
    def element(value, parent="", xpath = Xpath.GLOBAL.value, at="name"):
        return f'''<jaxb:bindings node="{parent}{xpath}element[@{at}='{value}']">'''

    @staticmethod
    def attribute(value, parent="", xpath = Xpath.GLOBAL.value, at="name"):
        return f'''<jaxb:bindings node="{parent}{xpath}attribute[@{at}='{value}']">'''

    @staticmethod
    def enum_start(value):
        return f'''<jaxb:typesafeEnumClass name="{value}">'''

    @staticmethod
    def enum_member(name, value):
        return f'''<jaxb:typesafeEnumMember name="{name}" value="{value}"/>'''
    
    start ="""
<jaxb:bindings 
    version="3.0"
    xmlns:jaxb="https://jakarta.ee/xml/ns/jaxb"
    xmlns:xjc="http://java.sun.com/xml/ns/jaxb/xjc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:annox="urn:jaxb.jvnet.org:annox"
    jaxb:extensionBindingPrefixes="xjc annox">
"""
    enum_end = '</jaxb:typesafeEnumClass>'
    end = '</jaxb:bindings>'
    binding_start = '<jaxb:schemaBindings>'
    binding_end = '</jaxb:schemaBindings>'

    property = Property

class Annox:
    @staticmethod
    def class_add(annotation):
        return f'''<annox:annotate target="class">{annotation}</annox:annotate>'''

    @staticmethod
    def class_remove(annotation):
        return f'''<annox:removeAnnotation target="class">{annotation}</annox:annotate>'''

    @staticmethod
    def field_add(annotation):
        return f'''<annox:annotate target="field">{annotation}</annox:annotate>'''

    def field_remove(annotation):
        return f'''<annox:removeAnnotation target="field">{annotation}</annox:annotate>'''

class Tag:
    _xs_namespace = "{http://www.w3.org/2001/XMLSchema}"
    namespaces = {'xs': 'http://www.w3.org/2001/XMLSchema'}
    
    import_ = _xs_namespace + "import"
    annotation = _xs_namespace + "annotation"
    include = _xs_namespace + "include"
    element = _xs_namespace + "element"
    attribute = _xs_namespace + "attribute"
    complex_type = _xs_namespace + "complexType"
    simple_type = _xs_namespace + "simpleType"
    simple_content = _xs_namespace + "simpleContent"
    group = _xs_namespace + "group"
    all = _xs_namespace + "all"
    any = _xs_namespace + "any"
    any_attribute = _xs_namespace + "anyAttribute"
    choice = _xs_namespace + "choice"
    sequence = _xs_namespace + "sequence"
    restriction = _xs_namespace + "restriction"
    extension = _xs_namespace + "extension"
    key = _xs_namespace + "key"
    keyref = _xs_namespace + "keyref"
    unique = _xs_namespace + "unique"
    union = _xs_namespace + "union"
    attribute_group = _xs_namespace + "attributeGroup"
    complex_content = _xs_namespace + "complexContent"
    simple_content = _xs_namespace + "simpleContent"
    notation = _xs_namespace + "notation"
    documentation = _xs_namespace + "documentation"
    appinfo = _xs_namespace + "appinfo"
   
    #restriction 
    enumeration = _xs_namespace + "enumeration"
    fractionDigits = _xs_namespace + "fractionDigits"
    length = _xs_namespace + "length"
    maxExclusive = _xs_namespace + "maxExclusive"
    maxInclusive = _xs_namespace + "maxInclusive"
    maxLength = _xs_namespace + "maxLength"
    minExclusive = _xs_namespace + "minExclusive"
    minInclusive = _xs_namespace + "minInclusive"
    minLength  = _xs_namespace + "minLength"
    pattern = _xs_namespace + "pattern"
    totalDigits = _xs_namespace + "totalDigits"
    whiteSpace = _xs_namespace + "whiteSpace"

class Xml:
    tag = Tag
    transient = '@jakarta.xml.bind.annotation.XmlTransient'
    
    @staticmethod
    def type(name, propOrder=None):
        if propOrder is None:
            return f'@jakarta.xml.bind.annotation.XmlType(name = "{name}", propOrder = {{}})'
        else :
            return f'@jakarta.xml.bind.annotation.XmlType(name = "{name}", propOrder = {{"{propOrder}"}})'
    
    @staticmethod
    def element(name, type, required=True):
        return f'@jakarta.xml.bind.annotation.XmlElement(name = "{name}", required = {Util.bool_str(required)}, type = {type})'
    
    @staticmethod
    def adapter(name):
        return f'@jakarta.xml.bind.annotation.adapters.XmlJavaTypeAdapter({name})'

class Constraint: 

    def fraction_digits(value):
        pass

    @staticmethod
    def size(min, max):
        if min is None :
            return f'@jakarta.validation.constraints.Size(max={max})'

        elif max is None :
            return f'@jakarta.validation.constraints.Size(min={min})'
        
        else :
            return f'@jakarta.validation.constraints.Size(min={min}, max={max})'
        
    @staticmethod
    def pattern(value, message=""):
        """
        Escapes special characters in the provided value and returns a formatted Jakarta Persistence Pattern annotation.
        
        Args:
            value (str): The regular expression value to escape and embed in the annotation.
            message (str, optional): The validation message for the annotation. Default is an empty string.
            
        Returns:
            str: The formatted annotation string with escaped values.
        """
        if not value:
            raise ValueError("The 'value' parameter cannot be empty or None.")

        # Escape special characters for XML and Java
        escaped_value = (
            value.replace("\\", "\\\\")  # Escape backslashes for Java
                 .replace('"', '&quot;')  # Escape double quotes for XML
                 .replace('&', '&amp;')   # Escape ampersands for XML
                 .replace('<', '&lt;')    # Escape less-than symbols for XML
                 .replace('>', '&gt;')    # Escape greater-than symbols for XML
        )
        
        # Format the annotation string using f-strings
        return f'@jakarta.validation.constraints.Pattern(regexp = "{escaped_value}", message = "{message + " : " + escaped_value}")'

class Relation:

    @staticmethod
    def inhertiance(strategy="InheritanceType.TABLE_PER_CLASS"):
        return f'@jakarta.persistence.Inheritance(strategy = {strategy})'
        return
    @staticmethod
    def one_to_one(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):   
        return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def one_to_one_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):   
        return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={Util.bool_str(orphanRemoval)})'

    @staticmethod
    def one_to_many(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):   
        return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def one_to_many_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):   
        return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={Util.bool_str(orphanRemoval)})'
    
    @staticmethod
    def many_to_one(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):  
        return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch})'

    @staticmethod
    def many_to_one_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):  
        return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={Util.bool_str(orphanRemoval)})'
    
    @staticmethod
    def many_to_many(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):  
        return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def many_to_many_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):  
        return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={Util.bool_str(orphanRemoval)})'
    
    @staticmethod
    def join_column(name, referenced_column_name="id"):
        return f'@jakarta.persistence.JoinColumn(name="{Util.snake_case(name)}_id", referencedColumnName="{referenced_column_name}")'
    
    @staticmethod
    def join_table(name1, name2, join_columns, inverse_join_columns):
        name = Util.snake_case_join_table(name1, name2)
        return f'@jakarta.persistence.JoinTable(name = "{name}", joinColumns = @jakarta.persistence.JoinColumn(name = "{Util.snake_case(join_columns) + "_id"}"), inverseJoinColumns = @jakarta.persistence.JoinColumn(name = "{Util.snake_case(inverse_join_columns) + "_id"}"))'
    
    @staticmethod
    def collection_element():
        return f'@jakarta.persistence.ElementCollection'
    
    @staticmethod
    def collection_table(name, parent=None):
        if parent is None :
            return f'@jakarta.persistence.CollectionTable(name = "{Util.snake_case(name) + "_col"}")'
        else :
            return f'@jakarta.persistence.CollectionTable(name = "{Util.snake_case(name)}, joinColumns = @jakarta.persistence.JoinColumn(name = "{Util.snake_case(parent)}_id"))'

class Jpa:
    relation = Relation
    constraint = Constraint
    entity = '@jakarta.persistence.Entity'
    id = '@jakarta.persistence.Id'
    transient = '@jakarta.persistence.Transient'
    embeddable = '@jakarta.persistence.Embeddable'
    embedded = '@jakarta.persistence.Embedded'

    @staticmethod
    def column(name, length=255, nullable=True, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case_column(name)}", length = {length}, nullable = {Util.bool_str(nullable)}, unique = {Util.bool_str(unique)})'

    @staticmethod
    def column_with_definition(name, columnDefinition, length=255, nullable=True, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case_column(name)}", length = {length}, columnDefinition = "{columnDefinition}", nullable = {Util.bool_str(nullable)}, unique = {Util.bool_str(unique)})'
        
    @staticmethod
    def table(name, schema, prefix=None):
        if prefix is None:
            
            return f'@jakarta.persistence.Table(name = "{Util.snake_case(name)}", schema = "{schema}")'
        else:
            return f'@jakarta.persistence.Table(name = "{Util.snake_case(prefix) + "_" + Util.snake_case_table(name)}", schema = "{schema}")'

    @staticmethod
    def enumerated(value="STRING"):
        return f'@jakarta.persistence.Enumerated(jakarta.persistence.EnumType.{value})'
    
    @staticmethod
    def generated_value(strategy="jakarta.persistence.GenerationType.IDENTITY"):
        return f'@jakarta.persistence.GeneratedValue(strategy = {strategy})'
    
    @staticmethod
    def attribute_sub_override(attrib_name, column):
        return f'@jakarta.persistence.AttributeOverride(name = "{attrib_name}", column = {column})'

    @staticmethod
    def attribute_main_override(value):
        return f'@jakarta.persistence.AttributeOverrides({{{", ".join([str(v) for v in value])}}})'

class AixmEncoding : 
    FIELD = ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]
    CLASS = ["BaseType", "PropertyType", "TimeSlicePropertyType", "TimeSlice" ]
