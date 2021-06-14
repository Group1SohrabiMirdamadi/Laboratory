from core.exception import InputError


def get_input(promt="", type=str, retry=True):
    try:
        return type(input(promt + ""))
    except Exception as e:
        e = InputError(*e.args)
        print(e)
        if retry:
            get_input(promt, type, retry)
        else:
            raise e
