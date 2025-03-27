from src.application.ports.output import SaveSetElementiDomandaPort, DeleteSetElementiDomandaPort, GetSetElementiDomandaPort, GetAllSetElementiDomandaPort, EditNomeSetElementiDomandaPort, UpdateElementiDomandaSetPort
from src.domain import ElementoDomanda, SetElementiDomanda
from src.infrastructure.adapter.output.persistence.mapper import SetElementiDomandaPersistenceMapper, ElementoDomandaPersistenceMapper

class SetElementiDomandaPersistenceAdapter(
    SaveSetElementiDomandaPort, DeleteSetElementiDomandaPort, GetSetElementiDomandaPort, GetAllSetElementiDomandaPort, EditNomeSetElementiDomandaPort, UpdateElementiDomandaSetPort
):
    def __init__(self, repository):
        self.__repository = repository
        self.__mapperSet = SetElementiDomandaPersistenceMapper()
        self.__mapperElemento = ElementoDomandaPersistenceMapper()
        
    def saveSetElementiDomanda(self, setElementi: SetElementiDomanda) -> bool:
        self.__repository.saveSetElementiDomanda(self.__mapperSet.toSetElementiDomandaEntity(setElementi))

    def deleteSetElementiDomanda(self, nomeSet: str) -> bool:
        self.__repository.deleteSetElementiDomanda(nomeSet)

    def getSetElementiDomandaByNome(self, nomeSet: str) -> SetElementiDomanda:
        return self.__mapperSet.fromSetElementiDomandaEntity(self.__repository.loadSetElementiDomandaByNome(nomeSet))

    def getAllSetElementiDomanda(self) -> set[SetElementiDomanda]:
        return {self.__mapperSet.fromSetElementiDomandaEntity(x) for x in self.__repository.loadAllSetElementiDomanda()}

    def editNomeSetElementiDomanda(self, nomeSet: str, nuovoNomeSet: str) -> bool:
        self.__repository.updateNomeSetElementiDomanda(nomeSet, nuovoNomeSet)

    def updateElementiSetElementiDomanda(self, nomeSet: str, elementi: set[ElementoDomanda]) -> bool:
        self.__repository.updateElementiSetElementiDomanda(nomeSet, {self.__mapperElemento.toElementoDomandaEntity(x) for x in elementi})