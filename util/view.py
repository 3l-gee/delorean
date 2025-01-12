
from control import Control

class View:
    def __init__(self, schema):
        self.schema = schema
        self.feature_to_schema = {}
        self._format_to_feature(schema)
        self.suffix = {
            "TimeSlicePropertyType": "",
            "PropertyGroup": "",
            "PropertyType": "",
            "TimeSliceType": "",
            "TimeSlice": "",
            "Type": "", 
        }

    def _format_to_feature(self, schema):
        for key, value in schema.items():
            for item in value["list"]:
                self.feature_to_schema[item] = value["schema"]

    def get_schema(self, name_ori):
        name = name_ori  # Start with the original name
        for key, value in self.suffix.items():
            name = name.replace(key, value)  # Apply each replacement

        if name not in self.feature_to_schema:
            Control.log_action(
                what="tried to get schema",
                success=False,
                why=str(name_ori + " / " + name + " not found"),
            )
            return "public"        
        
        Control.log_action(
            what="",
            success=True,
            why="self.feature_to_schema.get(name)",
        )     
        return self.feature_to_schema.get(name)
