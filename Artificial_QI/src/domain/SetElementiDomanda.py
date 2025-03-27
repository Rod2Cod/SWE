from src.domain.ElementoDomanda import ElementoDomanda

class SetElementiDomanda:
    def __init__(self, elementi: set[ElementoDomanda], nome: str):
        self.__elementi = elementi
        self.__nome = nome

    def getElementi(self) -> set[ElementoDomanda]:
        return self.__elementi

    def getNome(self) -> str:
        return self.__nome

    def updateElementi(self, elementi: set[ElementoDomanda]):
        self.__elementi = elementi

    def setNome(self, nome: str):
        self.__nome = nome