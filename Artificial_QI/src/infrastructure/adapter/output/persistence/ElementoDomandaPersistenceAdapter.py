from src.application.ports.output import SaveElementoDomandaPort, GetElementoDomandaPort, DeleteElementiDomandaPort, GetAllElementiDomandaPort, UpdateElementoDomandaPort
from src.domain import ElementoDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class ElementoDomandaPersistenceAdapter(
    SaveElementoDomandaPort, GetElementoDomandaPort, DeleteElementiDomandaPort, GetAllElementiDomandaPort, UpdateElementoDomandaPort
):
    def __init__(self, repository, mapper):
        self.__repository = repository
        self.__mapper = mapper

    def saveElementoDomanda(self, domanda: str, risposta: str) -> ElementoDomanda:
        try:
            return self.__mapper.fromElementoDomandaEntity(self.__repository.saveElementoDomanda(self.__mapper.fromDomandaRisposta(domanda, risposta)))
        # problema nel database
        except SQLAlchemyError:
            return None
        except Exception:
            return None

    def getElementoDomandaById(self, id: int) -> ElementoDomanda:
        try:
            return self.__mapper.fromElementoDomandaEntity(self.__repository.loadElementoDomandaById(id))
        # elemento non trovato
        except NoResultFound:
            raise ValueError("Elemento non trovato.")
        # problema nel database
        except SQLAlchemyError:
            return None
        except Exception:
            return None
        
    def getAllElementiDomanda(self) -> set[ElementoDomanda]:
        try:
            return set(self.__mapper.fromElementoDomandaEntity(x) for x in self.__repository.loadAllElementiDomanda())
        # problema nel database
        except SQLAlchemyError:
            return None
        except Exception:
            return None

    def deleteElementiDomandaById(self, Ids: set[int]) -> bool:
        try:
            self.__repository.deleteElementiDomanda(Ids)
            return True
        # problema nel database
        except SQLAlchemyError:
            return False
        except Exception:
            return False

    def updateElementoDomandaById(self, id: int, domanda: str, risposta: str) -> bool:
        try:
            self.__repository.updateElementoDomanda(id, domanda, risposta)
            return True
        # elemento non trovato
        except NoResultFound:
            raise ValueError("Elemento non trovato.")
        # problema nel database
        except SQLAlchemyError:
            return False
        except Exception:
            return False