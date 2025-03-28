from .AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from .Scorer import Scorer
import pandas as pd
import joblib

class AlgoritmoValutazioneRisposteImpl(AlgoritmoValutazioneRisposte):
    def __init__(self, scorer: Scorer, model: str = "assets/model.joblib"):
        self.__model = joblib.load(model)
        self.__scorer = scorer
    
    def __trandformInput(self, data: dict) -> pd.DataFrame:
        return pd.DataFrame.from_dict(data, orient='index').T

    def evaluate(self, risposta_attesa: str, risposta_llm: str) -> tuple[dict[str, float], float]:
        weights = self.__scorer.score(risposta_attesa, risposta_llm)
        processedWeights = self.__trandformInput(weights)
        score = self.__model.predict(processedWeights)

        return(weights, score[0])