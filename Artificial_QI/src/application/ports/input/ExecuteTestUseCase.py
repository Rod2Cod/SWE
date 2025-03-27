from abc import ABC, abstractmethod
from src.domain import RisultatoTest

class ExecuteTestUseCase(ABC):
    @abstractmethod
    def executeTest(self) -> RisultatoTest:
        pass
    
class ExecuteTestOnSetUseCase(ABC):
    @abstractmethod
    def executeTestOnSet(self, nome: str) -> RisultatoTest:
        pass