import xml.etree.ElementTree as ET
from enum import Enum

class SchemaStructure(Enum):
    XS_NAMESPACE = "{http://www.w3.org/2001/XMLSchema}"
    SHEMA = XS_NAMESPACE + "schema"
    INCLUEE = XS_NAMESPACE + "include"
    IMPORT = XS_NAMESPACE + "import"
    REDEFINE = XS_NAMESPACE + "redefine"
    ANNOTATIONS = XS_NAMESPACE + "annotation"
    DOCUMENTATION = XS_NAMESPACE + "documentation"

class  ElementDeclaration(Enum):
    ELEMENT = SchemaStructure.XS_NAMESPACE.value + "element"
    COMPLEX_TYPE = SchemaStructure.XS_NAMESPACE.value + "complexType"
    SIMPLE_TYPE = SchemaStructure.XS_NAMESPACE.value + "simpleType"
    SEQUENCE = SchemaStructure.XS_NAMESPACE.value + "sequence"
    CHOICE = SchemaStructure.XS_NAMESPACE.value + "choice"
    ALL = SchemaStructure.XS_NAMESPACE.value + "all"
    ANY = SchemaStructure.XS_NAMESPACE.value + "any"

class AttributeDeclaration(Enum):
    ATTRIBUTE = SchemaStructure.XS_NAMESPACE.value + "attribute"
    ATTRIBUTE_GROUP = SchemaStructure.XS_NAMESPACE.value + "attributeGroup"
    ANY_ATTRIBUTE = SchemaStructure.XS_NAMESPACE.value + "anyAttribute"

class AnnotationsStrategy:
    def __init__(self, paths):
        self.paths = paths
        self.roots = self.load()
        self.data = {}

    def load(self):
        roots = []
        for path in self.paths:
            tree = ET.parse(path)
            root = tree.getroot()
            roots.append(root)
        return roots

    def search(self, tag):
        for root in self.roots:
            for chid in root.iter(tag):
                print(chid.tag, chid.attrib)

# Example usage
paths = [
    "src/main/resources/a5_1_1/AIXM_AbstractGML_ObjectTypes.xsd",
    "src/main/resources/a5_1_1/AIXM_BasicMessage.xsd",
    "src/main/resources/a5_1_1/AIXM_Features.xsd",
]
strategy = AnnotationsStrategy(paths)
interactions = strategy.search(ElementDeclaration.COMPLEX_TYPE.value)