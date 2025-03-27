from abc import ABC, abstractmethod
from src.domain import ElementoDomanda

class AddElementoDomandaUseCase(ABC):
    @abstractmethod
    def addElementoDomanda(self, domanda: str, risposta: str) -> ElementoDomanda:
        pass
    
class GetElementoDomandaUseCase(ABC):
    @abstractmethod
    def getElementoDomandaById(self, id: int) -> ElementoDomanda:
        pass
    
class GetAllElementiDomandaUseCase(ABC):
    @abstractmethod
    def getAllElementiDomanda(self) -> set[ElementoDomanda]:
        pass
    
class DeleteElementiDomandaUseCase(ABC):
    @abstractmethod
    def deleteElementiDomandaById(self, Ids: set[int]) -> bool:
        pass
    
class UpdateElementoDomandaUseCase(ABC):
    @abstractmethod
    def updateElementoDomandaById(self, id: int, domanda: str, risposta: str) -> bool:
        pass