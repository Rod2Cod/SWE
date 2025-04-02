from src.application.evaluation.AlgoritmoValutazioneRisposteImpl import AlgoritmoValutazioneRisposteImpl as av
from unittest.mock import Mock, patch


class Test_AlgoritmoValutazioneRisposte:

    @classmethod
    def setup_class(cls):
        #creo i mock necesssari
        mockScorer = Mock()
        mockModel = Mock()

        #setto i valori di ritorno dei mock
        mockScorer.score.return_value = {"BLEU": 0.5, "TER": 0.5, "CHRF": 0.5, "ROUGE": 0.5, "BERT": 0.5, "CrossEncoder": 0.5}
        mockModel.predict.return_value = [0.5]

        #creo l'oggetto da testare con i mock
        cls.algoritmo = av(scorer=mockScorer, modelPath="dummyModel")
        with patch("joblib.load", return_value = mockModel):
            _ = cls.algoritmo.evaluate("test", "test")

    def test_returnType(self):
        evaluation = self.algoritmo.evaluate("test", "test")
        assert type(evaluation) == tuple
        assert type(evaluation[0]) == dict
        assert type(evaluation[1]) == float
        valuesType = [type(i) for i in evaluation[0].values()]
        assert all([i == float for i in valuesType])
        keysType = [type(i) for i in evaluation[0].keys()]
        assert all([i == str for i in keysType])

    def test_returnValue(self):
        evaluation = self.algoritmo.evaluate("test", "test")
        assert evaluation == ({'BLEU': 0.5, 'TER': 0.5, 'CHRF': 0.5, 'ROUGE': 0.5, 'BERT': 0.5, 'CrossEncoder': 0.5}, 0.5)
        assert round(evaluation[1],2)>=0 and round(evaluation[1],2)<=1
