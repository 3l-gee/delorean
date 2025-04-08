
from control import Control


class SingletonMeta(type):

    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]
    
    def reset_instance(cls):
        if cls in cls._instances:
            del cls._instances[cls]

class View(metaclass=SingletonMeta):
    def __init__(self, schema):
        self.schema = schema
        self.feature_to_schema = {}
        self.suffix = {
            "TimeSlicePropertyType": "",
            "PropertyGroup": "",
            "PropertyType": "",
            "TimeSliceType": "",
            "TimeSlice": "",
            "Type": "", 
        }
        self.list = set()
        for key, value in schema.items():
            for item in value["list"]:
                self.feature_to_schema[item] = value["schema"]


    @staticmethod
    def get_schema(name_ori):
        instance = View() 
        name = name_ori
        for key, value in instance.suffix.items():
            name = name.replace(key, value)

        if name not in instance.feature_to_schema:
            Control.log_action(
                what="tried to get schema",
                success=False,
                why=f"{name_ori} / {name} not found",
            )
            return "public"

        Control.log_action(
            what="",
            success=True,
            why="schema found: " + name,
        )
        instance.list.add(f"{instance.feature_to_schema[name]}.{name}")
        return instance.feature_to_schema[name]

