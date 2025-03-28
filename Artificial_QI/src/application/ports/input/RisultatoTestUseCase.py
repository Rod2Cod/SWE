from abc import ABC, abstractmethod
from src.domain import RisultatoTest, RisultatoSingolaDomanda
    
class GetRisultatoTestUseCase(ABC):
    @abstractmethod
    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        pass
    
class GetAllRisultatiTestUseCase(ABC):
    @abstractmethod
    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        pass
    
class GetRisultatoSingolaDomandaUseCase(ABC):
    @abstractmethod
    def getRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomanda:
        pass