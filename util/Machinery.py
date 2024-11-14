from enum import Enum
import xml.etree.ElementTree as ET
import re
import Annotation


    #     "name": "AIXM_DataTypes.xsd",
    #     "input_path": "src/main/resources/a5_1_1/AIXM_DataTypes.xsd",
    #     "output_path": "util/AIXM_DataTypes.xjb",
    #     "ignore": [
    #         "CodeDistanceVerticalUomType",
    #         "PointPropertyType",
    #         "ElevatedPointPropertyType",
    #         "CurvePropertyType",
    #         "ElevatedCurvePropertyType",
    #         "SurfacePropertyType",
    #         "ElevatedSurfacePropertyType",
    #     ],
    #     "embedable": [

class Xsd: 
    def __init__(self, name, path):
        self.name = name
        self.path = path
        self.root = ET.parse(path).getroot()
        self.namespaces = self.get_namespaces()
        self.elements = self.root.findall(".//{http://www.w3.org/2001/XMLSchema}element", self.namespaces)
        self.attributes = self.root.findall(".//{http://www.w3.org/2001/XMLSchema}attribute", self.namespaces)
        self.extension = self.root.findall(".//{http://www.w3.org/2001/XMLSchema}extension", self.namespaces)
        self.simple_type = self.root.findall(".//{http://www.w3.org/2001/XMLSchema}simpleType", self.namespaces)
        self.coomplex_type = self.root.findall(".//{http://www.w3.org/2001/XMLSchema}complexType", self.namespaces)

    def get_elements(self):
        return self.elements
    
    def get_elements_info(self):
        for element in self.elements:
            print(element.attrib)
    
    def get_extension(self):
        return self.extension
    
    def get_simple_type(self):
        return self.simple_type
    
    def get_complex_type(self):
        return self.complex_type
    
    def get_namespaces(self):
        namespaces = dict([
            node for _, node in ET.iterparse(self.path, events=['start-ns'])
        ])
        return namespaces

test = Xsd("AIXM_DataTypes.xsd", "src/main/resources/a5_1_1/AIXM_DataTypes.xsd")
print(test.get_elements_info())

# test = Xsd("AIXM_DataTypes.xsd", "src/main/resources/school/school.xsd")
# print(test.get_elements_info())

test = Xsd("AIXM_DataTypes.xsd", "src/main/resources/a5_1_1/AIXM_Features.xsd")
print(test.get_elements_info())
# # class Machinery: 
