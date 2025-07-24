
from control import Control
from annotation import Annox, Jpa, Tag, Relation

class Validation: 

    @staticmethod
    def generate_constraints(element) : 
        res = {"type" : element.attrib["name"]}
        union = element.find(Tag.union)
        if union is not None:
            enum = []
            simple_types = union.findall(Tag.simple_type)
            for simple_type in simple_types:
                restriction = simple_type.find(Tag.restriction)
                pattern = restriction.find(Tag.pattern)
                enumerations = restriction.findall(Tag.enumeration)
                for enumeration in enumerations:
                    enum.append(enumeration.attrib["value"])
                
                if pattern is not None:
                    enum.append(pattern.attrib["value"])
            res["enum"] = enum
            return res

        restriction = element.find(Tag.restriction)
        if restriction is None:
            return res
    
        base = restriction.attrib["base"]
        fractionDigits = restriction.find(Tag.fractionDigits)
        length = restriction.find(Tag.length)
        maxExclusive = restriction.find(Tag.maxExclusive)
        minExclusive = restriction.find(Tag.minExclusive)
        maxInclusive = restriction.find(Tag.maxInclusive)
        minInclusive = restriction.find(Tag.minInclusive)
        maxLength = restriction.find(Tag.maxLength)
        minLength = restriction.find(Tag.minLength)
        pattern = restriction.find(Tag.pattern)
        totalDigits = restriction.find(Tag.totalDigits)
        whiteSpace = restriction.find(Tag.whiteSpace)

        if base is not None:
            if base == "string":
                res["column_definition"] = "TEXT"
            elif base == "integer":
                res["column_definition"] = "INTEGER"
            elif base == "decimal":
                res["column_definition"] = "DECIMAL" 
            elif base == "boolean":
                res["column_definition"] = "BOOLEAN"
            elif base == "date":
                res["column_definition"] = "DATE"
            elif base == "dateTime":
                res["column_definition"] = "TIMESTAMP"
            elif base == "time":
                res["column_definition"] = "TIME"

        # if fractionDigits is not None:
        #     pass

        # if length is not None:
        #     pass

        # if maxExclusive is not None:
        #     pass

        # if minExclusive is not None:
        #     pass
    
        # if maxInclusive is not None:
        #     pass

        # if minInclusive is not None:
            pass

        if length is not None:
            res["column_length"] = length.attrib["value"]

        # if maxLength is not None:
        #     res["column_length"] = maxLength.attrib["value"]

        # if minLength is not None or maxLength is not None:
        #     res["size"] = (Annox.field_add(Jpa.constraint.size(minLength.attrib["value"], maxLength.attrib["value"])))

        # if pattern is not None:
        #     res["pattern"] = (Annox.field_add(Jpa.constraint.pattern(pattern.attrib["value"], "this field must match")))

        # if totalDigits is not None:
        #     pass

        # if whiteSpace is not None:
        #     pass        
            
        Control.log_action(
            what="",
            success=True,
            why=res,
        )
        return res
    
    @staticmethod
    def generate_cardinality(parent, element, embed):
        res = []
        type = element.attrib.get("type", "").replace("aixm:", "")
        annotation = element.find("{http://www.w3.org/2001/XMLSchema}annotation/{http://www.w3.org/2001/XMLSchema}documentation")
        snowflake_text = annotation.text if annotation is not None and annotation.text else ""
        name = element.attrib.get("name","")
        ref = element.attrib.get("ref")
        nillable = element.attrib.get("nillable", "false").lower() == "true"
        minOccurs = int(element.attrib.get("minOccurs", "1"))
        maxOccurs = element.attrib.get("maxOccurs", "1")  # Default is 1
        constraints = embed.get(type)

        if maxOccurs.lower() == "unbounded":
            maxOccurs = "unbounded"
        else:
            maxOccurs = int(maxOccurs)

        # print(type in embed.keys())
        if snowflake_text != "":
            type = snowflake_text.replace("aixm:", "")

        # if element.attrib.get("name") in self.config.transient or element.attrib.get("ref") in self.config.transient or element.attrib.get("type") in self.config.transient:
        #     res.append(Annox.field_add(Jpa.transient))
        #     return res

        if maxOccurs == "unbounded":
            if type in embed.keys():
                res.append(Annox.field_add(Jpa.relation.collection_element()))
                res.append(Annox.field_add(Jpa.relation.collection_table(type)))

                temp = [Jpa.attribute_sub_override("href", Jpa.column_with_definition(name))]
                temp.append(Jpa.attribute_sub_override("nilReason", element.attrib["name"]))
                res.append(Annox.field_add(Jpa.attribute_main_override(temp)))
                return res 

            res.append(Annox.field_add(Jpa.relation.one_to_many()))
            # res.append(Annox.field_add(Relation.join_table(
            #     parent.attrib["name"], element.attrib["name"], parent.attrib["name"], element.attrib["type"])))
            res.append(Annox.field_add(Relation.join_table("master", "join", "source", "target")))
            join_column_name = element.attrib.get("name") if element.attrib.get("name") else element.attrib.get("ref")
            return res

        if maxOccurs == 1:
            if type in embed.keys():
                res.append(Annox.field_add(Jpa.embedded))
                temp = []
                for key, value in embed[type].items():
                    column_length = value.get("column_length") or 255
                    column_definition = value.get("column_definition")
                    if column_definition is not None:
                        temp.append(Jpa.attribute_sub_override(key, Jpa.column_with_definition(str(name + "_" + key), column_definition, column_length)))
                    else:
                        temp.append(Jpa.attribute_sub_override(key, Jpa.column(str(name + "_" + key), column_length)))

                # for attribute in embed[type].findall(".//"+ Tag.attribute) or []:
                #     temp.append(Jpa.attribute_sub_override(attribute.attrib["name"], element.attrib["name"]))
                
                #PropertyType with Ownership and Association
                # if temp == []:
                #     temp.append(Jpa.attribute_sub_override("href", element.attrib["name"]))
                #     temp.append(Jpa.attribute_sub_override("nilReason", element.attrib["name"]))

                # else: 
                #     temp.append(Jpa.attribute_sub_override("value", element.attrib["name"]))

                res.append(Annox.field_add(Jpa.attribute_main_override(temp)))

                return res
            elif type in ["AlphanumericType", "AlphaType"] :
                res.append(Annox.field_add(Jpa.column(element.attrib["name"])))
            
            else:
                res.append(Annox.field_add(Jpa.relation.one_to_one()))
                join_column_name = element.attrib.get("name") if element.attrib.get("name") else element.attrib.get("ref")
                res.append(Annox.field_add(Relation.join_column(join_column_name)))
                return res

        if nillable:
            pass

        return res