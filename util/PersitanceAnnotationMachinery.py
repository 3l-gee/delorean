# this VERY unholy script will add persitance annotations to java classes given a config file that describes what annoatations should be added to what classes. 

from enum import Enum
import xml.etree.ElementTree as ET
import re

class Util:
    @staticmethod
    def snake_case(name):
        s1 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', name)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s1).lower()
    
    def snake_case_dbl_point(name):
        s1 =   name.split(":")[1]
        s2 = re.sub('(.)([A-Z][a-z]+)', r'\1_\2', s1)
        return re.sub('([a-z0-9])([A-Z])', r'\1_\2', s2).lower()

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
    TRANSIENT_DB = '@jakarta.persistence.Transient'
    TRANSIENT_XML = '@jakarta.xml.bind.annotation.XmlTransient'
    COLUMN_SNAKE = lambda x : f'@jakarta.persistence.Column(name = "{Util.snake_case(x)}")'
    COLUMN_SNAKE_NULLABLE = lambda x, y : f'@jakarta.persistence.Column(name = "{Util.snake_case(x)}", nullable = {y})'
    COLUMN_DBL_POINT = lambda x : f'@jakarta.persistence.Column(name = "{Util.snake_case(x)}")'
    GENERATED_VALUE = '@jakarta.persistence.GeneratedValue(strategy = jakarta.persistence.GenerationType.IDENTITY)'
    SEQUENCE_GENERATOR = '@jakarta.persistence.SequenceGenerator'
    TABLE_GENERATOR = '@jakarta.persistence.TableGenerator'
    VERSION = '@jakarta.persistence.Version'


# Relationship Annotations
class RelationshipAnnotations(Enum):
    ONE_TO_ONE = '@jakarta.persistence.OneToOne(cascade = CascadeType.ALL)'
    MANY_TO_ONE = '@jakarta.persistence.ManyToOne'
    ONE_TO_MANY = f'@jakarta.persistence.OneToMany(cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)'
    MANY_TO_MANY = '@jakarta.persistence.ManyToMany'
    JOIN_COLUMN = lambda x : f'@jakarta.persistence.JoinColumn(name = "{Util.snake_case_dbl_point(x)}_id")'
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
    embedable = []

    @staticmethod
    def add_to_embedable(name):
        EntityClass.embedable.append(str(name))

    @staticmethod
    def add_to_entity_class(name):
        EntityClass.entityClass.append(str(name))

    @staticmethod
    def print_entity_class():
        for entity in EntityClass.entityClass:
            print(str("com.aixm.delorean.core.schema.a5_1_1.aixm." + str(entity) + ".class,"))
        
    @staticmethod
    def pint_embedable():
        for entity in EntityClass.embedable:
            print(entity)
    
class PersistenceAnnotationMachinery:
    # Define constants for XML namespace and tags

    LOCATION = set()
    GEOMETRY = set()

    def __init__(self,name: str,  input_path: str, output_path: str, ignore: list, embedable: list = []):
        print(f"Processing {name}...")
        self.name = name
        self.input_path = input_path
        self.output_path = output_path
        self.ignore = ignore
        self.embedable = embedable
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
        embedable = child.attrib.get('name') in self.embedable
        
        if child.tag in [XmlTags.TAG_IMPORT.value, XmlTags.TAG_ANNOTATION.value, XmlTags.TAG_INCLUDE.value, XmlTags.TAG_GROUP.value, XmlTags.TAG_ELEMENT.value]:
            pass
        elif child.tag in [XmlTags.TAG_SIMPLE_TYPE.value]:
            pass
        elif child.tag in [XmlTags.TAG_COMPLEX_TYPE.value]:
            EntityClass.add_to_embedable(str('"' + child.attrib['name'] + '",'))
            try :
                if child[0][0].tag == "{http://www.w3.org/2001/XMLSchema}extension" and child[0][0][0][0].tag == "{http://www.w3.org/2001/XMLSchema}element" and child[0][0][0][0].attrib.get("ref") :
                    EntityClass.add_to_embedable(str('"' + child[0][0][0][0].attrib.get("ref").split(":")[1]+"Type" + '",'))
            except :
                pass
            self.annotations += AnnoationsFunctions.class_writer(
                child, 
                abstract,
                nilreason,
                embedable
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
                try :
                    embedable = element.attrib.get('type', "").split(":")[1] in self.embedable
                except : 
                    embedable = False
                self.annotations += AnnoationsFunctions.grp_field_writer(
                    child,
                    element,
                    None,
                    False,
                    embedable
                )
        elif child.tag in [XmlTags.TAG_COMPLEX_TYPE.value]:
            for element in child.findall('.//xs:element', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                try :
                    embedable = element.attrib.get('type', "").split(":")[1] in self.embedable
                except : 
                    embedable = False
                self.annotations += AnnoationsFunctions.cmplx_field_writer(
                    child,
                    element,
                    None,
                    False,
                    embedable
                )

            for element in child.findall('.//xs:attribute', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'}):
                try :
                    embedable = element.attrib.get('type', "").split(":")[1] in self.embedable
                except : 
                    embedable = False
                self.annotations += AnnoationsFunctions.cmplx_field_writer(
                    child,
                    element,
                    None,
                    False,
                    embedable
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
    def class_writer(child, abstract: bool, nilreason: bool, embedable: bool):
        res = []
        res.append(JaxbAnnotations.COMPLEXTYPE(child.attrib['name']))
        if abstract:
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.MAPPEDSUPERCLASS.value))
        elif nilreason or embedable:
            res.append(AnnoxAnnotations.CLASS(AdditionalAnnotations.EMBEDDABLE.value))
        elif "TimeSliceType" in child.get("name"):
            res.append(AnnoxAnnotations.CLASS(AdditionalAnnotations.EMBEDDABLE.value)) 
        else :
            EntityClass.add_to_entity_class(child.attrib['name'])
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.ENTITY.value))
            res.append(AnnoxAnnotations.CLASS(CoreAnnotations.TABLE_SNAKE(child.attrib['name'])))
        res.append(JaxbAnnotations.END.value)
        return res
    
    def smpl_field_writer(child, spatial: enumerate, trensient: bool):
        res = []
        res.append(JaxbAnnotations.SIMPLE(child.attrib['name']))

        if trensient :
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.TRANSIENT_DB.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        child_name = child.get("name")
        enum_values = child.findall('.//xs:enumeration', namespaces={'xs': 'http://www.w3.org/2001/XMLSchema'})
        if enum_values != []:
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(Util.simple_column_name(child.attrib['name']))))
            res.append(JaxbAnnotations.ENUM_CLASS_START(child.attrib['name']))
            for enum in enum_values:
                res.append(JaxbAnnotations.ENUM_MEMBER(enum.attrib['value']))

            res.append(JaxbAnnotations.ENUM_CLASS_END.value)
        
        elif any(keyword in child_name for keyword in ["Code", "Val", "Date", "Time", "NoNumber", "NoSequence", "Text"]):
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE(Util.simple_column_name(child_name))))
        
        else :
            print(child.attrib['name'])
            return []

        res.append(JaxbAnnotations.END.value)
        return res

    def grp_field_writer(parent, child, spatial: enumerate, trensient: bool, embedable: bool):
        res = []
        res.append(JaxbAnnotations.GROUP_ELEMENT(parent.attrib['name'], child.attrib['name']))

        if trensient :
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.TRANSIENT.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        if embedable:
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.EMBEDDED.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        child_max_occurs = child.get("maxOccurs", "1")

        if child_max_occurs == "unbounded":
            res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
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
       
    def cmplx_field_writer(parent, child, spatial: enumerate, trensient: bool, embedable: bool):
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

        if child.get('name') == "dbID" :
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.ID.value))
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.GENERATED_VALUE.value))
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.COLUMN_SNAKE_NULLABLE(child.attrib['name'], "false")))
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.TRANSIENT_XML.value))
            res.append(JaxbAnnotations.END.value)
            return res
    
        if trensient :
            res.append(AnnoxAnnotations.FIELD(CoreAnnotations.TRANSIENT_DB.value))
            res.append(JaxbAnnotations.END.value)
            return res
                
        if embedable:
            res.append(AnnoxAnnotations.FIELD(AdditionalAnnotations.EMBEDDED.value))
            res.append(JaxbAnnotations.END.value)
            return res
                
        child_max_occurs = child.get("maxOccurs", "1")

        if child_max_occurs == "unbounded" and child.tag == XmlTags.TAG_ELEMENT.value:
            res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_MANY.value))
            res.append(JaxbAnnotations.END.value)
            return res
        
        elif child_max_occurs == "1" and child.tag == XmlTags.TAG_ELEMENT.value:
            if 'name' in child.attrib:
                res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.JOIN_COLUMN(child.attrib['name'])))
                res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_ONE.value))

            elif 'ref' in child.attrib:
                res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.JOIN_COLUMN(child.attrib['ref'])))
                res.append(AnnoxAnnotations.FIELD(RelationshipAnnotations.ONE_TO_ONE.value))

        elif child.tag == XmlTags.TAG_ATTRIBUTE.value:
            extension = parent[0][0].attrib.get('base', "").split(":")[-1]
            print(child.attrib)
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
            temp = PersistenceAnnotationMachinery(item['name'], item['input_path'], item['output_path'], item['ignore'], item['embedable'])
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
    {
        "name": "AIXM_DataTypes.xsd",
        "input_path": "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
        "output_path": "util/AIXM_DataTypes.xjb",
        "ignore": [
            "CodeDistanceVerticalUomType"
        ],
        "embedable": [
            "CodeBuoyDesignatorType",
            "CodeICAOCountryType",
            "CodeReferencePathIdentifierType",
            "CodeRouteIndicatorType",
            "CodeAerialRefuellingPointType",
            "CodeAerialRefuellingPrefixType",
            "CodeAerialRefuellingType",
            "CodeAircraftCategoryType",
            "CodeAircraftEngineNumberType",
            "CodeAircraftEngineType",
            "CodeAircraftGroundServiceType",
            "CodeAircraftICAOType",
            "CodeAircraftStandType",
            "CodeAircraftType",
            "CodeAircraftWingspanClassType",
            "CodeAirportHeliportCollocationType",
            "CodeAirportHeliportDesignatorType",
            "CodeAirportHeliportType",
            "CodeAirportWarningType",
            "CodeAirspaceActivityType",
            "CodeAirspaceAggregationType",
            "CodeAirspaceClassificationType",
            "CodeAirspaceDependencyType",
            "CodeAirspaceDesignatorType",
            "CodeAirspacePointPositionType",
            "CodeAirspacePointRoleType",
            "CodeAirspaceType",
            "CodeAltitudeAdjustmentType",
            "CodeAltitudeUseType",
            "CodeApproachEquipmentAdditionalType",
            "CodeApproachGuidanceType",
            "CodeApproachLightingICAOType",
            "CodeApproachLightingType",
            "CodeApproachPrefixType",
            "CodeApproachType",
            "CodeApprovalType",
            "CodeApronElementType",
            "CodeApronSectionType",
            "CodeArcDirectionType",
            "CodeArrestingGearEnergyAbsorbType",
            "CodeArrestingGearEngageDeviceType",
            "CodeATCReportingType",
            "CodeAuralMorseType",
            "CodeAuthorityRoleType",
            "CodeAuthorityType",
            "CodeAviationStandardsType",
            "CodeBearingType",
            "CodeBuoyType",
            "CodeCardinalDirectionType",
            "CodeCheckpointCategoryType",
            "CodeColourType",
            "CodeCommunicationChannelType",
            "CodeCommunicationDirectionType",
            "CodeCommunicationModeType",
            "CodeComparisonType",
            "CodeContaminationType",
            "CodeCourseQualityILSType",
            "CodeCourseType",
            "CodeDayType",
            "CodeDeclaredDistanceType",
            "CodeDesignatedPointDesignatorType",
            "CodeDesignatedPointType",
            "CodeDesignStandardType",
            "CodeDirectionReferenceType",
            "CodeDirectionTurnType",
            "CodeDirectionType",
            "CodeDistanceIndicationType",
            "CodeDMEChannelType",
            "CodeDMEType",
            "CodeEmissionBandType",
            "CodeEquipmentAntiCollisionType",
            "CodeEquipmentUnavailableType",
            "CodeFacilityRankingType",
            "CodeFinalGuidanceType",
            "CodeFireFightingType",
            "CodeFlightDestinationType",
            "CodeFlightOriginType",
            "CodeFlightPurposeType",
            "CodeFlightRestrictionDesignatorType",
            "CodeFlightRestrictionType",
            "CodeFlightRuleType",
            "CodeFlightStatusType",
            "CodeFlightType",
            "CodeFlowConditionOperationType",
            "CodeFreeFlightType",
            "CodeFrictionDeviceType",
            "CodeFrictionEstimateType",
            "CodeFuelType",
            "CodeGeoBorderType",
            "CodeGradeSeparationType",
            "CodeGroundLightingType",
            "CodeGuidanceLineType",
            "CodeHeightReferenceType",
            "CodeHelicopterPerformanceType",
            "CodeHoldingCategoryType",
            "CodeHoldingUsageType",
            "CodeHoldingUseType",
            "CodeIATAType",
            "CodeICAOType",
            "CodeILSBackCourseType",
            "CodeIntegrityLevelILSType",
            "CodeIntensityStandByType",
            "CodeLanguageType",
            "CodeLevelSeriesType",
            "CodeLevelTableDesignatorType",
            "CodeLevelType",
            "CodeLightHoldingPositionType",
            "CodeLightingJARType",
            "CodeLightIntensityType",
            "CodeLightSourceType",
            "CodeLoadingBridgeType",
            "CodeLocationQualifierType",
            "CodeLogicalOperatorType",
            "CodeMarkerBeaconSignalType",
            "CodeMarkingConditionType",
            "CodeMarkingStyleType",
            "CodeMeteoConditionsType",
            "CodeMilitaryOperationsType",
            "CodeMilitaryRoutePointType",
            "CodeMilitaryStatusType",
            "CodeMilitaryTrainingType",
            "CodeMinimaFinalApproachPathType",
            "CodeMinimumAltitudeType",
            "CodeMinimumHeightType",
            "CodeMissedApproachType",
            "CodeMLSAzimuthType",
            "CodeMLSChannelType",
            "CodeNavaidDesignatorType",
            "CodeNavaidPurposeType",
            "CodeNavaidServiceType",
            "CodeNavigationAreaRestrictionType",
            "CodeNavigationAreaType",
            "CodeNavigationEquipmentType",
            "CodeNavigationSpecificationType",
            "CodeNDBUsageType",
            "CodeNitrogenType",
            "CodeNorthReferenceType",
            "CodeNotePurposeType",
            "CodeObstacleAreaType",
            "CodeObstacleAssessmentSurfaceType",
            "CodeObstructionIdSurfaceZoneType",
            "CodeOilType",
            "CodeOperationAirportHeliportType",
            "CodeOperationManoeuvringAreaType",
            "CodeOrganisationDesignatorType",
            "CodeOrganisationHierarchyType",
            "CodeOrganisationType",
            "CodeOxygenType",
            "CodePARType",
            "CodePassengerServiceType",
            "CodePCNMethodType",
            "CodePCNPavementType",
            "CodePCNSubgradeType",
            "CodePCNTyrePressureType",
            "CodePilotControlledLightingType",
            "CodePositionInILSType",
            "CodePrimaryRadarType",
            "CodeProcedureAvailabilityType",
            "CodeProcedureCodingStandardType",
            "CodeProcedureDistanceType",
            "CodeProcedureFixRoleType",
            "CodeProcedurePhaseType",
            "CodeProtectAreaSectionType",
            "CodeRadarServiceType",
            "CodeRadioEmissionType",
            "CodeRadioFrequencyAreaType",
            "CodeRadioSignalType",
            "CodeReferenceRoleType",
            "CodeReflectorType",
            "CodeRelativePositionType",
            "CodeRNPType",
            "CodeRoadType",
            "CodeRouteAvailabilityType",
            "CodeRouteDesignatorLetterType",
            "CodeRouteDesignatorPrefixType",
            "CodeRouteDesignatorSuffixType",
            "CodeRouteNavigationType",
            "CodeRouteOriginType",
            "CodeRouteSegmentPathType",
            "CodeRouteType",
            "CodeRuleProcedureTitleType",
            "CodeRuleProcedureType",
            "CodeRunwayElementType",
            "CodeRunwayMarkingType",
            "CodeRunwayPointRoleType",
            "CodeRunwayProtectionAreaType",
            "CodeRunwaySectionType",
            "CodeRunwayType",
            "CodeRVRReadingType",
            "CodeRVSMPointRoleType",
            "CodeRVSMType",
            "CodeSafeAltitudeType",
            "CodeSegmentPathType",
            "CodeSegmentTerminationType",
            "CodeServiceATCType",
            "CodeServiceATFMType",
            "CodeServiceGroundControlType",
            "CodeServiceInformationType",
            "CodeServiceSARType",
            "CodeSideType",
            "CodeSignalPerformanceILSType",
            "CodeSpecialDateType",
            "CodeSpecialNavigationChainDesignatorType",
            "CodeSpecialNavigationStationType",
            "CodeSpecialNavigationSystemType",
            "CodeSpeedReferenceType",
            "CodeStandbyPowerType",
            "CodeStatusAirportType",
            "CodeStatusAirspaceType",
            "CodeStatusConstructionType",
            "CodeStatusNavaidType",
            "CodeStatusOperationsType",
            "CodeStatusServiceType",
            "CodeSurfaceCompositionType",
            "CodeSurfaceConditionType",
            "CodeSurfacePreparationType",
            "CodeSystemActivationType",
            "CodeTAAType",
            "CodeTACANChannelType",
            "CodeTaxiwayElementType",
            "CodeTaxiwaySectionType",
            "CodeTaxiwayType",
            "CodeTelecomNetworkType",
            "CodeTimeEventCombinationType",
            "CodeTimeEventType",
            "CodeTimeReferenceType",
            "CodeTLOFSectionType",
            "CodeTrajectoryType",
            "CodeTransponderType",
            "CodeUnitDependencyType",
            "CodeUnitType",
            "CodeUpperAlphaType",
            "CodeUsageLimitationType",
            "CodeUUIDType",
            "CodeValueInterpretationType",
            "CodeVASISType",
            "CodeVerticalDatumType",
            "CodeVerticalReferenceType",
            "CodeVerticalStructureMarkingType",
            "CodeVerticalStructureMaterialType",
            "CodeVerticalStructureType",
            "CodeVisualDockingGuidanceType",
            "CodeVORType",
            "CodeWakeTurbulenceType",
            "CodeWorkAreaType",
            "CodeYesNoType",
            "DateMonthDayType",
            "DateTimeType",
            "DateType",
            "DateYearType",
            "NoNumberType",
            "NoSequenceType",
            "TextAddressType",
            "TextDesignatorType",
            "TextInstructionType",
            "TextNameType",
            "TextNoteType",
            "TextPhoneType",
            "TextPropertyNameType",
            "TextRemarkType",
            "TextSIDSTARDesignatorType",
            "TimeType",
            "ValAlarmLimitType",
            "ValAngleType",
            "ValBearingType",
            "ValChannelNumberType",
            "ValDepthType",
            "ValDistanceSignedType",
            "ValDistanceType",
            "ValDistanceVerticalType",
            "ValDurationType",
            "ValFLType",
            "ValFrequencyType",
            "ValFrictionType",
            "ValHexType",
            "ValLCNType",
            "ValLightIntensityType",
            "ValMagneticVariationChangeType",
            "ValMagneticVariationType",
            "ValPCNType",
            "ValPercentType",
            "ValPressureType",
            "ValSlopeType",
            "ValSpeedType",
            "ValTemperatureType",
            "ValWeightType",
            "XHTMLType",
        ]
    }
    ,
    {
        "name": "AIXM_Features.xsd",
        "input_path": "src/main/resources/a5_1_1/AIXM_Features.xsd",
        "output_path": "util/AIXM_Features.xjb",
        "ignore": [
            "AerialRefuellingPropertyType",
            "AirportHeliportPropertyType",
            "AirportHeliportCollocationPropertyType",
            "AirportHeliportProtectionAreaPropertyType",
            "AirportHotSpotPropertyType",
            "AltimeterSourcePropertyType",
            "NonMovementAreaPropertyType",
            "SurveyControlPointPropertyType",
            "WorkAreaPropertyType",
            "AircraftStandPropertyType",
            "ApronPropertyType",
            "ApronElementPropertyType",
            "DeicingAreaPropertyType",
            "PassengerLoadingBridgePropertyType",
            "RoadPropertyType",
            "TouchDownLiftOffPropertyType",
            "TouchDownLiftOffSafeAreaPropertyType",
            "ApproachLightingSystemPropertyType",
            "ApronLightSystemPropertyType",
            "GroundLightSystemPropertyType",
            "GuidanceLineLightSystemPropertyType",
            "RunwayDirectionLightSystemPropertyType",
            "RunwayProtectAreaLightSystemPropertyType",
            "TaxiHoldingPositionLightSystemPropertyType",
            "TaxiwayLightSystemPropertyType",
            "TouchDownLiftOffLightSystemPropertyType",
            "AirportProtectionAreaMarkingPropertyType",
            "ApronMarkingPropertyType",
            "DeicingAreaMarkingPropertyType",
            "GuidanceLineMarkingPropertyType",
            "MarkingPropertyType",
            "RunwayMarkingPropertyType",
            "StandMarkingPropertyType",
            "TaxiHoldingPositionMarkingPropertyType",
            "TaxiwayMarkingPropertyType",
            "TouchDownLiftOffMarkingPropertyType",
            "ArrestingGearPropertyType",
            "RunwayPropertyType",
            "RunwayBlastPadPropertyType",
            "RunwayCentrelinePointPropertyType",
            "RunwayDirectionPropertyType",
            "RunwayElementPropertyType",
            "RunwayProtectAreaPropertyType",
            "RunwayVisualRangePropertyType",
            "VisualGlideSlopeIndicatorPropertyType",
            "FloatingDockSitePropertyType",
            "MarkingBuoyPropertyType",
            "SeaplaneLandingAreaPropertyType",
            "SeaplaneRampSitePropertyType",
            "GuidanceLinePropertyType",
            "TaxiHoldingPositionPropertyType",
            "TaxiwayPropertyType",
            "TaxiwayElementPropertyType",
            "AirspacePropertyType",
            "AuthorityForAirspacePropertyType",
            "GeoBorderPropertyType",
            "HoldingPatternPropertyType",
            "UnplannedHoldingPropertyType",
            "AzimuthPropertyType",
            "CheckpointINSPropertyType",
            "CheckpointVORPropertyType",
            "DirectionFinderPropertyType",
            "DMEPropertyType",
            "ElevationPropertyType",
            "GlidepathPropertyType",
            "LocalizerPropertyType",
            "MarkerBeaconPropertyType",
            "NavaidPropertyType",
            "NavaidEquipmentPropertyType",
            "NavigationSystemCheckpointPropertyType",
            "NDBPropertyType",
            "SDFPropertyType",
            "SpecialNavigationStationPropertyType",
            "SpecialNavigationSystemPropertyType",
            "TACANPropertyType",
            "VORPropertyType",
            "AngleIndicationPropertyType",
            "DistanceIndicationPropertyType",
            "DesignatedPointPropertyType",
            "SignificantPointInAirspacePropertyType",
            "AeronauticalGroundLightPropertyType",
            "ObstacleAreaPropertyType",
            "VerticalStructurePropertyType",
            "OrganisationAuthorityPropertyType",
            "UnitPropertyType",
            "InstrumentApproachProcedurePropertyType",
            "TerminalArrivalAreaPropertyType",
            "CirclingAreaPropertyType",
            "StandardInstrumentArrivalPropertyType",
            "NavigationAreaPropertyType",
            "StandardInstrumentDeparturePropertyType",
            "SafeAltitudeAreaPropertyType",
            "ApproachLegPropertyType",
            "ArrivalFeederLegPropertyType",
            "ArrivalLegPropertyType",
            "DepartureLegPropertyType",
            "FinalLegPropertyType",
            "InitialLegPropertyType",
            "IntermediateLegPropertyType",
            "MissedApproachLegPropertyType",
            "NavigationAreaRestrictionPropertyType",
            "ProcedurePropertyType",
            "ProcedureDMEPropertyType",
            "SegmentLegPropertyType",
            "ChangeOverPointPropertyType",
            "RoutePropertyType",
            "RouteDMEPropertyType",
            "RouteSegmentPropertyType",
            "AirspaceBorderCrossingPropertyType",
            "FlightRestrictionPropertyType",
            "RulesProceduresPropertyType",
            "AircraftGroundServicePropertyType",
            "AirportClearanceServicePropertyType",
            "AirportGroundServicePropertyType",
            "AirportSuppliesServicePropertyType",
            "AirTrafficControlServicePropertyType",
            "AirTrafficManagementServicePropertyType",
            "FireFightingServicePropertyType",
            "GroundTrafficControlServicePropertyType",
            "InformationServicePropertyType",
            "PassengerServicePropertyType",
            "PilotControlledLightingPropertyType",
            "RadioCommunicationChannelPropertyType",
            "SearchRescueServicePropertyType",
            "ServicePropertyType",
            "TrafficSeparationServicePropertyType",
            "RadioFrequencyAreaPropertyType",
            "SpecialDatePropertyType",
            "StandardLevelColumnPropertyType",
            "StandardLevelSectorPropertyType",
            "StandardLevelTablePropertyType",
            "HoldingAssessmentPropertyType",
            "PrecisionApproachRadarPropertyType",
            "PrimarySurveillanceRadarPropertyType",
            "RadarEquipmentPropertyType",
            "RadarSystemPropertyType",
            "SecondarySurveillanceRadarPropertyType",
            "SurveillanceRadarPropertyType",
        ],
        "embedable": [
            "CodeBuoyDesignatorType",
            "CodeICAOCountryType",
            "CodeReferencePathIdentifierType",
            "CodeRouteIndicatorType",
            "CodeAerialRefuellingPointType",
            "CodeAerialRefuellingPrefixType",
            "CodeAerialRefuellingType",
            "CodeAircraftCategoryType",
            "CodeAircraftEngineNumberType",
            "CodeAircraftEngineType",
            "CodeAircraftGroundServiceType",
            "CodeAircraftICAOType",
            "CodeAircraftStandType",
            "CodeAircraftType",
            "CodeAircraftWingspanClassType",
            "CodeAirportHeliportCollocationType",
            "CodeAirportHeliportDesignatorType",
            "CodeAirportHeliportType",
            "CodeAirportWarningType",
            "CodeAirspaceActivityType",
            "CodeAirspaceAggregationType",
            "CodeAirspaceClassificationType",
            "CodeAirspaceDependencyType",
            "CodeAirspaceDesignatorType",
            "CodeAirspacePointPositionType",
            "CodeAirspacePointRoleType",
            "CodeAirspaceType",
            "CodeAltitudeAdjustmentType",
            "CodeAltitudeUseType",
            "CodeApproachEquipmentAdditionalType",
            "CodeApproachGuidanceType",
            "CodeApproachLightingICAOType",
            "CodeApproachLightingType",
            "CodeApproachPrefixType",
            "CodeApproachType",
            "CodeApprovalType",
            "CodeApronElementType",
            "CodeApronSectionType",
            "CodeArcDirectionType",
            "CodeArrestingGearEnergyAbsorbType",
            "CodeArrestingGearEngageDeviceType",
            "CodeATCReportingType",
            "CodeAuralMorseType",
            "CodeAuthorityRoleType",
            "CodeAuthorityType",
            "CodeAviationStandardsType",
            "CodeBearingType",
            "CodeBuoyType",
            "CodeCardinalDirectionType",
            "CodeCheckpointCategoryType",
            "CodeColourType",
            "CodeCommunicationChannelType",
            "CodeCommunicationDirectionType",
            "CodeCommunicationModeType",
            "CodeComparisonType",
            "CodeContaminationType",
            "CodeCourseQualityILSType",
            "CodeCourseType",
            "CodeDayType",
            "CodeDeclaredDistanceType",
            "CodeDesignatedPointDesignatorType",
            "CodeDesignatedPointType",
            "CodeDesignStandardType",
            "CodeDirectionReferenceType",
            "CodeDirectionTurnType",
            "CodeDirectionType",
            "CodeDistanceIndicationType",
            "CodeDMEChannelType",
            "CodeDMEType",
            "CodeEmissionBandType",
            "CodeEquipmentAntiCollisionType",
            "CodeEquipmentUnavailableType",
            "CodeFacilityRankingType",
            "CodeFinalGuidanceType",
            "CodeFireFightingType",
            "CodeFlightDestinationType",
            "CodeFlightOriginType",
            "CodeFlightPurposeType",
            "CodeFlightRestrictionDesignatorType",
            "CodeFlightRestrictionType",
            "CodeFlightRuleType",
            "CodeFlightStatusType",
            "CodeFlightType",
            "CodeFlowConditionOperationType",
            "CodeFreeFlightType",
            "CodeFrictionDeviceType",
            "CodeFrictionEstimateType",
            "CodeFuelType",
            "CodeGeoBorderType",
            "CodeGradeSeparationType",
            "CodeGroundLightingType",
            "CodeGuidanceLineType",
            "CodeHeightReferenceType",
            "CodeHelicopterPerformanceType",
            "CodeHoldingCategoryType",
            "CodeHoldingUsageType",
            "CodeHoldingUseType",
            "CodeIATAType",
            "CodeICAOType",
            "CodeILSBackCourseType",
            "CodeIntegrityLevelILSType",
            "CodeIntensityStandByType",
            "CodeLanguageType",
            "CodeLevelSeriesType",
            "CodeLevelTableDesignatorType",
            "CodeLevelType",
            "CodeLightHoldingPositionType",
            "CodeLightingJARType",
            "CodeLightIntensityType",
            "CodeLightSourceType",
            "CodeLoadingBridgeType",
            "CodeLocationQualifierType",
            "CodeLogicalOperatorType",
            "CodeMarkerBeaconSignalType",
            "CodeMarkingConditionType",
            "CodeMarkingStyleType",
            "CodeMeteoConditionsType",
            "CodeMilitaryOperationsType",
            "CodeMilitaryRoutePointType",
            "CodeMilitaryStatusType",
            "CodeMilitaryTrainingType",
            "CodeMinimaFinalApproachPathType",
            "CodeMinimumAltitudeType",
            "CodeMinimumHeightType",
            "CodeMissedApproachType",
            "CodeMLSAzimuthType",
            "CodeMLSChannelType",
            "CodeNavaidDesignatorType",
            "CodeNavaidPurposeType",
            "CodeNavaidServiceType",
            "CodeNavigationAreaRestrictionType",
            "CodeNavigationAreaType",
            "CodeNavigationEquipmentType",
            "CodeNavigationSpecificationType",
            "CodeNDBUsageType",
            "CodeNitrogenType",
            "CodeNorthReferenceType",
            "CodeNotePurposeType",
            "CodeObstacleAreaType",
            "CodeObstacleAssessmentSurfaceType",
            "CodeObstructionIdSurfaceZoneType",
            "CodeOilType",
            "CodeOperationAirportHeliportType",
            "CodeOperationManoeuvringAreaType",
            "CodeOrganisationDesignatorType",
            "CodeOrganisationHierarchyType",
            "CodeOrganisationType",
            "CodeOxygenType",
            "CodePARType",
            "CodePassengerServiceType",
            "CodePCNMethodType",
            "CodePCNPavementType",
            "CodePCNSubgradeType",
            "CodePCNTyrePressureType",
            "CodePilotControlledLightingType",
            "CodePositionInILSType",
            "CodePrimaryRadarType",
            "CodeProcedureAvailabilityType",
            "CodeProcedureCodingStandardType",
            "CodeProcedureDistanceType",
            "CodeProcedureFixRoleType",
            "CodeProcedurePhaseType",
            "CodeProtectAreaSectionType",
            "CodeRadarServiceType",
            "CodeRadioEmissionType",
            "CodeRadioFrequencyAreaType",
            "CodeRadioSignalType",
            "CodeReferenceRoleType",
            "CodeReflectorType",
            "CodeRelativePositionType",
            "CodeRNPType",
            "CodeRoadType",
            "CodeRouteAvailabilityType",
            "CodeRouteDesignatorLetterType",
            "CodeRouteDesignatorPrefixType",
            "CodeRouteDesignatorSuffixType",
            "CodeRouteNavigationType",
            "CodeRouteOriginType",
            "CodeRouteSegmentPathType",
            "CodeRouteType",
            "CodeRuleProcedureTitleType",
            "CodeRuleProcedureType",
            "CodeRunwayElementType",
            "CodeRunwayMarkingType",
            "CodeRunwayPointRoleType",
            "CodeRunwayProtectionAreaType",
            "CodeRunwaySectionType",
            "CodeRunwayType",
            "CodeRVRReadingType",
            "CodeRVSMPointRoleType",
            "CodeRVSMType",
            "CodeSafeAltitudeType",
            "CodeSegmentPathType",
            "CodeSegmentTerminationType",
            "CodeServiceATCType",
            "CodeServiceATFMType",
            "CodeServiceGroundControlType",
            "CodeServiceInformationType",
            "CodeServiceSARType",
            "CodeSideType",
            "CodeSignalPerformanceILSType",
            "CodeSpecialDateType",
            "CodeSpecialNavigationChainDesignatorType",
            "CodeSpecialNavigationStationType",
            "CodeSpecialNavigationSystemType",
            "CodeSpeedReferenceType",
            "CodeStandbyPowerType",
            "CodeStatusAirportType",
            "CodeStatusAirspaceType",
            "CodeStatusConstructionType",
            "CodeStatusNavaidType",
            "CodeStatusOperationsType",
            "CodeStatusServiceType",
            "CodeSurfaceCompositionType",
            "CodeSurfaceConditionType",
            "CodeSurfacePreparationType",
            "CodeSystemActivationType",
            "CodeTAAType",
            "CodeTACANChannelType",
            "CodeTaxiwayElementType",
            "CodeTaxiwaySectionType",
            "CodeTaxiwayType",
            "CodeTelecomNetworkType",
            "CodeTimeEventCombinationType",
            "CodeTimeEventType",
            "CodeTimeReferenceType",
            "CodeTLOFSectionType",
            "CodeTrajectoryType",
            "CodeTransponderType",
            "CodeUnitDependencyType",
            "CodeUnitType",
            "CodeUpperAlphaType",
            "CodeUsageLimitationType",
            "CodeUUIDType",
            "CodeValueInterpretationType",
            "CodeVASISType",
            "CodeVerticalDatumType",
            "CodeVerticalReferenceType",
            "CodeVerticalStructureMarkingType",
            "CodeVerticalStructureMaterialType",
            "CodeVerticalStructureType",
            "CodeVisualDockingGuidanceType",
            "CodeVORType",
            "CodeWakeTurbulenceType",
            "CodeWorkAreaType",
            "CodeYesNoType",
            "DateMonthDayType",
            "DateTimeType",
            "DateType",
            "DateYearType",
            "NoNumberType",
            "NoSequenceType",
            "TextAddressType",
            "TextDesignatorType",
            "TextInstructionType",
            "TextNameType",
            "TextNoteType",
            "TextPhoneType",
            "TextPropertyNameType",
            "TextRemarkType",
            "TextSIDSTARDesignatorType",
            "TimeType",
            "ValAlarmLimitType",
            "ValAngleType",
            "ValBearingType",
            "ValChannelNumberType",
            "ValDepthType",
            "ValDistanceSignedType",
            "ValDistanceType",
            "ValDistanceVerticalType",
            "ValDurationType",
            "ValFLType",
            "ValFrequencyType",
            "ValFrictionType",
            "ValHexType",
            "ValLCNType",
            "ValLightIntensityType",
            "ValMagneticVariationChangeType",
            "ValMagneticVariationType",
            "ValPCNType",
            "ValPercentType",
            "ValPressureType",
            "ValSlopeType",
            "ValSpeedType",
            "ValTemperatureType",
            "ValWeightType",
            "XHTMLType",
        ]
    }
    # , 
    # {
    #     "name": "AIXM_BasicMessage.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    #     "output_path": "util/AIXM_BasicMessage.xjb",
    #     "ignore" : [],
    #     "embedable" : []
    # }
    # ,
    # {
    #     "name": "AIXM_AbstractGML_ObjectTypes.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    #     "output_path": "util/AIXM_AbstractGML_ObjectTypes.xjb",
    #     "ignore" : [],
    #     "embedable" : []
    # }
    ]

PesitenceAnnotationsManager(task)

# EntityClass.pint_embedable()

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_BasicMessage.xsd","util/test2.xml")

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")

# PersistenceAnnotationMachinery("src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd","util/test3.xml")