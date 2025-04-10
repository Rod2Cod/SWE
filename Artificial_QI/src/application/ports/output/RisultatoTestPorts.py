from abc import ABC, abstractmethod
from src.domain import RisultatoTest, RisultatoSingolaDomanda

class SaveRisultatoTestPort(ABC):

    @abstractmethod
    def saveRisultatoTest(self, risultato: RisultatoTest) -> RisultatoTest:
        pass
    
class GetRisultatoTestPort(ABC):

    @abstractmethod
    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        pass
    
class GetAllRisultatiTestPort(ABC):

    @abstractmethod
    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        pass
    
class GetRisultatoSingolaDomandaPort(ABC):

    @abstractmethod
    def getRisultatoSingolaDomandaTestById(id: int) -> RisultatoSingolaDomanda:
        pass