from src.application.ports.output import SaveRisultatoTestPort, GetRisultatoTestPort, GetAllRisultatiTestPort, GetRisultatoSingolaDomandaPort
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class RisultatoTestPersistenceAdapter(
    SaveRisultatoTestPort, GetRisultatoTestPort, GetAllRisultatiTestPort, GetRisultatoSingolaDomandaPort
):
    def __init__(self, repositoryTest, repositorySingolaDomanda, mapperSingolaDomanda, mapperTest):
        self.__repositoryTest = repositoryTest
        self.__repositorySingolaDomanda = repositorySingolaDomanda
        self.__mapperSingolaDomanda = mapperSingolaDomanda
        self.__mapperTest = mapperTest
        
    def saveRisultatoTest(self, risultatoTest: RisultatoTest) -> RisultatoTest:
        try:
            return self.__mapperTest.fromRisultatoTestEntity(self.__repositoryTest.saveRisultatoTest(self.__mapperTest.toRisultatoTestEntity(risultatoTest)))
        except SQLAlchemyError:
            return None
        except Exception:
            return None

    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        try:
            return self.__mapperTest.fromRisultatoTestEntity(self.__repositoryTest.loadRisultatoTestById(id))
        except NoResultFound:
            raise ValueError("Risultato non trovato.")
        except SQLAlchemyError:
            return None
        except Exception:
            return None

    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        try:
            return set(self.__mapperTest.fromRisultatoTestEntity(risultatoTest) for risultatoTest in self.__repositoryTest.loadAllRisultatiTest())
        except SQLAlchemyError:
            return None
        except Exception:
            return None

    def getRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomanda:
        try:
            return self.__mapperSingolaDomanda.fromRisultatoSingolaDomandaEntity(self.__repositorySingolaDomanda.loadRisultatoSingolaDomandaTestById(id))
        except NoResultFound:
            raise ValueError("Risultato non trovato.")
        except SQLAlchemyError:
            return None
        except Exception:
            return None