from datetime import datetime, timedelta
from typing import Literal

from core.models import BaseModel
from users.models import Patient
from lab.exceptions import ResultNotReadyError


class BaseTest(BaseModel):
    patient: Patient
    create_timestamp: datetime
    estimate_timestamp: datetime

    def __init__(self, patient) -> None:
        self.patient = patient
        self.create_timestamp = datetime.now()
        self.estimate_timestamp = datetime.now() + timedelta(days=3)

    def set_result(self, result):
        self.create_timestamp = datetime.now()
        self.__result = result

    def __str__(self):
        return f"""
{self.__class__.__name__}:
patient:  {self.patient}
create_timestamp: {self.create_timestamp}
estimate_timestamp: {self.estimate_timestamp}
        """


class CoronaTest(BaseTest):

    def has_corona(self):
        if not hasattr(self, '__result'):
            raise ResultNotReadyError()
        return bool(self.__result)
