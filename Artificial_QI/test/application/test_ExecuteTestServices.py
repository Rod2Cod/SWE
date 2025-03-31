import pytest
from src.application.ExecuteTestServices import ExecuteTestService
from src.application.ports.output.LLMPort import LLMPort
from src.application.ports.output.RisultatoTestPorts import SaveRisultatoTestPort
from src.application.ports.output.ElementiDomandaPorts import GetAllElementiDomandaPort
from src.application.evaluation.AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from src.domain.ElementoDomanda import ElementoDomanda
from src.domain.RisultatoTest import RisultatoTest, RisultatoSingolaDomanda
from datetime import datetime
from unittest import mock

class TestExecuteTestService:
    @classmethod
    def setup_class(cls):
        cls.mockLLM = mock.Mock(spec=LLMPort)
        cls.mockValutatore = mock.Mock(spec=AlgoritmoValutazioneRisposte)
        cls.mockSavePort = mock.Mock(spec=SaveRisultatoTestPort)
        cls.mockGetDomandePort = mock.Mock(spec=GetAllElementiDomandaPort)
        cls.service = ExecuteTestService(cls.mockLLM, cls.mockValutatore, cls.mockSavePort, cls.mockGetDomandePort)

    def setup_method(self):
        self.mockLLM.reset_mock()
        self.mockValutatore.reset_mock()
        self.mockSavePort.reset_mock()
        self.mockGetDomandePort.reset_mock()

    def test_execute_test_success(self):
        """Test per il corretto completamento del test con un solo elemento domanda."""

        self.mockGetDomandePort.getAllElementiDomanda.return_value = {
            ElementoDomanda("domanda1", "risposta1", 1),
            ElementoDomanda("domanda2", "risposta2", 2),
            ElementoDomanda("domanda3", "risposta3", 3)
            }

        self.mockLLM.makeQuestion.return_value = "risposta_llm"
        self.mockValutatore.evaluate.return_value = ({"metrica1": 0.7, "metrica2": 0.3}, 0.6)
        self.mockLLM.getName.return_value = "GPT-3"
        self.mockSavePort.saveRisultatoTest.return_value = RisultatoTest(
            id=1,
            score=0.6,
            LLM="GPT-3",
            dataEsecuzione=datetime(2025, 3, 31),
            nomeSet=None,
            risultatiDomande={
                RisultatoSingolaDomanda(
                    id=1,
                    domanda="domanda1",
                    risposta="risposta1",
                    rispostaLLM="risposta_llm",
                    score=0.6,
                    metriche={"metrica1": 0.7, "metrica2": 0.3}
                ),
                RisultatoSingolaDomanda(
                    id=2,
                    domanda="domanda2",
                    risposta="risposta2",
                    rispostaLLM="risposta_llm",
                    score=0.6,
                    metriche={"metrica1": 0.7, "metrica2": 0.3}
                ),
                RisultatoSingolaDomanda(
                    id=3,
                    domanda="domanda3",
                    risposta="risposta3",
                    rispostaLLM="risposta_llm",
                    score=0.6,
                    metriche={"metrica1": 0.7, "metrica2": 0.3}
                )
            }
        )

        risultato = self.service.executeTest()
        assert risultato.getId() >= 0
        assert risultato.getScore() == 0.6
        assert risultato.getLLM() == "GPT-3"
        assert risultato.getDataEsecuzione() is not None
        assert len(risultato.getRisultatiDomande()) == 3
        for res in risultato.getRisultatiDomande():
            assert res.getId() >= 0
            assert res.getDomanda().count("domanda") == 1
            assert res.getRisposta().count("risposta") == 1
            assert res.getRispostaLLM() == "risposta_llm"
            assert res.getScore() == 0.6
            assert res.getMetriche() == {"metrica1": 0.7, "metrica2": 0.3}
        
        self.mockSavePort.saveRisultatoTest.assert_called_once()

    def test_execute_test_empty_elementi_domanda(self):
        """Testa il comportamento in assenza di elementi domanda."""
        llm = mock.Mock()
        valutatore = mock.Mock()
        save_port = mock.Mock()
        get_domande_port = mock.Mock()

        get_domande_port.getAllElementiDomanda.return_value = []

        service = ExecuteTestService(llm, valutatore, save_port, get_domande_port)

        with pytest.raises(Exception):
            service.executeTest()
