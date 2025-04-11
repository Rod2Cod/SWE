import pytest
from src.application.ExecuteTestServices import ExecuteTestService, GetTestStatusService
from src.application.ports.output.LLMPort import LLMPort
from src.application.ports.output.RisultatoTestPorts import SaveRisultatoTestPort
from src.application.ports.output.ElementoDomandaPorts import GetAllElementiDomandaPort
from src.application.evaluation.AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from src.application.evaluation.status.StatusTrackerImpl import TestStatusTrackerImpl
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
        cls.status_tracker = TestStatusTrackerImpl()
        cls.service = ExecuteTestService(cls.mockLLM, cls.mockValutatore, cls.mockSavePort, cls.mockGetDomandePort, cls.status_tracker)

    def setup_method(self):
        self.mockLLM.reset_mock()
        self.mockValutatore.reset_mock()
        self.mockSavePort.reset_mock()
        self.mockGetDomandePort.reset_mock()

    def test_execute_test_success(self):
        """Test per il corretto completamento del test"""

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

        self.service.executeTest()
        self.mockGetDomandePort.getAllElementiDomanda.assert_called_once()
        self.mockLLM.makeQuestion.assert_called()
        self.mockLLM.getName.assert_called_once()
        self.mockValutatore.evaluate.assert_called()
        self.mockSavePort.saveRisultatoTest.assert_called_once()

    def test_execute_test_empty_elementi_domanda(self):
        """Testa il comportamento in assenza di elementi domanda."""

        self.mockGetDomandePort.getAllElementiDomanda.return_value = {}

        self.service.executeTest()
        self.mockGetDomandePort.getAllElementiDomanda.assert_called_once()
        self.mockLLM.makeQuestion.assert_not_called()
        self.mockValutatore.evaluate.assert_not_called()
        self.mockSavePort.saveRisultatoTest.assert_not_called()
        self.mockLLM.getName.assert_not_called()
        assert self.status_tracker.get_status()["error"] is not None
            
    def test_execute_test_server_error(self):
        """Test per il corretto completamento del test in presenza di un errore del server."""

        self.mockGetDomandePort.getAllElementiDomanda.return_value = {
            ElementoDomanda("domanda1", "risposta1", 1),
            ElementoDomanda("domanda2", "risposta2", 2),
            ElementoDomanda("domanda3", "risposta3", 3)
            }

        self.mockLLM.makeQuestion.return_value = "risposta_llm"
        self.mockValutatore.evaluate.return_value = ({"metrica1": 0.7, "metrica2": 0.3}, 0.6)
        self.mockLLM.getName.return_value = "GPT-3"
        self.mockSavePort.saveRisultatoTest.side_effect = Exception("Server error.")
        
        self.service.executeTest()

        self.mockGetDomandePort.getAllElementiDomanda.assert_called_once()
        self.mockLLM.makeQuestion.assert_called()
        self.mockLLM.getName.assert_called_once()
        self.mockValutatore.evaluate.assert_called()
        self.mockSavePort.saveRisultatoTest.assert_called_once()
        assert self.status_tracker.get_status()["error"] is not None

class TestGetTestStatusService:
    @classmethod
    def setup_class(cls):
        cls.status_tracker = TestStatusTrackerImpl()
        cls.service = GetTestStatusService(cls.status_tracker)

    def test_get_test_status(self):
        """Test per il corretto recupero dello stato del test."""
        
        result = self.service.getTestStatus()
        
        assert "in_progress" in result.keys()
        assert "completed" in result.keys()
        assert "total" in result.keys()
        assert "percentage" in result.keys()
        assert "error" in result.keys()
        assert "id_risultato" in result.keys()