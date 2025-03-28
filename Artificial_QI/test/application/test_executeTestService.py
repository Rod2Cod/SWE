from src.application.ExecuteTestServices import ExecuteTestService as ets
from unittest.mock import Mock
from src.domain import ElementoDomanda

class TestExecuteTestService:
    @classmethod
    def setup_class(cls):
        cls.mockLLM = Mock(name="mockLLM")
        cls.mockValutatore = Mock(name="mockValutatore")
        cls.mockSavePort = Mock(name="mockSavePort")
        cls.mockGetDomandePort = Mock(name="mockGetDomandePort")
        cls.service = ets(cls.mockLLM, cls.mockValutatore, cls.mockSavePort, cls.mockGetDomandePort)

    def setup_method(self):
        self.mockLLM.reset_mock()
        self.mockValutatore.reset_mock()
        self.mockSavePort.reset_mock()
        self.mockGetDomandePort.reset_mock()

    def test_executeTest(self):
        self.mockGetDomandePort.getAllElementiDomanda.return_value = set([
            ElementoDomanda("domanda1", "risposta1", 1),
            ElementoDomanda("domanda2", "risposta2", 2),
            ElementoDomanda("domanda3", "risposta3", 3)
            ])
        
        self.mockLLM.makeQuestion.return_value = "risposta_llm"
        self.mockLLM.getName.return_value = "GPT-3"

        self.mockValutatore.evaluate.return_value = ({"metrica1": 0.7, "metrica2": 0.3}, 0.6)

        risultato = self.service.executeTest()
        assert risultato.getId() >= 0
        assert risultato.getScore() == 0.6
        assert risultato.getLLM() == "GPT-3"
        assert risultato.getDataEsecuzione() is not None
        risultatiSingoli = risultato.getRisultatiDomande()
        assert len(risultatiSingoli) == 3
        for _ in range(len(risultatiSingoli)):
            res = risultatiSingoli.pop()
            assert res.getId() >= 0
            assert res.getDomanda().count("domanda") == 1
            assert res.getRisposta().count("risposta") == 1
            assert res.getRispostaLLM() == "risposta_llm"
            assert res.getScore() == 0.6
            assert res.getMetriche() == {"metrica1": 0.7, "metrica2": 0.3}
        self.mockSavePort.saveRisultatoTest.assert_called_once_with(risultato)