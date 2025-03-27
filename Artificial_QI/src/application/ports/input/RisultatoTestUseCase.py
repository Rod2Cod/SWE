from abc import ABC, abstractmethod
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from src.domain.dtos import RisultatoTestDTO

class AddRisultatoTestUseCase(ABC):
    @abstractmethod
    def addRisultatoTest(self, risultatoTestDTO: RisultatoTestDTO) -> bool:
        pass
    
class GetRisultatoTestUseCase(ABC):
    @abstractmethod
    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        pass
    
class GetAllRisultatiTestUseCase(ABC):
    @abstractmethod
    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        pass
    
class GetAllRisultatiSingoleDomandeUseCase(ABC):
    @abstractmethod
    def getAllRisultatiSingoleDomandeByTestId(self, id: int) -> set[RisultatoSingolaDomanda]:
        pass
    
class GetRisultatoSingolaDomandaUseCase(ABC):
    @abstractmethod
    def getRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomanda:
        pass