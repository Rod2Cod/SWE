from abc import ABC, abstractmethod
from src.domain import ElementoDomanda

class SaveElementoDomandaPort(ABC):

    @abstractmethod
    def saveElementoDomanda(self, elemento: ElementoDomanda) -> ElementoDomanda:
        pass
    
class GetElementoDomandaPort(ABC):

    @abstractmethod
    def getElementoDomandaById(self, idElemento: int) -> ElementoDomanda:
        pass
    
class GetAllElementiDomandaPort(ABC):

    @abstractmethod
    def getAllElementiDomanda(self) -> set[ElementoDomanda]:
        pass
    
class DeleteElementiDomandaPort(ABC):

    @abstractmethod
    def deleteElementiDomandaById(self, idElementi: set[int]) -> bool:
        pass
    
class UpdateElementoDomandaPort(ABC):

    @abstractmethod
    def updateElementoDomandaById(self, idElemento: int, domanda: str, risposta: str) -> bool:
        pass