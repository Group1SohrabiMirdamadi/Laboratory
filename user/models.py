# Import relevant libraries
from typing import Literal
from typing import Optional
from users.managers import UserManager, DatabaseManager
# from core.managers import DatabaseManager
from core.models import BaseModel


class User(BaseModel):
    USERNAME_FIELD = 'phone'

    first_name: str
    last_name: str
    phone: Optional[str]
    email: str
    password: str
    extra_info: dict

    def __init__(self, first_name, last_name, phone, password, email=None, **extra_info):
        self.first_name = first_name
        self.last_name = last_name
        self.phone = phone
        self.password = password
        self.email = email
        self.extra_info = extra_info
        self.username = getattr(self, self.USERNAME_FIELD)

    def __repr__(self):
        return f"<{self.__class__.__name__}"

    def __str__(self):
        return \
            f""""{self.__class__.__name__}
\tfirst_name: {getattr(self, '_id', None)}
\tfirst_name: {self.first_name}
\tlast_name: {self.last_name}
\tphone: {self.phone}
\temail: {self.email}
\tpassword: {self.password}
\textra_info: {self.extra_info}
""".strip()

    @classmethod
    def managers(cls):
        return DatabaseManager(cls, tb_name="test")

    def to_dic(self):
        # del res['username']
        # res['first_name'] = res['first_name'].upper()
        return vars(self)


class Patient(User):

    def __init__(self, first_name, last_name, phone, password, national_code, birth_day, **extra_info):
        super().__init__(first_name, last_name, phone, password, **extra_info)
        self.national_code = national_code
        self.birth_day = birth_day

    @classmethod
    def managers(cls):
        return DatabaseManager(cls, tb_name="patient")

    def to_dic(self):
        # del res['username']
        # res['first_name'] = res['first_name'].upper()
        return vars(self)


class Employee(User):

    def __init__(self, first_name, last_name, phone, password, national_code, job_title, birth_day, **extra_info):
        super().__init__(first_name, last_name, phone, password, **extra_info)
        self.national_code = national_code
        self.birth_day = birth_day
        self.job_title = job_title

    @classmethod
    def managers(cls):
        return DatabaseManager(cls, tb_name="employee")

    def to_dic(self):
        # del res['username']
        # res['first_name'] = res['first_name'].upper()
        return vars(self)


class Admin(User):
    pass


class Operator(User):
    pass


class Doctor(User):
    pass
