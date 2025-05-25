from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb, Xml
from content import Content
from field_handler import FieldHandler


class GroupType: 
    @staticmethod
    def generate_groupe_types(type):
        res = []
        for element in type:
            result = GroupType.runner(element)
            if result:
                res.extend(result)
        return res 
    
    @staticmethod
    def runner(element) :
        node = []
        if element is None :
            print("element is None : ", element, type)
            return node

        if element.attrib["name"] in Content.get_ignore().keys():
            return node

        parent_xpath = Jaxb.group_xpath(element.attrib.get("name"))
        node.extend(FieldHandler.field_writer(element, parent_xpath))

        return node