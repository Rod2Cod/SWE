from .AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from .Scorer import Scorer
import pandas as pd
import joblib

class AlgoritmoValutazioneRisposteImpl(AlgoritmoValutazioneRisposte):
    def __init__(self, scorer: Scorer, modelPath: str = "assets/model.joblib"):
        self.__modelPath = modelPath
        self.__scorer = scorer

        self.__model = None
    
    def __transformInput(self, data: dict) -> pd.DataFrame:
        return pd.DataFrame.from_dict(data, orient='index').T

    def evaluate(self, risposta_attesa: str, risposta_llm: str) -> tuple[dict[str, float], float]:
        weights = self.__scorer.score(risposta_attesa, risposta_llm)
        processedWeights = self.__transformInput(weights)
        if self.__model is None:
            self.__model = joblib.load(self.__modelPath)
        score = self.__model.predict(processedWeights)

        return(weights, score[0])