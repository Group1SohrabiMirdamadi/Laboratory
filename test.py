from users.models import *
from core.managers import DatabaseManager

user_manager = DatabaseManager(User)
u1 = User('Sasan', 'Sohrabi', '09195145937', '123456')
user_manager.create(u1)
# user_manager.create(u1)
# print(User.managers().create(u1))
User.manager().create(u1)

# d1 = Doctor('Sasan', 'Sohrabi', '09195145937', '123456')
# Doctor.manager().create(d1)
