import pytest
from src.application.ExecuteTestServices import ExecuteTestService
from src.domain.ElementoDomanda import ElementoDomanda
from src.domain.RisultatoTest import RisultatoTest
from unittest import mock

class TestExecuteTestService:

    def test_execute_test_success(self):
        """Test per il corretto completamento del test con un solo elemento domanda."""
        llm = mock.Mock()
        valutatore = mock.Mock()
        save_port = mock.Mock()
        get_domande_port = mock.Mock()

        elemento = ElementoDomanda("Qual è la capitale d’Italia?", "Roma", 1)
        get_domande_port.getAllElementiDomanda.return_value = [elemento]

        llm.makeQuestion.return_value = "Roma"
        valutatore.evaluate.return_value = ({"similarità": 1.0}, 1.0)
        llm.getName.return_value = "MockLLM"

        service = ExecuteTestService(llm, valutatore, save_port, get_domande_port)

        risultato = service.executeTest()

        assert isinstance(risultato, RisultatoTest)
        assert risultato.getLLM() == "MockLLM"
        assert 0.0 <= risultato.getScore() <= 1.0
        assert len(risultato.getRisultatiDomande()) == 1
        save_port.saveRisultatoTest.assert_called_once_with(risultato)

    def test_execute_test_empty_elementi_domanda(self):
        """Testa il comportamento in assenza di elementi domanda."""
        llm = mock.Mock()
        valutatore = mock.Mock()
        save_port = mock.Mock()
        get_domande_port = mock.Mock()

        get_domande_port.getAllElementiDomanda.return_value = []

        service = ExecuteTestService(llm, valutatore, save_port, get_domande_port)

        with pytest.raises(ZeroDivisionError):
            service.executeTest()
