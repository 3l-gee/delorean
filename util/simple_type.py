from validation import Validation
from control import Control
from content import Content
from annotation import Annox, Jpa, Tag, Jaxb, Xml


class SimpleType: 
    @staticmethod
    def generate_simple_types(type, graph, transposition):
        res = []
        for element in type:
            result = SimpleType.runner(element, graph, transposition)
            if result:
                res.extend(result)
        return res 

    @staticmethod
    def runner(element, graph, transposition) :
        node = []

        if element is None :    
            Control.log_action(
                what="element is None",
                success=False,
                why=str(element),
            )
            return node
        
        element_name = element.attrib["name"]
        element_restriction = element.find(".//" + Tag.restriction).attrib
        element_base = element_restriction.get("base")
        
        if element_name in graph["attribute"].keys() :
            return node
        
        if element_name in graph["inheritance"].keys() :
            return node
        
        if element_name in Content.get_ignore():
            return node
            
        if element.attrib.get("name") in Content.get_transient() or element.attrib.get("ref") in Content.get_transient() :
            node.append(Jaxb.simple(element.attrib["name"]))
            node.append(Annox.field_add(Jpa.transient))
            node.append(Jaxb.end)
            return node
            
        if element.attrib.get("type") in Content.get_transient():
            node.append(Jaxb.simple(element.attrib["name"]))
            node.append(Annox.field_add(Jpa.transient))
            node.append(Jaxb.end)
            return node
        
        # else:
            # constraints = {**transposition.get(element.attrib["name"], {}), **Validation.generate_constraints(element)}
            # if self.config.constraint_methode == "xjb":
            #     size = constraints.get("size")
            #     pattern = constraints.get("pattern")

            #     if size is not None:
            #         node.append(size)
            #     if pattern is not None:
            #         node.append(pattern)

    
        # if element_base == "date":
        #     node.append(Jaxb.simple(element.attrib["name"]))
        #     node.append(Jaxb.java_type("java.sql.Timestamp"))
        #     node.append(Annox.field_add(Xml.adapter("com.aixm.delorean.core.adapter.date.XMLGregorianCalendarAdapter.class")))
        #     node.append(Jaxb.end)
        #     return node
        
        # # TODO 
        # if element_base == "dateTime":
        #     node.append(Jaxb.simple(element.attrib["name"]))
        #     node.append(Annox.field_add(Jpa.transient))
        #     node.append(Jaxb.end)
        #     return node



