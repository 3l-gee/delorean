from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb, Xml


class GroupType: 
    @staticmethod
    def generate_simple_types(type, graph, transposition, config):
        res = []
        for element in type:
            result = GroupType.runner(element, graph, transposition, config)
            if result:
                res.extend(result)
        return res 
    
    @staticmethod
    def runner(type, graph, transposition, config) :
