from src.domain import RisultatoSingolaDomanda, RisultatoTest
from unittest.mock import Mock, patch


class Test_RisultatoSingolaDomanda():
    @classmethod
    def setup_class(cls):
        cls.risultato = None
    
    def setup_method(self):
        self.risultato = RisultatoSingolaDomanda(1, "domanda", "risposta", "rispostaLLM", 0.5, {"metrica1": 0.5, "metrica2": 0.5})

    
    def test_getId(self):
        assert self.risultato.getId() == 1

    def test_getDomanda(self):
        assert self.risultato.getDomanda() == "domanda"

    def test_getRisposta(self):
        assert self.risultato.getRisposta() == "risposta"

    def test_getRispostaLLM(self):
        assert self.risultato.getRispostaLLM() == "rispostaLLM"

    def test_getScore(self):
        assert self.risultato.getScore() == 0.5

    def test_getMetriche(self):
        assert self.risultato.getMetriche() == {"metrica1": 0.5, "metrica2": 0.5}

    def test_serialize(self):
        assert self.risultato.serialize() == {
            "id": 1,
            "domanda": "domanda",
            "risposta": "risposta",
            "rispostaLLM": "rispostaLLM",
            "score": 0.5,
            "metriche": {"metrica1": 0.5, "metrica2": 0.5}
        }
    
    def test_serializeForList(self):
        assert self.risultato.serializeForList() == {
            "domanda": "domanda",
            "score": 0.5
        }

class Test_RisultatoTest:
    @classmethod
    def setup_class(cls):
        cls.risultato = Mock(name="RisultatoSingolaDomanda")
        cls.risultato.serialize.return_value = {
            "id": 1,
            "domanda": "domanda",
            "risposta": "risposta",
            "rispostaLLM": "rispostaLLM",
            "score": 0.5,
            "metriche": {"metrica1": 0.5, "metrica2": 0.5}
        }
        cls.risultato.serializeForList.return_value = {"domanda": "domanda", "score": 0.5}


        cls.test = RisultatoTest(
            1,
            0.5,
            "GPT-3",
            "2021-10-10",
            "nomeSet",
            {cls.risultato}
        )

    def setup_method(self):
        self.risultato.reset_mock()

    def test_getId(self):
        assert self.test.getId() == 1
    
    def test_getScore(self):
        assert self.test.getScore() == 0.5
    
    def test_getLLM(self):
        assert self.test.getLLM() == "GPT-3"
    
    def test_getDataEsecuzione(self):
        assert self.test.getDataEsecuzione() == "2021-10-10"

    def test_getNomeSet(self):
        assert self.test.getNomeSet() == "nomeSet"

    def test_getRisultatiDomande(self):
        assert self.test.getRisultatiDomande() == {self.risultato}

    def test_serialize(self):
        assert self.test.serialize() == {
            "id": 1,
            "score": 0.5,
            "LLM": "GPT-3",
            "dataEsecuzione": "2021-10-10",
            "nomeSet": "nomeSet",
            "risultatiDomande": [self.risultato.serializeForList()]
        }

    def test_serializeForList(self):
        assert self.test.serializeForList() == {
            "id": 1,
            "score": 0.5,
            "LLM": "GPT-3",
            "dataEsecuzione": "2021-10-10",
            "nomeSet": "nomeSet"
        }