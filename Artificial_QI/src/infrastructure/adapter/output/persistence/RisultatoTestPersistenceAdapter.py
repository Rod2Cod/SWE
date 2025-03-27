from src.application.ports.output import SaveRisultatoTestPort, GetRisultatoTestPort, GetAllRisultatiTestPort, GetAllRisultatiSingoleDomandePort, GetRisultatoSingolaDomandaPort
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class RisultatoTestPersistenceAdapter(
    SaveRisultatoTestPort, GetRisultatoTestPort, GetAllRisultatiTestPort, GetAllRisultatiSingoleDomandePort, GetRisultatoSingolaDomandaPort
):
    def __init__(self, repositoryTest, repositorySingolaDomanda, mapperSingolaDomanda, mapperTest):
        self.__repositoryTest = repositoryTest
        self.__repositorySingolaDomanda = repositorySingolaDomanda
        self.__mapperSingolaDomanda = mapperSingolaDomanda
        self.__mapperTest = mapperTest
        
    def saveRisultatoTest(self, risultatoTest: RisultatoTest) -> bool:
        try:
            self.__repositoryTest.saveRisultatoTest(self.__mapperTest.toRisultatoTestEntity(risultatoTest))
            return True
        except SQLAlchemyError:
            return False
        except Exception:
            return False

    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        try:
            return self.__mapperTest.fromRisultatoTestEntity(self.__repositoryTest.loadRisultatoTestById(id))
        except NoResultFound:
            raise ValueError("Risultato non trovato.")
        except SQLAlchemyError:
            return False
        except Exception:
            return False

    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        try:
            return set(self.__mapperTest.fromRisultatoTestEntity(risultatoTest) for risultatoTest in self.__repositoryTest.loadAllRisultatiTest())
        except SQLAlchemyError as e:
            print(e)
            return False
        except Exception as e:
            print(e)
            return False
    
    def getAllRisultatiSingoleDomandeByTestId(self, id: int) -> set[RisultatoSingolaDomanda]:
        try:
            return set(self.__mapperSingolaDomanda.fromRisultatoSingolaDomandaEntity(risultatoSingolaDomanda) for risultatoSingolaDomanda in self.__repositorySingolaDomanda.loadAllRisultatiSingoleDomandeByTestId(id))
        except NoResultFound:
            raise ValueError("Risultato non trovato.")
        except SQLAlchemyError as e:
            print(e)
            return False
        except Exception as e:
            print(e)
            return False

    def getRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomanda:
        try:
            return self.__mapperSingolaDomanda.fromRisultatoSingolaDomandaEntity(self.__repositorySingolaDomanda.loadRisultatoSingolaDomandaTestById(id))
        except NoResultFound:
            raise ValueError("Risultato non trovato.")
        except SQLAlchemyError:
            return False
        except Exception:
            return False