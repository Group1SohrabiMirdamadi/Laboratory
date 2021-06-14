# Import relevant libraries
from datetime import datetime
from typing import Literal
from typing import Optional
from users.managers import UserManager, DatabaseManager
# from core.managers import DatabaseManager
from core.models import BaseModel


class BaseTest(BaseModel):

    test_name: str
    test_from_date: datetime
    test_to_date: datetime
    test_price: float
    reference_value: str

    def __init__(self, test_name, test_from_date, test_to_date, test_price, reference_value):
        self.test_name = test_name
        self.test_from_date = test_from_date
        self.test_to_date = test_to_date
        self.test_price = test_price
        self.reference_value = reference_value

    def __repr__(self):
        return f"<{self.__class__.__name__}"

    @classmethod
    def managers(cls):
        return DatabaseManager(cls, tb_name="test")

    def to_dic(self):
        # del res['username']
        # res['first_name'] = res['first_name'].upper()
        return vars(self)


# class Patient(User):
#
#     def __init__(self, first_name, last_name, phone, password, national_code, birth_day, **extra_info):
#         super().__init__(first_name, last_name, phone, password, **extra_info)
#         self.national_code = national_code
#         self.birth_day = birth_day
#
#     @classmethod
#     def managers(cls):
#         return DatabaseManager(cls, tb_name="patient")
#
#     def to_dic(self):
#         # del res['username']
#         # res['first_name'] = res['first_name'].upper()
#         return vars(self)
#
#
# class Employee(User):
#
#     def __init__(self, first_name, last_name, phone, password, national_code, job_title, birth_day, **extra_info):
#         super().__init__(first_name, last_name, phone, password, **extra_info)
#         self.national_code = national_code
#         self.birth_day = birth_day
#         self.job_title = job_title
#
#     @classmethod
#     def managers(cls):
#         return DatabaseManager(cls, tb_name="employee")
#
#     def to_dic(self):
#         # del res['username']
#         # res['first_name'] = res['first_name'].upper()
#         return vars(self)
#
#
# class Admin(User):
#     pass
#
#
# class Operator(User):
#     pass
#
#
# class Doctor(User):
#     pass
