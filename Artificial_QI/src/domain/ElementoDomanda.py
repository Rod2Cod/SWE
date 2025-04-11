class Domanda:
    def __init__(self, text: str):
        self.__testo = text

    def getText(self) -> str:
        return self.__testo
    
    def setText(self, text: str):
        self.__testo = text

class Risposta:
    def __init__(self, text: str):
        self.__testo = text

    def getText(self) -> str:
        return self.__testo
    
    def setText(self, text: str):
        self.__testo = text

class ElementoDomanda:
    def __init__(self, domanda: str, risposta: str, id: int):
        self.__domanda = Domanda(domanda)
        self.__risposta = Risposta(risposta)
        self.__id = id

    def getId(self) -> int:
        return self.__id
    
    def getDomanda(self) -> Domanda:
        return self.__domanda
    
    def getRisposta(self) -> Risposta:
        return self.__risposta

    def setDomanda(self, domanda: str):
        self.__domanda.setText(domanda)

    def setRisposta(self, risposta: str):
        self.__risposta.setText(risposta)
        
    def serialize(self) -> dict:
        return {
            "id": self.__id,
            "domanda": self.__domanda.getText(),
            "risposta": self.__risposta.getText()
        }