import datetime

class RisultatoSingolaDomanda:
    def __init__(self, id: int, domanda: str, risposta: str, rispostaLLM: str, score: float, metriche: dict[str, float]):
        self.__id = id
        self.__domanda = domanda
        self.__risposta = risposta
        self.__rispostaLLM = rispostaLLM
        self.__score = score
        self.__metriche = metriche

    def getId(self) -> int:
        return self.__id
    
    def getDomanda(self) -> str:
        return self.__domanda
    
    def getRisposta(self) -> str:
        return self.__risposta
    
    def getRispostaLLM(self) -> str:
        return self.__rispostaLLM
    
    def getScore(self) -> float:
        return self.__score
    
    def getMetriche(self) -> dict[str, float]:
        return self.__metriche
    
    def serialize(self) -> dict:
        return {
            "id": self.__id,
            "domanda": self.__domanda,
            "risposta": self.__risposta,
            "rispostaLLM": self.__rispostaLLM,
            "score": self.__score,
            "metriche": self.__metriche
        }

class RisultatoTest:
    def __init__(self, id: int, score: float, LLM: str, dataEsecuzione: datetime, nomeSet: str, risultatiDomande: set[RisultatoSingolaDomanda]):
        self.__id = id
        self.__score = score
        self.__LLM = LLM
        self.__dataEsecuzione = dataEsecuzione
        self.__nomeSet = nomeSet
        self.__risultatiDomande = risultatiDomande

    def getId(self) -> int:
        return self.__id
    
    def getScore(self) -> float:
        return self.__score
    
    def getLLM(self) -> str:
        return self.__LLM
    
    def getDataEsecuzione(self) -> datetime:
        return self.__dataEsecuzione
    
    def getNomeSet(self) -> str:
        return self.__nomeSet
    
    def getRisultatiDomande(self) -> set[RisultatoSingolaDomanda]:
        return self.__risultatiDomande
    
    def serialize(self) -> dict:
        return {
            "id": self.__id,
            "score": self.__score,
            "LLM": self.__LLM,
            "dataEsecuzione": self.__dataEsecuzione,
            "nomeSet": self.__nomeSet,
            "risultatiDomande": [risultatoDomanda.serialize() for risultatoDomanda in self.__risultatiDomande]
        }
        
    def serializeForList(self) -> dict:
        return {
            "id": self.__id,
            "score": self.__score,
            "LLM": self.__LLM,
            "dataEsecuzione": self.__dataEsecuzione,
            "nomeSet": self.__nomeSet
        }