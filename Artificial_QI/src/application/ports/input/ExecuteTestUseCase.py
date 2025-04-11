from abc import ABC, abstractmethod
from src.domain import RisultatoTest

class ExecuteTestUseCase(ABC):
    @abstractmethod
    def executeTest(self) -> None:
        pass
    
class GetTestStatusUseCase(ABC):
    @abstractmethod
    def getTestStatus(self) -> dict:
        pass