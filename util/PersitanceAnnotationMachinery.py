# this VERY unholy script will add persitance annotations to java classes given a config file that describes what annoatations should be added to what classes. 

from enum import Enum
import xml.etree.ElementTree as ET
import re

class Util:
    @staticmethod
    def snake_case(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
    
# Core Annotations
class CoreAnnotations(Enum):
    ENTITY = '@jakarta.persistence.Entity'
    MAPPEDSUPERCLASS = f'@jakarta.persistence.MappedSuperclass'
    TABLE_SNAKE = lambda x : f'@jakarta.persistence.Table(name = "{Util.snake_case(x)}")'
    TABLE_DBL_POINT = lambda x : f'@jakarta.persistence.Table(name = "{Util.snake_case(x)}")'
    ID = '@jakarta.persistence.Id'
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
    GROUP = lambda x : f'''        <jaxb:bindings node="//xs:group[@name='{x}']">'''
    GROUP_ELEMENT = lambda x, y : f'''        <jaxb:bindings node="//xs:group[@name='{x}']//xs:element[@name='{y}']">'''
    PROPERTY_GENERATEELEMENT = f'''            <jaxb:property generateElementProperty="false"/>'''
    PROPERTY_NAME_GENERATEELEMENT =  f'''            <jaxb:property name="AIXMName" generateElementProperty="false"/>'''
    END = '        </jaxb:bindings>'

class AnnoxAnnotations(Enum):
    CLASS = lambda x : f'''            <annox:annotate target="class">{x}</annox:annotate>'''
    FIELD = lambda x : f'''            <annox:annotate target="field">{x}</annox:annotate>'''


class Util:
    @staticmethod
    def snake_case(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
    

class PersistenceAnnotationMachinery:
    def __init__(self, input_path: str, output_path: str):
        self.input_path = input_path
        self.output_path = output_path
        self.root = ET.parse(self.input_path).getroot()
        self.annotations = ["""
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
        self.run()
        self.save_annotations()

    def save_annotations(self):
        self.annotations.append("</jaxb:bindings>")
        with open(self.output_path, 'w') as f:
            for annotation in self.annotations:
                f.write(annotation)
                f.write("\n")

    def run(self):
        for child in self.root:
            if child.tag == "{http://www.w3.org/2001/XMLSchema}complexType":
                if bool(child.attrib.get('abstract')):
                    self._complex_abstract_type_annotation(child)
                else :
                    self._complex_type_annotation(child)

                for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                    if element.get("name") == "timeSlice" :
                        self._field_type_annotations_column_complex_element_name(child, element)

                    elif element.get("name") == "extension" :
                        pass #TODO

                    elif element.get("ref") is not None:
                        self._field_type_annotations_column_complex_element_ref(child, element)

                    else:
                        print(child.get("name"))
                        print(element.get("ref"))

            if child.tag == "{http://www.w3.org/2001/XMLSchema}group" :
                for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):

                    if element.get("maxOccurs", 1) == "unbounded":
                        self._field_type_annotations_unbounded(child, element)

                    if element.get("maxOccurs", 1) == 1:
                        if element.get("name") == "name" :
                            if "Code" in element.get("type"):
                                self._field_type_annotations_enumerations_property_name_generate_element(child, element)
                            else :
                                self._field_type_annotations_column_property_name_generate_element(child, element)
                        else:
                            if "Code" in element.get("type"):
                                self._field_type_annotations_enumerations_property_generate_element(child, element)
                            else :
                                self._field_type_annotations_column_property_generate_element(child, element)

            else:
                NotImplementedError(child.tag)
                pass

    def _complex_abstract_type_annotation(self, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.MAPPEDSUPERCLASS.value)) 
        self.annotations.append(JaxbAnnotations.END.value)
    
    def _complex_type_annotation(self, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.ENTITY.value))
        self.annotations.append(AnnoxAnnotations.CLASS(CoreAnnotations.TABLE_SNAKE(child.attrib['name'])))       
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_unbounded(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_enumerations_complex_element_name(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_enumerations_complex_element_ref(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_DBL_POINT(child.attrib['ref'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_enumerations_property_generate_element(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_enumerations_property_name_generate_element(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.ENUMERATED_STRING.value))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_column_complex_element_name(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_column_complex_element_ref(self, parent, child):
        self.annotations.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_DBL_POINT(child.attrib['ref'])))
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_column_property_generate_element(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)

    def _field_type_annotations_column_property_name_generate_element(self, parent, child):
        self.annotations.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))
        self.annotations.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(child.attrib['name'])))
        self.annotations.append(JaxbAnnotations.PROPERTY_NAME_GENERATEELEMENT.value)
        self.annotations.append(JaxbAnnotations.END.value)



PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_Features.xsd","util/test1.xml")

PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_BasicMessage.xsd","util/test2.xml")

PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")