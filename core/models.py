from abc import ABC, abstractmethod


class BaseModel(ABC):
    _id: int


    def __repr__(self):
        return f"<{self.__class__.__name__} #{self._id}"


    @classmethod
    @abstractmethod
    def managers(cls):
        pass

    def to_dict(self):
        pass

    def to_dic(self):
        pass

