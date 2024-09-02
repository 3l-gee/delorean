# this VERY unholy script will add persitance annotations to java classes given a config file that describes what annoatations should be added to what classes. 

from enum import Enum
import toml

# Core Annotations
class CoreAnnotations(Enum):
    ENTITY = '@Entity'
    TABLE = '@Table'
    ID = '@Id'
    COLUMN = '@Column'
    GENERATED_VALUE = '@GeneratedValue'
    SEQUENCE_GENERATOR = '@SequenceGenerator'
    TABLE_GENERATOR = '@TableGenerator'
    VERSION = '@Version'


# Relationship Annotations
class RelationshipAnnotations(Enum):
    ONE_TO_ONE = '@OneToOne'
    MANY_TO_ONE = '@ManyToOne'
    ONE_TO_MANY = '@OneToMany'
    MANY_TO_MANY = '@ManyToMany'
    JOIN_COLUMN = '@JoinColumn'
    JOIN_TABLE = '@JoinTable'
    MAPPED_BY = '@MappedBy'

# Additional Annotations
class AdditionalAnnotations(Enum):
    INHERITANCE = '@Inheritance'
    DISCRIMINATOR_COLUMN = '@DiscriminatorColumn'
    DISCRIMINATOR_VALUE = '@DiscriminatorValue'
    EMBEDDABLE = '@Embeddable'
    EMBEDDED = '@Embedded'
    ELEMENT_COLLECTION = '@ElementCollection'
    TRANSIENT = '@Transient'
    LOB = '@Lob'
    BASIC = '@Basic'
    ENUMERATED = '@Enumerated'
    TEMPORAL = '@Temporal'
    CACHEABLE = '@Cacheable'
    FETCH = '@Fetch'

# Spatial Annotations
class SpatialAnnotations(Enum):
    TYPE = '@Type'
    SPATIAL = '@Spatial'
    SPATIAL_TYPE = '@SpatialType'
    GEOMETRY = '@Geometry'
    GEOMETRY_TYPE = '@GeometryType'
    POINT = '@Point'
    LINE_STRING = '@LineString'
    POLYGON = '@Polygon'
    MULTI_POINT = '@MultiPoint'
    MULTI_LINE_STRING = '@MultiLineString'
    MULTI_POLYGON = '@MultiPolygon'


class PersitanceAnnotationMachinery:
    def __init__(self, config):
        self.config = config
        self.classes = None
        self.

    def load_config(self):
        with open(self.config, 'r') as f:
            self.classes = toml.load(f)
            class_annotations = self.classes[class_name]
    
    def load_clases(self):
        for class_name in self.classes:
            class_annotations

    def add_annotations(self):
        for class_name in self.classes:
            class_annotations