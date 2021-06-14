from flask import Flask, url_for
from users import html_view


app = Flask(__name__, template_folder='templates')

app.add_url_rule('/login', 'login', html_view.login)
app.add_url_rule('/login', 'login', html_view.login, methods=['POST'])
app.add_url_rule('/profile/<int:id>', 'profile', html_view.profile)
app.add_url_rule('/patient', 'patient', html_view.patient_form)
app.add_url_rule('/patient', 'patient', html_view.patient_form, methods=['POST'])
app.add_url_rule('/employee', 'employee', html_view.employee_form)
app.add_url_rule('/employee', 'employee', html_view.employee_form, methods=['POST'])
app.add_url_rule('/test', 'test', html_view.employee_form)
app.add_url_rule('/test', 'test', html_view.employee_form, methods=['POST'])

if __name__ == '__main__':
    app.run()
