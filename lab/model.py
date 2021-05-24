from typing import Literal,Type
from .covid import Covid
from .sugarblood import SugarBlood

class Lab:

    def __init__(self, test:Type[Covid, SugarBlood]):
        self.test = test


    def getSample(self, pressure, heartrate, bloodtest):
        if pressure and heartrate:
            res = self.test(pressure, heartrate)
            return  res
        elif pressure and bloodtest:
            res = self.test(pressure, bloodtest)
            return res

        return None

    def analysis(self, Doctor):
        return Doctor.inscript

