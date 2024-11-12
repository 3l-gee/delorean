from enum import Enum
import xml.etree.ElementTree as ET
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


class Xml:
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

class Relation:
    @staticmethod
    def ONE_TO_ONE(cascade="CascadeType.ALL", fetch="FetchType.EAGER", orphanRemoval=False):   
        return f'@jakarta.persistence.OneToOne(cascade={cascade}, fetch={fetch}, orphanRemoval={str(orphanRemoval).lower()})'


    ONE_TO_MANY = '@jakarta.persistence.OneToMany'
    MANY_TO_ONE = '@jakarta.persistence.ManyToOne'
    MANY_TO_MANY = '@jakarta.persistence.ManyToMany'
    JOIN_COLUMN = lambda x : f'@jakarta.persistence.JoinColumn(name="{Util.snake_case(x)}_id")'

class Trensient:
    DB = '@jakarta.persistence.Transient'
    XML = '@jakarta.xml.bind.annotation.XmlTransient'



class Jpa:
    
    ENTITY = '@jakarta.persistence.Entity'
    ID = '@jakarta.persistence.Id'



print(Jaxb.PROPERTY.NAME_ELEMENT)
print(Jaxb.PROPERTY.NAME)
print(Relation.ONE_TO_ONE())