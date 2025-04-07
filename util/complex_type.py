from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb, Xml
from view import View


class ComplexType: 
    @staticmethod
    def generate_complex_types(type, embed, abstract, config, debug):
        res = []
        for element in type:
            result = ComplexType.runner(element, embed, abstract, config, debug)
            if result:
                res.extend(result)
        return res 
    
    @staticmethod
    def runner(element, embed, abstract, config, debug) :
        node = []
        if element is None :    
            Control.log_action(
                what="element is None",
                success=False,
                why=str(element),
            )
            return node

        if element.attrib["name"] in config.ignore:
            return node

        # schema = View.get_schema(element.attrib.get("name"))

        # node.append(Jaxb.complex(element.attrib["name"]))
        # node.extend(self.class_writer(element, embed, abstract, schema))
        # node.append(Jaxb.end)

        # parent_xpath = Jaxb.complex_xpath(element.attrib.get("name"))
        # node.extend(self.field_writer(element, embed, parent_xpath))
            
        return node