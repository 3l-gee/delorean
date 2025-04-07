
from control import Control


class SingletonMeta(type):

    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]

class View(metaclass=SingletonMeta):
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
        self.list = set()

    def _format_to_feature(self, schema):
        for key, value in schema.items():
            for item in value["list"]:
                self.feature_to_schema[item] = value["schema"]

    @classmethod
    def get_schema(name_ori):
        name = name_ori  # Start with the original name
        for key, value in View.suffix.items():
            name = name.replace(key, value)  # Apply each replacement

        if name not in View.feature_to_schema:
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
        View.list.add(str(View.feature_to_schema.get(name)+ "." + name))
        return View.feature_to_schema.get(name)
