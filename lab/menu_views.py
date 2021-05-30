from time import sleep

from core.utility import get_input
# from core import validators as _v
from lab.models import CoronaTest
from users.models import Patient

PATIENTS = []
TESTS = []


def corona_test_view():
    print("Please Enter your profile:")
    first_name = get_input('Firstname')
    last_name = get_input('Lastname')
    phone = get_input('Phone')
    email = get_input('Email(Optional)')
    result = get_input('Result of Tests', type=bool)
    patient = Patient(first_name, last_name, phone, email)
    PATIENTS.append(patient)

    print('Profile saved!')


    ct = CoronaTest(patient)
    ct.set_result(result)

    print('Perform testing...')
    # sleep(3)
    print("Done!")

    TESTS.append(ct)
    print(ct)
    print("Estimated timestamp", ct.estimate_timestamp)



def list_patients_view():

    for p in PATIENTS:
        print(p)


def list_tests_view():
    for t in TESTS:
        print(t)
