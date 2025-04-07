

class SingletonMeta(type):

    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            instance = super().__call__(*args, **kwargs)
            cls._instances[cls] = instance
        return cls._instances[cls]

class Debug(metaclass=SingletonMeta):
    def __init__(self, debug: dict):
        self.mode = debug.get("mode", False)
        self.entity = debug.get("entity", {})
        self.feature = debug.get("feature", {})

    @staticmethod
    def get_entity():
        return Debug().entity
    
    @staticmethod
    def get_feature():
        return Debug().feature
    
    @staticmethod
    def get_mdode(self):
        return Debug().mode