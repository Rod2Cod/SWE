from abc import ABC, abstractmethod
from src.domain import SetElementiDomanda

class AddSetElementiDomandaUseCase(ABC):
    @abstractmethod
    def addSetElementiDomanda(self, elementi: set[int]) -> bool:
        pass
    
class GetSetElementiDomandaUseCase(ABC):
    @abstractmethod
    def getSetElementiDomandaByNome(self, nome: str) -> SetElementiDomanda:
        pass
    
class GetAllSetElementiDomandaUseCase(ABC):
    @abstractmethod
    def getAllSetElementiDomanda(self) -> set[SetElementiDomanda]:
        pass
    
class DeleteSetElementiDomandaUseCase(ABC):
    @abstractmethod
    def deleteSetElementiDomandaByNome(self, nome: str) -> bool:
        pass
    
class EditNomeSetElementiDomandaUseCase(ABC):
    @abstractmethod
    def editNomeSetElementiDomanda(self, nome: str, newNome: str) -> bool:
        pass
    
class UpdateElementiDomandaSetUseCase(ABC):
    @abstractmethod
    def updateElementiDomandaSet(self, nome: str, elementi: set[int]) -> bool:
        pass