from abc import ABC, abstractmethod

class LLMPort(ABC):

    @abstractmethod
    def makeQuestion(self, domanda: str) -> str:
        pass

    @abstractmethod
    def getName(self) -> str:
        pass
