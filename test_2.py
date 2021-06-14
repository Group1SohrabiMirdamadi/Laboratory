from psycopg2 import connect
from users.models import User

connection = connect("")
u1 = User("sasan", 'sohrabi', '09195145937', '638713687')
User.managers().create()
