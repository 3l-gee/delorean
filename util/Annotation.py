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
    NAME = '<jaxb:property name="aixmName"/>'
    ELEMENT = '<jaxb:property generateElementProperty="false"/>'
    NAME_ELEMENT = '<jaxb:property name="aixmName" generateElementProperty="false"/>'


class Jaxb:
    @staticmethod
    def COMPLEX(value, at="name"):
        return f'''<jaxb:bindings node="//xs:complexType[@{at}='{value}']">'''

    @staticmethod
    def GROUP(value, at="name"):
        return f'''<jaxb:bindings node="//xs:group[@{at}='{value}']">'''

    @staticmethod
    def ELEMENT(value, at="name"):
        return f'''<jaxb:bindings node="//xs:element[@{at}='{value}']">'''

    @staticmethod
    def ATTRIBUTE(value, at="name"):
        return f'''<jaxb:bindings node="//xs:attribute[@{at}='{value}']">'''

    @staticmethod
    def ENUM_START(value):
        return f'''<jaxb:typesafeEnumClass name="{value}">'''

    @staticmethod
    def ENUM_MEMBER(name, value):
        return f'''<jaxb:typesafeEnumMember name="{name}" value="{value}"/>'''

    ENUM_END = '</jaxb:typesafeEnumClass>'
    END = '</jaxb:bindings>'

    PROPERTY = Property

class Annox:
    @staticmethod
    def CLASS(annotation, add=True):
        if add == True:
            return f'''<annox:annotate target="class">{annotation}</annox:annotate>'''
        elif add == False:
            return f'''<annox:removeAnnotation target="class">{annotation}</annox:annotate>'''
        else : 
            ValueError("add must be True or False")

    @staticmethod
    def FIELD(annotation, add=True):
        if add == True:
            return f'''<annox:annotate target="field">{annotation}</annox:annotate>'''
        elif add == False:
            return f'''<annox:removeAnnotation target="class">{annotation}</annox:annotate>'''
        else : 
            ValueError("add must be True or False")

class Tag:
    XS_NAMESPACE = "{http://www.w3.org/2001/XMLSchema}"
    
    IMPORT = XS_NAMESPACE + "import"
    ANNOTATION = XS_NAMESPACE + "annotation"
    INCLUDE = XS_NAMESPACE + "include"
    ELEMENT = XS_NAMESPACE + "element"
    ATTRIBUTE = XS_NAMESPACE + "attribute"
    COMPLEX_TYPE = XS_NAMESPACE + "complexType"
    SIMPLE_TYPE = XS_NAMESPACE + "simpleType"
    GROUP = XS_NAMESPACE + "group"
    ALL = XS_NAMESPACE + "all"
    ANY = XS_NAMESPACE + "any"
    ANY_ATTRIBUTE = XS_NAMESPACE + "anyAttribute"
    CHOICE = XS_NAMESPACE + "choice"
    SEQUENCE = XS_NAMESPACE + "sequence"
    RESTRICTION = XS_NAMESPACE + "restriction"
    EXTENSION = XS_NAMESPACE + "extension"
    KEY = XS_NAMESPACE + "key"
    KEYREF = XS_NAMESPACE + "keyref"
    UNIQUE = XS_NAMESPACE + "unique"
    ATTRIBUTE_GROUP = XS_NAMESPACE + "attributeGroup"
    COMPLEX_CONTENT = XS_NAMESPACE + "complexContent"
    SIMPLE_CONTENT = XS_NAMESPACE + "simpleContent"
    NOTATION = XS_NAMESPACE + "notation"
    DOCUMENTATION = XS_NAMESPACE + "documentation"
    APPINFO = XS_NAMESPACE + "appinfo"

class Xml:
    TAG = Tag
    TRANSIENT = '@jakarta.xml.bind.annotation.XmlTransient'
    @staticmethod
    def TYPE(name, propOrder):
        return f'@jakarta.xml.bind.annotation.XmlType(name = "{name}", propOrder = {{"{propOrder}"}})'

class Relation:
    @staticmethod
    def ONE_TO_ONE(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):   
        if orphanRemoval==False:
            return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch})'
        
        else :
            return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'

    @staticmethod
    def ONE_TO_MANY(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):   
        if orphanRemoval==False:
            return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch})'
        
        else :
            return f'@jakarta.persistence.OneToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def MANY_TO_ONE(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):  
        if orphanRemoval==False:
            return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch})'
        
        else :
            return f'@jakarta.persistence.ManyToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def MANY_TO_MANY(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):  
        if orphanRemoval==False:
            return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch})'
        
        else :
            return f'@jakarta.persistence.ManyToMany(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'
    
    @staticmethod
    def JOIN_COLUMN(name, referencedColumnName="id"):
        return f'@jakarta.persistence.JoinColumn(name="{Util.snake_case(name)}_id", referencedColumnName={referencedColumnName})'
    
   

class jpa:
    
    ENTITY = '@jakarta.persistence.Entity'
    ID = '@jakarta.persistence.Id'
    TRANSIENT = '@jakarta.persistence.Transient'
    EMBEDDABLE = '@jakarta.persistence.Embeddable'
    EMBEDDED = '@jakarta.persistence.Embedded'

    @staticmethod
    def COLUMN(name, columnDefinition=None, nullable=True, 	unique=False):
        if columnDefinition is None:
            return f'@jakarta.persistence.Column(name = "{Util.snake_case(name)}", nullable = {nullable}, unique = {unique})'

        else:
            return  f'@jakarta.persistence.Column(name = "{Util.snake_case(name)}", columnDefinition = "{columnDefinition}",  nullable = {nullable}, unique = {unique})'
        
    @staticmethod
    def TABLE(name, schema=None):
        if schema is None:
            return f'@jakarta.persistence.Table(name = "{Util.snake_case(name)}")'
    
        else:
            return f'@jakarta.persistence.Table(name = "{Util.snake_case(name)}", schema = "{schema}")'

    @staticmethod
    def ENUMERATED(value="STRING"):
        return f'@jakarta.persistence.Enumerated(jakarta.persistence.EnumType.{value})'