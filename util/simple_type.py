from validation import Validation
from control import Control
from annotation import Annox, Jpa, Tag, Jaxb


class Simple_type_machinery: 

    def __init__(self, config, debug, view):
        self.config = config
        self.debug = debug
        self.view = view

    @staticmethod
    def generate_simple_types(type, graph, transposition):
        res = []
        for element in type:
            res.extend(Simple_type_machinery.runner(element, graph, transposition))


    def runner(self, element, graph, transposition) :
        node = []
        if element is None :
            Control.log_action(
                what="element is None",
                success=False,
                why=str(element),
            )
            return []
        
        if element.attrib["name"] in graph["attribute"].keys() or element.attrib["name"] in graph["inheritance"].keys() or element.attrib["name"] in self.config.ignore:
            return []
    
        node.append(Jaxb.simple(element.attrib["name"]))
        enum_values = element.findall(Tag.enumeration) or []
        base = element.find(".//" + Tag.restriction).attrib
        
        if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
            node.append(Annox.field_add(Jpa.transient))
            node.append(Jaxb.end)
        
        elif enum_values:
            node.append(Jaxb.enum_start(element.attrib["name"]))
            node.extend([Jaxb.enum_member(enum.attrib["value"], enum.attrib["value"]) for enum in enum_values])
            node.append(Jaxb.enum_end)
            node.append(Jaxb.end)

        else:
            constraints = {**transposition.get(element.attrib["name"], {}), **Validation.generate_constraints(element)}
            if self.config.constraint_methode == "xjb":
                size = constraints.get("size")
                pattern = constraints.get("pattern")

                if size is not None:
                    node.append(size)
                if pattern is not None:
                    node.append(pattern)

            if base is not None and base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean", "date", "dateTime"]:
                if base.get("base") in ["token", "string", "integer", "unsignedInt", "decimal", "double", "float", "boolean"] :
                    # node.append(Annox.field_add(Jpa.column(element.attrib["name"], constraints.get("column_length"))))
                    node.append(Jaxb.end)

                elif base.get("base") == "date":
                    node.append(Jaxb.java_type("java.sql.Timestamp"))
                    # node.append(Annox.field_add(Jpa.column(element.attrib["name"], constraints.get("column_length"))))
                    node.append(Annox.field_add(Xml.adapter("com.aixm.delorean.core.adapter.date.XMLGregorianCalendarAdapter.class")))
                    node.append(Jaxb.end)
                
                elif base.get("base") == "dateTime":
                    node.append(Annox.field_add(Jpa.transient))
                    node.append(Jaxb.end)

            elif base is not None and "aixm" in base.get("base",None) :
                node = []
                # node.append(Annox.field_add(Jpa.column("value", constraints.get("column_length"))))
                # node.append(Jaxb.end)
                
            else:
                print(element.attrib, base)


