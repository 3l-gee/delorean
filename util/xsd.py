from annotation import Tag, Strategy
import xml.etree.ElementTree as ET


class Xsd: 
    def __init__(self, name:str, path:str, strategie: Strategy, manual: dict, package: str = None):
        self.name = name
        self.package = package
        self.path = path
        self.strategy = strategie
        self.manual = manual
        self.root = ET.parse(path).getroot()
        self.namespaces = self.get_namespaces()
        self.elements = self.root.findall(Tag.element, self.namespaces) or []
        self.groups = self.root.findall(Tag.group, self.namespaces) or []
        self.attributes = self.root.findall(Tag.attribute, self.namespaces) or []
        self.extension = self.root.findall(Tag.extension, self.namespaces) or []
        self.simple_type = self.root.findall(Tag.simple_type, self.namespaces) or []
        self.complex_type = self.root.findall(Tag.complex_type, self.namespaces) or []

    def get_elements(self):
        return self.elements
    
    def get_elements_info(self):
        for element in self.elements:
            print(element.attrib)

    def get_groups(self):
        return self.groups
    
    def get_groups_info(self):
        for group in self.groups:
            print(group.attrib)
    
    def get_attributes(self):
        return self.attributes

    def get_attributes_info(self):
        for attribute in self.attributes:
            print(attribute.attrib)

    def get_extension(self):
        return self.extension

    def get_extension_info(self):
        for extension in self.extension:
            print(extension.attrib)
    
    def get_simple_type(self):
        return self.simple_type
    
    def get_simple_type_info(self):
        for simple_type in self.simple_type:
            print(simple_type.attrib)
    
    def get_complex_type(self):
        return self.complex_type

    def get_complex_type_info(self):
        for complex_type in self.complex_type:
            print(complex_type.attrib)  
    
    def get_namespaces(self):
        namespaces = dict([
            node for _, node in ET.iterparse(self.path, events=['start-ns'])
        ])
        return namespaces