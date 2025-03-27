from src.application.ports.output import GetRisultatoTestPort, GetAllRisultatiTestPort, GetAllRisultatiSingoleDomandePort, GetRisultatoSingolaDomandaPort
from src.application.ports.input import GetRisultatoTestUseCase, GetAllRisultatiTestUseCase, GetAllRisultatiSingoleDomandeUseCase, GetRisultatoSingolaDomandaUseCase
from src.domain import RisultatoTest, RisultatoSingolaDomanda

def validateId(id: int):
    if not isinstance(id, int):
        raise ValueError("Id deve essere un intero.")

class GetRisultatoTestService(GetRisultatoTestUseCase):
    def __init__(self, port: GetRisultatoTestPort):
        self.__port = port

    def getRisultatoTestById(self, id: int) -> RisultatoTest:
        validateId(id)
        return self.__port.getRisultatoTestById(id)
    
class GetAllRisultatiTestService(GetAllRisultatiTestUseCase):
    def __init__(self, port: GetAllRisultatiTestPort):
        self.__port = port

    def getAllRisultatiTest(self) -> set[RisultatoTest]:
        return self.__port.getAllRisultatiTest()
    
class GetAllRisultatiSingoleDomandeService(GetAllRisultatiSingoleDomandeUseCase):
    def __init__(self, port: GetAllRisultatiSingoleDomandePort):
        self.__port = port

    def getAllRisultatiSingoleDomandeByTestId(self, id: int) -> set[RisultatoSingolaDomanda]:
        validateId(id)
        return self.__port.getAllRisultatiSingoleDomandeByTestId(id)
    
class GetRisultatoSingolaDomandaService(GetRisultatoSingolaDomandaUseCase):
    def __init__(self, port: GetRisultatoSingolaDomandaPort):
        self.__port = port

    def getRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomanda:
        validateId(id)
        return self.__port.getRisultatoSingolaDomandaTestById(id)