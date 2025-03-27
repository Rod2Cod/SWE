from abc import ABC, abstractmethod
from src.domain import SetElementiDomanda

class SaveSetElementiDomandaPort(ABC):

    @abstractmethod
    def SaveSetElementiDomandaPort(self, setElementi: SetElementiDomanda) -> bool:
        pass
    
class GetSetElementiDomandaPort(ABC):

    @abstractmethod
    def getSetElementiDomandaByNome(self, nome: str) -> SetElementiDomanda:
        pass
    
class GetAllSetElementiDomandaPort(ABC):

    @abstractmethod
    def getAllSetElementiDomanda(self) -> set[SetElementiDomanda]:
        pass
    
class DeleteSetElementiDomandaPort(ABC):

    @abstractmethod
    def deleteSetElementiDomandaByNome(self, nome: str) -> SetElementiDomanda:
        pass
    
class EditNomeSetElementiDomandaPort(ABC):

    @abstractmethod
    def editNomeSetElementiDomanda(self, nome: str, newNome: str) -> SetElementiDomanda:
        pass
    
class UpdateElementiDomandaSetPort(ABC):

    @abstractmethod
    def updateElementiDomandaAssociati(self, nome: str, elementiId: set[int]) -> bool:
        pass