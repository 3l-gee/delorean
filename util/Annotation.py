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

SQL_NON_RESERVED_KEY_WORD = [
    "ABORT",
    "ABSENT",
    "ABSOLUTE",
    "ACCESS",
    "ACTION",
    "ADD",
    "ADMIN",
    "AFTER",
    "AGGREGATE",
    "ALSO",
    "ALTER",
    "ALWAYS",
    "ASENSITIVE",
    "ASSERTION",
    "ASSIGNMENT",
    "AT",
    "ATOMIC",
    "ATTACH",
    "ATTRIBUTE",
    "BACKWARD",
    "BEFORE",
    "BEGIN",
    "BETWEEN",
    "BIGINT",
    "BIT",
    "BOOLEAN",
    "BREADTH",
    "BY",
    "CACHE",
    "CALL",
    "CALLED",
    "CASCADE",
    "CASCADED",
    "CATALOG",
    "CHAIN",
    "CHAR",
    "CHARACTER",
    "CHARACTERISTICS",
    "CHECKPOINT",
    "CLASS",
    "CLOSE",
    "CLUSTER",
    "COALESCE",
    "COLUMNS",
    "COMMENT",
    "COMMENTS",
    "COMMIT",
    "COMMITTED",
    "COMPRESSION",
    "CONDITIONAL",
    "CONFIGURATION",
    "CONFLICT",
    "CONNECTION",
    "CONSTRAINTS",
    "CONTENT",
    "CONTINUE",
    "CONVERSION",
    "COPY",
    "COST",
    "CSV",
    "CUBE",
    "CURRENT",
    "CURSOR",
    "CYCLE",
    "DATA",
    "DATABASE",
    "DAY",
    "DEALLOCATE",
    "DEC",
    "DECIMAL",
    "DECLARE",
    "DEFAULTS",
    "DEFERRED",
    "DEFINER",
    "DELETE",
    "DELIMITER",
    "DELIMITERS",
    "DEPENDS",
    "DEPTH",
    "DETACH",
    "DICTIONARY",
    "DISABLE",
    "DISCARD",
    "DOCUMENT",
    "DOMAIN",
    "DOUBLE",
    "DROP",
    "EACH",
    "EMPTY",
    "ENABLE",
    "ENCODING",
    "ENCRYPTED",
    "ENUM",
    "ERROR",
    "ESCAPE",
    "EVENT",
    "EXCLUDE",
    "EXCLUDING",
    "EXCLUSIVE",
    "EXECUTE",
    "EXISTS",
    "EXPLAIN",
    "EXPRESSION",
    "EXTENSION",
    "EXTERNAL",
    "EXTRACT",
    "FAMILY",
    "FILTER",
    "FINALIZE",
    "FIRST",
    "FLOAT",
    "FOLLOWING",
    "FORCE",
    "FORMAT",
    "FORWARD",
    "FUNCTION",
    "FUNCTIONS",
    "GENERATED",
    "GLOBAL",
    "GRANTED",
    "GREATEST",
    "GROUPING",
    "GROUPS",
    "HANDLER",
    "HEADER",
    "HOLD",
    "HOUR",
    "IDENTITY",
    "IF",
    "IMMEDIATE",
    "IMMUTABLE",
    "IMPLICIT",
    "IMPORT",
    "INCLUDE",
    "INCLUDING",
    "INCREMENT",
    "INDENT",
    "INDEX",
    "INDEXES",
    "INHERIT",
    "INHERITS",
    "INLINE",
    "INOUT",
    "INPUT",
    "INSENSITIVE",
    "INSERT",
    "INSTEAD",
    "INT",
    "INTEGER",
    "INTERVAL",
    "INVOKER",
    "ISOLATION",
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
    "JSON_VALUE",
    "KEEP",
    "KEY",
    "KEYS",
    "LABEL",
    "LANGUAGE",
    "LARGE",
    "LAST",
    "LEAKPROOF",
    "LEAST",
    "LEVEL",
    "LISTEN",
    "LOAD",
    "LOCAL",
    "LOCATION",
    "LOCK",
    "LOCKED",
    "LOGGED",
    "MAPPING",
    "MATCH",
    "MATCHED",
    "MATERIALIZED",
    "MAXVALUE",
    "MERGE",
    "MERGE_ACTION",
    "METHOD",
    "MINUTE",
    "MINVALUE",
    "MODE",
    "MONTH",
    "MOVE",
    "NAME",
    "NAMES",
    "NATIONAL",
    "NCHAR",
    "NESTED",
    "NEW",
    "NEXT",
    "NFC",
    "NFD",
    "NFKC",
    "NFKD",
    "NO",
    "NONE",
    "NORMALIZE",
    "NORMALIZED",
    "NOTHING",
    "NOTIFY",
    "NOWAIT",
    "NULLIF",
    "NULLS",
    "NUMERIC",
    "OBJECT",
    "OF",
    "OFF",
    "OIDS",
    "OLD",
    "OMIT",
    "OPERATOR",
    "OPTION",
    "OPTIONS",
    "ORDINALITY",
    "OTHERS",
    "OUT",
    "OVER",
    "OVERLAY",
    "OVERRIDING",
    "OWNED",
    "OWNER",
    "PARALLEL",
    "PARAMETER",
    "PARSER",
    "PARTIAL",
    "PARTITION",
    "PASSING",
    "PASSWORD",
    "PATH",
    "PLAN",
    "PLANS",
    "POLICY",
    "POSITION",
    "PRECEDING",
    "PRECISION",
    "PREPARE",
    "PREPARED",
    "PRESERVE",
    "PRIOR",
    "PRIVILEGES",
    "PROCEDURAL",
    "PROCEDURE",
    "PROCEDURES",
    "PROGRAM",
    "PUBLICATION",
    "QUOTE",
    "QUOTES",
    "RANGE",
    "READ",
    "REAL",
    "REASSIGN",
    "RECHECK",
    "RECURSIVE",
    "REF",
    "REFERENCING",
    "REFRESH",
    "REINDEX",
    "RELATIVE",
    "RELEASE",
    "RENAME",
    "REPEATABLE",
    "REPLACE",
    "REPLICA",
    "RESET",
    "RESTART",
    "RESTRICT",
    "RETURN",
    "RETURNS",
    "REVOKE",
    "ROLE",
    "ROLLBACK",
    "ROLLUP",
    "ROUTINE",
    "ROUTINES",
    "ROW",
    "ROWS",
    "RULE",
    "SAVEPOINT",
    "SCALAR",
    "SCHEMA",
    "SCHEMAS",
    "SCROLL",
    "SEARCH",
    "SECOND",
    "SECURITY",
    "SEQUENCE",
    "SEQUENCES",
    "SERIALIZABLE",
    "SERVER",
    "SESSION",
    "SET",
    "SETOF",
    "SETS",
    "SHARE",
    "SHOW",
    "SIMPLE",
    "SKIP",
    "SMALLINT",
    "SNAPSHOT",
    "SOURCE",
    "SQL",
    "STABLE",
    "STANDALONE",
    "START",
    "STATEMENT",
    "STATISTICS",
    "STDIN",
    "STDOUT",
    "STORAGE",
    "STORED",
    "STRICT",
    "STRING",
    "STRIP",
    "SUBSCRIPTION",
    "SUBSTRING",
    "SUPPORT",
    "SYSID",
    "SYSTEM",
    "TABLES",
    "TABLESPACE",
    "TARGET",
    "TEMP",
    "TEMPLATE",
    "TEMPORARY",
    "TEXT",
    "TIES",
    "TIME",
    "TIMESTAMP",
    "TRANSACTION",
    "TRANSFORM",
    "TREAT",
    "TRIGGER",
    "TRIM",
    "TRUNCATE",
    "TRUSTED",
    "TYPE",
    "TYPES",
    "UESCAPE",
    "UNBOUNDED",
    "UNCOMMITTED",
    "UNCONDITIONAL",
    "UNENCRYPTED",
    "UNKNOWN",
    "UNLISTEN",
    "UNLOGGED",
    "UNTIL",
    "UPDATE",
    "VACUUM",
    "VALID",
    "VALIDATE",
    "VALIDATOR",
    "VALUE",
    "VALUES",
    "VARCHAR",
    "VARYING",
    "VERSION",
    "VIEW",
    "VIEWS",
    "VOLATILE",
    "WHITESPACE",
    "WITHIN",
    "WITHOUT",
    "WORK",
    "WRAPPER",
    "WRITE",
    "XML",
    "XMLATTRIBUTES",
    "XMLCONCAT",
    "XMLELEMENT",
    "XMLEXISTS",
    "XMLFOREST",
    "XMLNAMESPACES",
    "XMLPARSE",
    "XMLPI",
    "XMLROOT",
    "XMLSERIALIZE",
    "XMLTABLE",
    "YEAR",
    "YES",
    "ZONE"
]

SQL_RESERVED_KEY_WORD = [
    "ALL",
    "ANALYSE",
    "ANALYZE",
    "AND",
    "ANY",
    "ARRAY",
    "AS",
    "ASC",
    "ASYMMETRIC",
    "AUTHORIZATION",
    "BINARY",
    "BOTH",
    "CASE",
    "CAST",
    "CHECK",
    "COLLATE",
    "COLLATION",
    "COLUMN",
    "CONCURRENTLY",
    "CONSTRAINT",
    "CREATE",
    "CROSS",
    "CURRENT_CATALOG",
    "CURRENT_DATE",
    "CURRENT_ROLE",
    "CURRENT_SCHEMA",
    "CURRENT_TIME",
    "CURRENT_TIMESTAMP",
    "CURRENT_USER",
    "DEFAULT",
    "DEFERRABLE",
    "DESC",
    "DISTINCT",
    "DO",
    "ELSE",
    "END",
    "EXCEPT",
    "FALSE",
    "FETCH",
    "FOR",
    "FOREIGN",
    "FREEZE",
    "FROM",
    "FULL",
    "GRANT",
    "GROUP",
    "HAVING",
    "ILIKE",
    "IN",
    "INITIALLY",
    "INNER",
    "INTERSECT",
    "INTO",
    "IS",
    "ISNULL",
    "JOIN",
    "LATERAL",
    "LEADING",
    "LEFT",
    "LIKE",
    "LIMIT",
    "LOCALTIME",
    "LOCALTIMESTAMP",
    "NATURAL",
    "NOT",
    "NOTNULL",
    "NULL",
    "OFFSET",
    "ON",
    "ONLY",
    "OR",
    "ORDER",
    "OUTER",
    "OVERLAPS",
    "PLACING",
    "PRIMARY",
    "REFERENCES",
    "RETURNING",
    "RIGHT",
    "SELECT",
    "SESSION_USER",
    "SIMILAR",
    "SOME",
    "SYMMETRIC",
    "SYSTEM_USER",
    "TABLE",
    "TABLESAMPLE",
    "THEN",
    "TO",
    "TRAILING",
    "TRUE",
    "UNION",
    "UNIQUE",
    "USER",
    "USING",
    "VARIADIC",
    "VERBOSE",
    "WHEN",
    "WHERE",
    "WINDOW",
    "WITH"
]
class Util:
    @staticmethod
    def modify_forbiden_key_word(name):
        if name.upper() in SQL_NON_RESERVED_KEY_WORD:
            name = '\"' + name + '\"'
    
        if name.upper() in SQL_RESERVED_KEY_WORD:
            name += "_"
        return name

    @staticmethod
    def snake_case(name, name_type=str):
        if type(name) is list : 
            names = [Util.snake_case(n, list) for n in name]
            return "_".join(names)

        else :
            value = Util.short_name(name)

            try: 
                value = value.split(':')[-1]
            except:
                pass

            s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
            result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower()
            if name_type is str:
                result = Util.modify_forbiden_key_word(result)
            return result

    @staticmethod
    def snake_case_table(name, name_type=str):
        if type(name) is list : 
            names = [Util.snake_case_table(n, list) for n in name]
            return "_".join(names)
        else : 
            value = Util.short_name(name)

            try: 
                value = value.split(':')[-1]
            except:
                pass

            s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
            result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower()
            if name_type is str:
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


    def snake_case_column(name, name_type=str):
        if type(name) is list :
            names = [Util.snake_case_column(n, list) for n in name]
            return "_".join(names)
        else :
            value = name

            try: 
                value = value.split(':')[-1]
            except:
                pass

            s1 = re.sub('(.)([A-Z][a-z]+)', r'\1\2', value)
            result = re.sub('([a-z0-9])([A-Z])', r'\1\2', s1).lower().replace("_base_type", "").replace("_type", "")
            if name_type is str:
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
        return f'@jakarta.persistence.JoinColumn(name="{Util.snake_case(str(name + "_id"))}", referencedColumnName="{referenced_column_name}")'
    
    @staticmethod
    def join_table(name1, name2, join_columns, inverse_join_columns):
        return f'@jakarta.persistence.JoinTable(name = "{Util.snake_case_table([name1, name2])}", joinColumns = @jakarta.persistence.JoinColumn(name = "{Util.snake_case(str(join_columns + "_id"))}"), inverseJoinColumns = @jakarta.persistence.JoinColumn(name = "{Util.snake_case(str(inverse_join_columns + "_id"))}"))'    
    @staticmethod
    def collection_element():
        return f'@jakarta.persistence.ElementCollection'
    
    @staticmethod
    def collection_table(name, parent=None):
        if parent is None :
            return f'@jakarta.persistence.CollectionTable(name = "{Util.snake_case(str(name + "_col"))}")'
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
            return f'@jakarta.persistence.Table(name = "{Util.snake_case([prefix,name])}", schema = "{schema}")'

    @staticmethod
    def enumerated(value="STRING"):
        return f'@jakarta.persistence.Enumerated(jakarta.persistence.EnumType.{value})'
    
    @staticmethod
    def generated_value(generator, strategy="jakarta.persistence.GenerationType.SEQUENCE"):
        return f'@jakarta.persistence.GeneratedValue(strategy = {strategy}, generator = "{generator}")'
    
    @staticmethod
    def sequence_generator(name):
        return f'@jakarta.persistence.SequenceGenerator(name = "{name}", sequenceName = "{name}", allocationSize = 1)'
    
    @staticmethod
    def attribute_sub_override(attrib_name, column):
        return f'@jakarta.persistence.AttributeOverride(name = "{attrib_name}", column = {column})'

    @staticmethod
    def attribute_main_override(value):
        return f'@jakarta.persistence.AttributeOverrides({{{", ".join([str(v) for v in value])}}})'

class AixmEncoding : 
    FIELD = ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]
    CLASS = ["BaseType", "PropertyType", "TimeSlicePropertyType", "TimeSlice" ]
