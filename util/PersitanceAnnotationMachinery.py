# this VERY unholy script will add persitance annotations to java classes given a config file that describes what annoatations should be added to what classes. 

from enum import Enum
import xml.etree.ElementTree as ET
import re

class Util:
    @staticmethod
    def snake_case(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
    
    def simple_column_name(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower().replace("_base_type","")
    
# Core Annotations
class CoreAnnotations(Enum):
    ENTITY = '@jakarta.persistence.Entity'
    MAPPEDSUPERCLASS = f'@jakarta.persistence.MappedSuperclass'
    TABLE_SNAKE = lambda x : f'@jakarta.persistence.Table(name = "{Util.snake_case(x)}")'
    TABLE_DBL_POINT = lambda x : f'@jakarta.persistence.Table(name = "{Util.snake_case(x)}")'
    ID = '@jakarta.persistence.Id'
    TRANSIENT = '@jakarta.persistence.Transient'
    COLUMN_SNAKE = lambda x : f'@jakarta.persistence.Column(name = "{Util.snake_case(x)}")'
    COLUMN_DBL_POINT = lambda x : f'@jakarta.persistence.Column(name = "{Util.snake_case(x)}")'
    GENERATED_VALUE = '@jakarta.persistence.GeneratedValue'
    SEQUENCE_GENERATOR = '@jakarta.persistence.SequenceGenerator'
    TABLE_GENERATOR = '@jakarta.persistence.TableGenerator'
    VERSION = '@jakarta.persistence.Version'


# Relationship Annotations
class RelationshipAnnotations(Enum):
    ONE_TO_ONE = '@jakarta.persistence.OneToOne'
    MANY_TO_ONE = '@jakarta.persistence.ManyToOne'
    ONE_TO_MANY = f'@jakarta.persistence.OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)'
    MANY_TO_MANY = '@jakarta.persistence.ManyToMany'
    JOIN_COLUMN = '@jakarta.persistence.JoinColumn'
    JOIN_TABLE = '@jakarta.persistence.JoinTable'
    MAPPED_BY = 'MappedBy'  # MappedBy is an attribute, not an annotation


# Additional Annotations
class AdditionalAnnotations(Enum):
    INHERITANCE = '@jakarta.persistence.Inheritance'
    DISCRIMINATOR_COLUMN = '@jakarta.persistence.DiscriminatorColumn'
    DISCRIMINATOR_VALUE = '@jakarta.persistence.DiscriminatorValue'
    EMBEDDABLE = '@jakarta.persistence.Embeddable'
    EMBEDDED = '@jakarta.persistence.Embedded'
    MAPSID = lambda x : f'''@jakarta.persistence.MapsId("{x}")'''
    ELEMENT_COLLECTION = '@jakarta.persistence.ElementCollection'
    TRANSIENT = '@jakarta.persistence.Transient'
    LOB = '@jakarta.persistence.Lob'
    BASIC = '@jakarta.persistence.Basic'
    ENUMERATED_STRING = '@jakarta.persistence.Enumerated(EnumType.STRING)'
    TEMPORAL = '@jakarta.persistence.Temporal'
    CACHEABLE = '@jakarta.persistence.Cacheable'
    FETCH = '@org.hibernate.annotations.Fetch'  # Hibernate-specific


# Spatial Annotations (Hibernate Spatial Module)
class SpatialAnnotations(Enum):
    TYPE = '@org.hibernate.annotations.Type'
    SPATIAL = '@org.hibernate.spatial.annotations.Spatial'
    SPATIAL_TYPE = '@org.hibernate.spatial.annotations.SpatialType'
    GEOMETRY = '@org.hibernate.spatial.annotations.Geometry'
    GEOMETRY_TYPE = '@org.hibernate.spatial.annotations.GeometryType'
    POINT = '@org.hibernate.spatial.annotations.Point'
    LINE_STRING = '@org.hibernate.spatial.annotations.LineString'
    POLYGON = '@org.hibernate.spatial.annotations.Polygon'
    MULTI_POINT = '@org.hibernate.spatial.annotations.MultiPoint'
    MULTI_LINE_STRING = '@org.hibernate.spatial.annotations.MultiLineString'
    MULTI_POLYGON = '@org.hibernate.spatial.annotations.MultiPolygon'

class JaxbAnnotations(Enum):
    COMPLEXTYPE = lambda x : f'''        <jaxb:bindings node="//xs:complexType[@name='{x}']">'''
    COMPLEXTYPE_ELEMENT_NAME = lambda x, y : f'''        <jaxb:bindings node="//xs:complexType[@name='{x}']//xs:element[@name='{y}']">'''
    COMPLEXTYPE_ELEMEENT_REF = lambda x, y : f'''        <jaxb:bindings node="//xs:complexType[@name='{x}']//xs:element[@ref='{y}']">'''
    COMPLEXTYPE_ATTRIBUTE_NAME = lambda x, y : f'''        <jaxb:bindings node="//xs:complexType[@name='{x}']//xs:attribute[@name='{y}']">'''
    SIMPLE = lambda x : f'''        <jaxb:bindings node="//xs:simpleType[@name='{x}']">'''
    GROUP = lambda x : f'''        <jaxb:bindings node="//xs:group[@name='{x}']">'''
    GROUP_ELEMENT = lambda x, y : f'''        <jaxb:bindings node="//xs:group[@name='{x}']//xs:element[@name='{y}']">'''
    ENUM_CLASS_START = lambda x : f'''            <jaxb:typesafeEnumClass name="{x}">'''
    ENUM_CLASS_END = '            </jaxb:typesafeEnumClass>'
    ENUM_MEMBER = lambda x : f'''                <jaxb:typesafeEnumMember name="{x}" value="{x}"/>'''
    PROPERTY_GENERATEELEMENT = f'''            <jaxb:property generateElementProperty="false"/>'''
    PROPERTY_NAME_GENERATEELEMENT =  f'''            <jaxb:property name="AIXMName" generateElementProperty="false"/>'''
    END = '        </jaxb:bindings>'

class AnnoxAnnotations(Enum):
    CLASS = lambda x : f'''            <annox:annotate target="class">{x}</annox:annotate>'''
    FIELD = lambda x : f'''            <annox:annotate target="field">{x}</annox:annotate>'''

class XmlTags(Enum):
    XS_NAMESPACE = "{http://www.w3.org/2001/XMLSchema}"
    TAG_IMPORT = XS_NAMESPACE + "import"
    TAG_ANNOTATION = XS_NAMESPACE + "annotation"
    TAG_INCLUDE = XS_NAMESPACE + "include"
    TAG_ELEMENT = XS_NAMESPACE + "element"
    TAG_ATTRIBUTE = XS_NAMESPACE + "attribute"
    TAG_COMPLEX_TYPE = XS_NAMESPACE + "complexType"
    TAG_SIMPLE_TYPE = XS_NAMESPACE + "simpleType"
    TAG_GROUP = XS_NAMESPACE + "group"

class EntityClass:
    entityClass = []

    @staticmethod
    def append(name):
        EntityClass.entityClass.append(str(name))

    @staticmethod
    def out():
        for entity in EntityClass.entityClass:
            print(str("com.aixm.delorean.core.schema.a5_1_1.aixm." + str(entity) + ".class,"))
    
class PersistenceAnnotationMachinery:
    # Define constants for XML namespace and tags

    LOCATION = set()
    GEOMETRY = set()

    def __init__(self,name: str,  input_path: str, output_path: str, ignore: list):
        print(f"Processing {name}...")
        self.name = name
        self.input_path = input_path
        self.output_path = output_path
        self.ignore = ignore
        self.root = ET.parse(self.input_path).getroot()
        self.annotations = [f"""
    <jaxb:bindings schemaLocation="{name}" node="/xs:schema">
"""]
        self.run()
    
    def return_annotations(self):
        self.annotations.append("    </jaxb:bindings>")
        return self.annotations

    def run(self):
        """Main function to process XML schema elements."""
        for child in self.root:
            if child.attrib.get("name") in self.ignore:
                print(f"Ignoring {child.attrib.get('name')}")
                
            else:
                self._process_child_class(child)
                self._process_child_field(child)


    def _process_child_class(self, child):
        """Dispatch processing based on the XML tag type."""
        abstract = bool(child.attrib.get('abstract', "")) or "Abstract" in child.attrib.get('name', "")
        nilreason = any(
            attribute.get('name') == 'nilReason' for attribute in child.findall('.//xs:attribute', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'})
        )
        
        if child.tag in [XmlTags.TAG_IMPORT.value, XmlTags.TAG_ANNOTATION.value, XmlTags.TAG_INCLUDE.value, XmlTags.TAG_GROUP.value, XmlTags.TAG_ELEMENT.value]:
            pass
        elif child.tag in [XmlTags.TAG_SIMPLE_TYPE.value]:
            pass
        elif child.tag in [XmlTags.TAG_COMPLEX_TYPE.value]:
            self.annotations += AnnoationsFunctions.class_writer(
                child, 
                abstract,
                nilreason
            )
        else:
            self._log_unrecognized_tag(child)

    def _process_child_field(self, child):
        """Dispatch processing based on the XML tag type."""
        if child.tag in [XmlTags.TAG_IMPORT.value, XmlTags.TAG_ANNOTATION.value, XmlTags.TAG_INCLUDE.value, XmlTags.TAG_ELEMENT.value]:
            pass
        elif child.tag in [XmlTags.TAG_SIMPLE_TYPE.value]:
            self.annotations += AnnoationsFunctions.smpl_field_writer(
                child,
                None,
                False,
            )
        elif child.tag in [XmlTags.TAG_GROUP.value]:
            for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                self.annotations += AnnoationsFunctions.grp_field_writer(
                    child,
                    element,
                    None,
                    False,
                )
        elif child.tag in [XmlTags.TAG_COMPLEX_TYPE.value]:
            for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                self.annotations += AnnoationsFunctions.cmplx_field_writer(
                    child,
                    element,
                    None,
                    False,
                )

            for element in child.findall('.//xs:attribute', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                self.annotations += AnnoationsFunctions.cmplx_field_writer(
                    child,
                    element,
                    None,
                    False,
                )
        else:
            self._log_unrecognized_tag(child)

    def _log_unrecognized_tag(self, child):
        """Log unrecognized tag for future troubleshooting."""
        print(f"Unrecognized tag: {child.tag}, {child.get('name')},{child.get('ref')}")

    def _log_missing_ref_or_name(self, parent, element):
        """Log cases where element is missing both 'name' and 'ref'."""
        print(f"Missing 'name' or 'ref' in element for complexType {parent.get('name')}. Element: {element.get('ref')}")

    def _log_invalid_max_occurs(self, parent, element):
        """Log cases where maxOccurs is neither '1' nor 'unbounded'."""
        print(f"Invalid 'maxOccurs': {element.get('maxOccurs')} in element {element.tag} of group {parent.get('name')}")

class AnnoationsFunctions:
    @staticmethod
    def class_writer(child, abstract: bool, nilreason: bool):
        res = []
        res.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        if abstract:
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.MAPPEDSUPERCLASS.value))
        elif nilreason :
            res.append(AnnoxAnnotations.CLASS(AdditionalAnnotations.EMBEDDABLE.value))
        elif "TimeSliceType" in child.get("name"):
            res.append(AnnoxAnnotations.CLASS(AdditionalAnnotations.EMBEDDABLE.value)) 
        else :
            EntityClass.append(child.attrib['name'])
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.ENTITY.value))
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.TABLE_SNAKE(child.attrib['name'])))
        res.append(JaxbAnnotations.END.value)
        return res
    
    def smpl_field_writer(child, spatial: enumerate, trensient: bool):
        res = []
        res.append(JaxbAnnotations.SIMPLE(child.attrib['name']))

        if trensient :
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.TRANSIENT.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        child_name = child.get("name")
        enum_values = child.findall('.//xs:enumeration', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'})
        if enum_values != []:
            res.append(JaxbAnnotations.ENUM_CLASS_START(child.attrib['name']))
            for enum in enum_values:
                res.append(JaxbAnnotations.ENUM_MEMBER(enum.attrib['value']))

            res.append(JaxbAnnotations.ENUM_CLASS_END.value)
        
        elif any(keyword in child_name for keyword in ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]):
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(Util.simple_column_name(child_name))))
        
        else :
            print(child.attrib['name'])

        res.append(JaxbAnnotations.END.value)
        return res

    def grp_field_writer(parent, child, spatial: enumerate, trensient: bool):
        res = []
        res.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))

        if trensient :
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.TRANSIENT.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        child_max_occurs = child.get("maxOccurs", "1")

        if child_max_occurs == "unbounded":
            res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
        elif child_max_occurs == "1":
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        else:
            pass

        child_name = child.get("name")

        if child_name == "name":
            res.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        else:
            res.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)

        res.append(JaxbAnnotations.END.value)
        return res
       
    def cmplx_field_writer(parent, child, spatial: enumerate, trensient: bool):
        res = []
        if child.attrib.get('name') and child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        elif child.attrib.get('ref') and child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        elif child.attrib.get('name') and child.tag == XmlTags.TAG_ATTRIBUTE.value :
            res.append(JaxbAnnotations.COMPLEXTYPE_ATTRIBUTE_NAME(parent.attrib['name'], child.attrib['name']))
        else:
            print(child.attrib.get('name'))
            print(child.tag == XmlTags.TAG_ATTRIBUTE)
            print(parent.attrib, child.attrib, child.tag)
      

        if trensient :
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.TRANSIENT.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        print(parent[0][0].get('base', ""))
        # print("PropertyType" in parent.get('name', "") and "TimeSlice" in child.get('ref', ""), parent.get('name', ""), child.get('ref', ""))
        # if "PropertyType" in parent.get('name', "") and "TimeSlice" in child.get('ref', ""):
        if "PropertyType" in parent.get('name', ""):
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.MAPSID("dbID")))
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.EMBEDDED.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        child_max_occurs = child.get("maxOccurs", "1")

        if child_max_occurs == "unbounded" and child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
        elif child_max_occurs == "1" and child.tag == XmlTags.TAG_ELEMENT.value:
            if 'name' in child.attrib:
                res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
            elif 'ref' in child.attrib:
                res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_DBL_POINT(child.attrib['ref'])))
        elif child.tag == XmlTags.TAG_ATTRIBUTE.value:
            extension = parent[0][0].attrib.get('base', "").split(":")[-1]
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(str(extension + "_" + child.attrib['name']))))

        child_name = child.get("name")

        if child_name == "name" and child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        elif child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)
        else :
            pass

        res.append(JaxbAnnotations.END.value)
        return res

    def class_cmplx_abs_annox(self, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.MAPPEDSUPERCLASS.value)) 
        self.annotations.append(JaxbAnnotations.END.value)
    
    def class_cmplx_typ_annox(self, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.ENTITY.value))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.TABLE_SNAKE(child.attrib['name'])))       
        self.annotations.append(JaxbAnnotations.END.value)

    def field_typ_annox_onetomany(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
        self.annotations.append(JaxbAnnotations.END.value)

    def field_cmplx_typ_annox_enum_name(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def field_cmplx_typ_annox_enum_ref(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_DBL_POINT(child.attrib['ref'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def field_grp_typ_annox_enum_name_gnrt_elmnt(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def field_grp_typ_annox_enum_name_name_gnrt_elmnt(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def field_cmplx_typ_annox_clmn_name(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def field_cmplx_typ_annox_clmn_ref(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_DBL_POINT(child.attrib['ref'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def field_grp_type_annox_clmn_name_gnrt_elmnt(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def field_grp_type_annox_clmn_name_name_gnrt_elmnt(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)


class PesitenceAnnotationsManager:
    def __init__ (self, task: list): 

        self.output_path = "util/aixm.xjb"
        self.annotations = [f"""
<jaxb:bindings 
    version="3.0"
    xmlns:jaxb="https://jakarta.ee/xml/ns/jaxb"
    xmlns:xjc="http://java.sun.com/xml/ns/jaxb/xjc"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xml="http://www.w3.org/XML/1998/namespace"
    xmlns:annox="urn:jaxb.jvnet.org:annox"
    jaxb:extensionBindingPrefixes="xjc annox">
"""]
    
        for item in task :
            temp = PersistenceAnnotationMachinery(item['name'], item['input_path'], item['output_path'], item['ignore'])
            self.annotations += temp.return_annotations()

        self.save_annotations()

    def save_annotations(self):
        self.annotations.append("</jaxb:bindings>")
        with open(self.output_path, 'w') as f:
            for annotation in self.annotations:
                f.write(annotation)
                f.write("\n")

class ExceptionTypes(Enum): 
    IGNORE = "ignore"

task = [
    # {
    #     "name": "AIXM_DataTypes.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    #     "output_path": "util/AIXM_DataTypes.xjb",
    #     "ignore": [
    #         "CodeDistanceVerticalUomType"
    #     ]
    # }
    # ,
    {
        "name": "AIXM_Features.xsd",
        "input_path": "src/main/resources/a5_1_1/AIXM_Features.xsd",
        "output_path": "util/AIXM_Features.xjb",
        "ignore": [
        ]
    }
    # , 
    # {
    #     "name": "AIXM_BasicMessage.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    #     "output_path": "util/AIXM_BasicMessage.xjb"
    # }
    # ,
    # {
    #     "name": "AIXM_AbstractGML_ObjectTypes.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    #     "output_path": "util/AIXM_AbstractGML_ObjectTypes.xjb"
    # }
    ]

PesitenceAnnotationsManager(task)

# EntityClass.out()

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_BasicMessage.xsd","util/test2.xml")

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")