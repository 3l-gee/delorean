import re

class Util:

    @staticmethod
    def snake_case(name):
        value = name
        try : 
            value = name.split(':')[-1]
        except:
            pass
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', value)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower().replace("_base_type","").replace("_type","")
    
class Property:
    name = '<jaxb:property name="aixmName"/>'
    element = '<jaxb:property generateElementProperty="false"/>'
    name_element = '<jaxb:property name="aixmName" generateElementProperty="false"/>'


class Jaxb:

    @staticmethod
    def schema(value):
        return f'''<jaxb:bindings schemaLocation="{value}" node="/xs:schema">'''

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

    enum_end = '</jaxb:typesafeEnumClass>'
    end = '</jaxb:bindings>'

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
    xs_namespace = "{http://www.w3.org/2001/XMLSchema}"
    
    import_ = xs_namespace + "import"
    annotation = xs_namespace + "annotation"
    include = xs_namespace + "include"
    element = xs_namespace + "element"
    attribute = xs_namespace + "attribute"
    complex_type = xs_namespace + "complexType"
    simple_type = xs_namespace + "simpleType"
    group = xs_namespace + "group"
    all = xs_namespace + "all"
    any = xs_namespace + "any"
    any_attribute = xs_namespace + "anyAttribute"
    choice = xs_namespace + "choice"
    sequence = xs_namespace + "sequence"
    restriction = xs_namespace + "restriction"
    extension = xs_namespace + "extension"
    key = xs_namespace + "key"
    keyref = xs_namespace + "keyref"
    unique = xs_namespace + "unique"
    attribute_group = xs_namespace + "attributeGroup"
    complex_content = xs_namespace + "complexContent"
    simple_content = xs_namespace + "simpleContent"
    notation = xs_namespace + "notation"
    documentation = xs_namespace + "documentation"
    appinfo = xs_namespace + "appinfo"

class Xml:
    tag = Tag
    transient = '@jakarta.xml.bind.annotation.XmlTransient'
    @staticmethod
    def type(name, propOrder):
        return f'@jakarta.xml.bind.annotation.XmlType(name = "{name}", propOrder = {{"{propOrder}"}})'

class Relation:
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

class jpa:
    
    entity = '@jakarta.persistence.Entity'
    id = '@jakarta.persistence.Id'
    transient = '@jakarta.persistence.Transient'
    embeddable = '@jakarta.persistence.Embeddable'
    embedded = '@jakarta.persistence.Embedded'

    @staticmethod
    def column(name, nullable=False, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case(name)}", nullable = {nullable}, unique = {unique})'

    @staticmethod
    def column_with_definition(name, columnDefinition, nullable=False, unique=False):
        return f'@jakarta.persistence.Column(name = "{Util.snake_case(name)}", columnDefinition = "{columnDefinition}", nullable = {nullable}, unique = {unique})'
        
    @staticmethod
    def table(name, schema):
        return f'@jakarta.persistence.Table(name = "{Util.snake_case(name)}", schema = "{schema}")'

    @staticmethod
    def enumerated(value="STRING"):
        return f'@jakarta.persistence.Enumerated(jakarta.persistence.EnumType.{value})'
