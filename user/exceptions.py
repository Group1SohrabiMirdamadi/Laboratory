class Exception(Exception):
    pass


class ModelNotFoundError(Exception):

    def __init__(self, *args: object) -> None:
        super().__init__('Model NOT Found', *args)


class InputError(Exception):

    def __init__(self, *args: object) -> None:
        super().__init__("InvalidInput:", *args)
