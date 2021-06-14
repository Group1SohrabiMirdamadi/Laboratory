from flask import request, render_template, redirect, url_for

from users.models import User, Patient, Employee
from lab.model import BaseTest


def login():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        login_data = request.form
        # print(login_data)
        username = login_data['username']
        password = login_data['pwd']
        patient_data = Patient.managers().read(username, 'username')
        # print(patient_data)
        try:
            assert Patient.managers().read(username, 'username'), 'Username is not exist!!!'
            patient_data = Patient.managers().read(username, 'username')
            assert patient_data[5] == username, 'Username is not correct!'
            assert patient_data[7] == password, 'Password is not correct!'
            return redirect(url_for('patient'))
        except Exception as e:
            print(e)
            return render_template('login.html')


def profile(id):
    user = User.managers().read(id, 'id')
    return render_template('profile.html', user=user)


def patient_form():
    if request.method == 'GET':
        return render_template('patient.html')
    else:
        patient_data = request.form
        user = Patient(first_name=patient_data['fname'],
                       last_name=patient_data['lname'],
                       national_code=patient_data['ncode'],
                       birth_day=patient_data['bdate'],
                       phone=patient_data['phone'],
                       email=patient_data['email'],
                       password=patient_data['password']
                       )
        Patient.managers().create(user)
        # return redirect(url_for('profile', id=user._id))
        return 'OK!!!!'


def employee_form():
    if request.method == 'GET':
        return render_template('employee.html')
    else:
        employee_data = request.form
        user = Employee(first_name=employee_data['fname'],
                        last_name=employee_data['lname'],
                        national_code=employee_data['ncode'],
                        birth_day=employee_data['bdate'],
                        phone=employee_data['phone'],
                        email=employee_data['email'],
                        password=employee_data['password'],
                        job_title=employee_data['jobtitle']
                        )
        Employee.managers().create(user)
        # return redirect(url_for('profile', id=user._id))
        return 'OK!!!!'


def test_form():
    if request.method == 'GET':
        return render_template('test.html')
    else:
        test_data = request.form
        test = BaseTest(test_name=test_data['test_name'],
                        test_from_date=test_data['from_date_test'],
                        test_to_date=test_data['to_date_test'],
                        test_price=test_data['test_price'],
                        reference_value=test_data['reference_value']
                        )
        BaseTest.managers().create(test)
        # return redirect(url_for('profile', id=user._id))
        return 'OK!!!!'


def register_employee_view():
    pass


def register_admin_view():
    pass
