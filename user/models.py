from core.core import Base

class User(Base):

    def __init__(self):
        pass


class Staff(User):

    def __init__(self):
        pass



class Doctor(User):
    shifts = {"start":0, "end": 0}
    field = ""


    def __init__(self):
        pass

    def analysis(self, result):
        if result:
            return 
