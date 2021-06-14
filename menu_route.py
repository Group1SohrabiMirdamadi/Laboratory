from lab.menu_views import *
from menu import generate_menu

menu_dic = {'name': 'Laboratory project',
            'description': 'A laboratory CLI program.',
            'children': [
                {
                    'name': 'New test',
                    'description': 'perform a new test',
                    'children': [
                        {
                            'name': 'Corona Test',
                            'description': 'perform corona test',
                            'function': corona_test_view,
                        },
                    ],
                },
                {
                    'name': 'List patients',
                    'description': 'show list of patients',
                    'function': list_patients_view,
                },
{
                    'name': 'List tests',
                    'description': 'show list of tests',
                    'function': list_tests_view,
                },
            ]
}

main_menu = generate_menu(menu_dic)
