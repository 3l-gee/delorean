import re

class Util:
    @staticmethod
    def snake_case(name, is_simple_type=False):
        value = name
        # if is_simple_type:
        for prefix in ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]:
            value = value.replace(prefix, "")
                    # break
        try: 
            value = value.split(':')[-1]
        except:
            pass
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', value)
        result = re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower().replace("_base_type", "").replace("_type", "")

        return result
    
class Property:
    name = '<jaxb:property name="aixmName"/>'
    element = '<jaxb:property generateElementProperty="false"/>'
    name_element = '<jaxb:property name="aixmName" generateElementProperty="false"/>'


class Jaxb:

    @staticmethod
    def schema(value):
        return f'''<jaxb:bindings schemaLocation="{value}" node="/xs:schema">'''
    
    @staticmethod
    def package(value):
        return f'''<jaxb:package name="{value}" />'''

    @staticmethod
    def simple(value, at="name"):
        return f'''<jaxb:bindings node="//xs:simpleType[@{at}='{value}']">'''
    
    @staticmethod
    def complex(value, at="name"):
        return f'''<jaxb:bindings node="//xs:complexType[@{at}='{value}']">'''

    @staticmethod
    def group(value, at="name"):
        return f'''<jaxb:bindings node="//xs:group[@{at}='{value}']">'''

    @staticmethod
    def element(value, at="name"):
        return f'''<jaxb:bindings node="//xs:element[@{at}='{value}']">'''

    @staticmethod
    def attribute(value, at="name"):
        return f'''<jaxb:bindings node="//xs:attribute[@{at}='{value}']">'''

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

    PROPERTY = Property

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
    whiteSpace = _xs_namespace + "whiteSpace "



class Xml:
    tag = Tag
    transient = '@jakarta.xml.bind.annotation.XmlTransient'
    @staticmethod
    def type(name, propOrder):
        return f'@jakarta.xml.bind.annotation.XmlType(name = "{name}", propOrder = {{"{propOrder}"}})'

class Constraint: 
    @staticmethod
    def fraction_digits(value):
        pass

    @staticmethod
    def size(min, max):
        if min is None :
            return f'@jakarta.persistence.Size(max={max})'

        elif max is None :
            return f'@jakarta.persistence.Size(min={min})'
        
        else :
            return f'@jakarta.persistence.Size(min={min}, max={max})'
        
    @staticmethod
    def pattern(value, message=""):
        escaped_value = value.replace('"', '&quot;').replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')
        return f'@jakarta.persistence.Pattern(regexp = "{escaped_value}", message = "{message}")'

class Relation:

    @staticmethod
    def inhertiance(strategy="InheritanceType.TABLE_PER_CLASS"):
        return f'@jakarta.persistence.Inheritance(strategy = {strategy})'
        return
    @staticmethod
    def one_to_one(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):   
        return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def one_to_one_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=True):   
        return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'

    @staticmethod
    def one_to_many(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):   
        return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def one_to_many_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=True):   
        return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def many_to_one(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):  
        return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch})'

    @staticmethod
    def many_to_one_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=True):  
        return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def many_to_many(cascade="CascadeType.ALL", fetch="FetchType.EAGER"):  
        return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch})'
    
    @staticmethod
    def many_to_many_with_orphan_removal(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=True):  
        return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def join_column(name, referencedColumnName="id"):
        return f'@jakarta.persistence.JoinColumn(name="{Util.snake_case(name)}_id", referencedColumnName={referencedColumnName})'

class Jpa:
    relation = Relation
    constraint = Constraint
    entity = '@jakarta.persistence.Entity'
    id = '@jakarta.persistence.Id'
    transient = '@jakarta.persistence.Transient'
    embeddable = '@jakarta.persistence.Embeddable'
    embedded = '@jakarta.persistence.Embedded'

    @staticmethod
    def column(name, is_simple_type=False, nullable=True, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case(name, is_simple_type)}", nullable = {nullable}, unique = {unique})'

    @staticmethod
    def column_with_definition(name, columnDefinition, is_simple_type=False, nullable=True, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case(name, is_simple_type,)}", columnDefinition = "{columnDefinition}", nullable = {nullable}, unique = {unique})'
        
    @staticmethod
    def table(name, schema):
        return f'@jakarta.persistence.Table(name = "{Util.snake_case(name)}", schema = "{schema}")'

    @staticmethod
    def enumerated(value="STRING"):
        return f'@jakarta.persistence.Enumerated(jakarta.persistence.EnumType.{value})'


class AixmEncoding : 
    FIELD = ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]
    CLASS = ["BaseType", "PropertyType", "TimeSlicePropertyType", "TimeSlice" ]
