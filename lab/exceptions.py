from core.exception import Exception


class ResultNotReadyError(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__("Result is not Ready yet!", *args)