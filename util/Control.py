from typing import List
import datetime
import inspect


class Action:
    def __init__(self, stack: str, what: str, success: bool, why: str):
        self.who = stack[1].function
        self.what = what
        self.success = success
        self.when = datetime.datetime.now()
        self.why = why
        self.stack = stack
    
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


class Control(metaclass=SingletonMeta):
    def __init__(self):
        self.action = []

    @classmethod
    def log_action(cls, what: str, success: bool, why: str):
        caller = inspect.stack()
        instance = Control()
        action = Action(stack=caller, what=what, success=success, why=why)
        instance.action.append(action)
    
    @classmethod
    def print_actions(cls, only_un_successful: bool = False):
        instance = Control()
        for action in instance.action:
            if only_un_successful and not action.success:
                print(f"Action logged by {action.who} at {action.when}: {action.what} / {action.why}")
            elif not only_un_successful:
                print(f"Action logged by {action.who} at {action.when}: {action.what} / {action.why}")
            else:
                continue
