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
    # Define constants for XML namespace and tags
    XS_NAMESPACE = "{http://www.w3.org/2001/XMLSchema}"
    TAG_IMPORT = XS_NAMESPACE + "import"
    TAG_ANNOTATION = XS_NAMESPACE + "annotation"
    TAG_INCLUDE = XS_NAMESPACE + "include"
    TAG_ELEMENT = XS_NAMESPACE + "element"
    TAG_COMPLEX_TYPE = XS_NAMESPACE + "complexType"
    TAG_GROUP = XS_NAMESPACE + "group"
    LOCATION = set()
    GEOMETRY = set()


    def __init__(self, input_path: str, output_path: str):
        print(f"Processing {input_path}...")
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

        print(self.LOCATION)
        print(self.GEOMETRY)

    def save_annotations(self):
        self.annotations.append("</jaxb:bindings>")
        with open(self.output_path, 'w') as f:
            for annotation in self.annotations:
                f.write(annotation)
                f.write("\n")

    def run(self):
        """Main function to process XML schema elements."""
        for child in self.root:
            self._process_child_class(child)
            self._process_child_field(child)


    def _process_child_class(self, child):
        """Dispatch processing based on the XML tag type."""
        if child.tag in [self.TAG_IMPORT, self.TAG_ANNOTATION, self.TAG_INCLUDE, self.TAG_GROUP, self.TAG_ELEMENT]:
            pass
        elif child.tag in [self.TAG_COMPLEX_TYPE]:
            self.annotations += AnnoationsFunctions.class_writer(
                child, 
                bool(child.attrib.get('abstract')) or "Abstract" in child.attrib.get('name')
                )
        else:
            self._log_unrecognized_tag(child)

    def _process_child_field(self, child):
        """Dispatch processing based on the XML tag type."""
        if child.tag in [self.TAG_IMPORT, self.TAG_ANNOTATION, self.TAG_INCLUDE, self.TAG_ELEMENT]:
            pass
        elif child.tag in [self.TAG_COMPLEX_TYPE, self.TAG_GROUP]:
            for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                self.annotations += AnnoationsFunctions.field_writer(
                    child,
                    element,
                    None,
                    True,
                    bool(child.tag == self.TAG_COMPLEX_TYPE)
                )
        else:
            self._log_unrecognized_tag(child)

    # Define separate methods for each tag type, so it's easier to expand

    def _process_import(self, child):
        """Process 'import' tag (currently not implemented)."""
        pass  # Placeholder for future expansion

    def _process_annotation(self, child):
        """Process 'annotation' tag (currently not implemented)."""
        pass  # Placeholder for future expansion

    def _process_include(self, child):
        """Process 'include' tag (currently not implemented)."""
        pass  # Placeholder for future expansion

    def _process_element_field(self, child):
        """Process 'element' tag (currently not implemented)."""
        pass  # Placeholder for future expansion

    def _process_element_class(self, child):
        """Process 'element' tag (currently not implemented)."""
        pass  # Placeholder for future expansion

    def _process_complex_type_class(self, child):
        """Process 'complexType' tag."""
        if bool(child.attrib.get('abstract')) or "Abstract" in child.attrib.get('name'):
            self.class_cmplx_abs_annox(child)
        else:
            self.class_cmplx_typ_annox(child)

    def _process_complex_type_field(self, child):
        """Process 'complexType' tag."""
        for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
            self._process_complex_type_element(child, element)

    def _process_complex_type_element(self, parent, element):
        """Handle elements within complexType."""
        element_name = element.get("name")
        if element_name == "timeSlice":
            self.field_cmplx_typ_annox_clmn_name(parent, element)
        elif element_name == "extension":
            pass  # TODO: Implement handling for "extension"
        elif element.get("ref") is not None:
            self.field_cmplx_typ_annox_clmn_ref(parent, element)
        else:
            self._log_missing_ref_or_name(parent, element)

    def _process_group(self, child):
        """Process 'group' tag."""
        for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
            self._process_group_element(child, element)
            if element.get("name", "") == "location":
                self.LOCATION.add(element.get("type", ""))
            if element.get("name", "") == "geometryComponent":
                self.GEOMETRY.add(element.get("type", ""))

    def _process_group_element(self, parent, element):
        """Handle elements within a group."""
        max_occurs = element.get("maxOccurs", "1")

        if max_occurs == "unbounded":
            self.field_typ_annox_onetomany(parent, element)
        elif max_occurs == "1":
            self._process_group_element_with_max_occurs_1(parent, element)
        else:
            self._log_invalid_max_occurs(parent, element)

    def _process_group_element_with_max_occurs_1(self, parent, element):
        """Process group element where maxOccurs is 1."""
        element_name = element.get("name")
        element_type = element.get("type")

        if element_name == "name":
            self.field_grp_type_annox_clmn_name_name_gnrt_elmnt(parent, element)
        else:
            self.field_grp_type_annox_clmn_name_gnrt_elmnt(parent, element)

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
    def class_writer(child, abstract: bool):
        res = []
        res.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        if abstract:
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.MAPPEDSUPERCLASS.value))
        else :
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.ENTITY.value))
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.TABLE_SNAKE(child.attrib['name'])))
        res.append(JaxbAnnotations.END.value)
        return res
    
    def field_writer(parent, child, spatial: enumerate, trensient: bool, complex: bool):
        res = []
        if complex and child.attrib.get('name'):
            res.append(JaxbAnnotations.COMPLEXTYPE_ELEMENT_NAME(parent.attrib['name'], child.attrib['name']))
        elif complex and child.attrib.get('ref'):
            res.append(JaxbAnnotations.COMPLEXTYPE_ELEMEENT_REF(parent.attrib['name'], child.attrib['ref']))
        else :
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



PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_Features.xsd","util/test1.xml")

PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_BasicMessage.xsd","util/test2.xml")

PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")