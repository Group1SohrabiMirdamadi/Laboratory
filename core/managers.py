# Managers for connecting to models and save them.
# CRUD

# Import relevant libraries
from typing import Type
import psycopg2
from psycopg2._json import Json
from psycopg2._psycopg import connection, cursor
from core.models import BaseModel
from abc import abstractmethod, ABC


# Define Abstract class for managers (CRUD)
class BaseManagers(ABC):

    @abstractmethod
    def create(self, m: BaseModel) -> None:
        pass

    @abstractmethod
    def read(self, id: int) -> BaseModel:
        pass

    @abstractmethod
    def update(self, id: int, m: BaseModel) -> None:
        pass

    @abstractmethod
    def delete(self, id: int) -> None:
        pass


# Define class for database
class DatabaseManager(BaseManagers):
    # DB_CONFIG: dict = getattr(setting, 'DB_CONFIG')
    DB_CONFIG = {
        'database': 'test',
        'user': 'sasan.sp92',
        'password': '09125915669',
        'host': 'localhost',
    }

    def __init__(self, base_model: Type[BaseModel], tb_name=None):
        self.base_model = base_model
        self.tb_name = tb_name or base_model.__name__.lower()
        dsn = "".join(map(lambda i: f"i{0}='{i[1]}'", self.DB_CONFIG.items()))
        self.conn: connection = psycopg2.connect(user="sasan.sp92",
                                                 password="09125915669",
                                                 host="127.0.0.1",
                                                 port="5432",
                                                 database="postgres")

    def create(self, m: BaseModel):
        data: dict = m.to_dic()

        def value_normalize(v):
            if v is None:
                return 'NULL'

            if isinstance(v, dict):
                return str(Json(v))

            if isinstance(v, str):
                return f"'{v}'"

            return v

        print(data)
        keys = data.keys()
        values = map(value_normalize, data.values())
        curs: cursor = self.conn.cursor()

        if self.tb_name == 'patient':
            sql = f"INSERT INTO {self.tb_name} ({','.join(keys)}) VALUES ({','.join(values)}) RETURNING patient_id;"
        elif self.tb_name == 'employee':
            sql = f"INSERT INTO {self.tb_name} ({','.join(keys)}) VALUES ({','.join(values)}) RETURNING employee_id;"
        elif self.tb_name == 'test':
            sql = f"INSERT INTO {self.tb_name} ({','.join(keys)}) VALUES ({','.join(values)}) RETURNING test_id;"
        elif self.tb_name == 'result':
            sql = f"INSERT INTO {self.tb_name} ({','.join(keys)}) VALUES ({','.join(values)}) RETURNING result_id;"

        curs.execute(sql)
        id_of_new_row = int(curs.fetchone()[0])
        m._id = id_of_new_row
        self.conn.commit()
        return id_of_new_row

    def read(self, data, col: str) -> BaseModel:
        curs: cursor = self.conn.cursor()
        if col == 'id':
            curs.execute(f"SELECT * FROM {self.tb_name} WHERE id = {data}")
            return curs.fetchone()
        elif col == 'username':
            curs.execute(f"SELECT * FROM {self.tb_name} WHERE username = '{data}'")
            return curs.fetchone()

    def update(self, id: int, m: BaseModel) -> None:
        pass

    def delete(self, id: int) -> None:
        pass
