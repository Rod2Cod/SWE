import pytest
from src.application.RisultatoTestServices import GetRisultatoTestService, GetAllRisultatiTestService, GetRisultatoSingolaDomandaService
from src.application.ports.output.RisultatoTestPorts import GetRisultatoTestPort, GetAllRisultatiTestPort, GetRisultatoSingolaDomandaPort
from src.domain.RisultatoTest import RisultatoTest, RisultatoSingolaDomanda
from unittest import mock

class TestGetRisultatoTestService:

    def test_get_risultato_test_by_id(self):
        """Test per il servizio di recupero di un RisultatoTest tramite ID."""
        port = mock.Mock(spec=GetRisultatoTestPort)
        service = GetRisultatoTestService(port)

        expected = RisultatoTest(1, 0.8, "LLM", "2024-01-01", "set1", set())
        port.getRisultatoTestById.return_value = expected

        result = service.getRisultatoTestById(1)

        port.getRisultatoTestById.assert_called_once_with(1)
        assert result == expected

    def test_get_risultato_test_by_invalid_id(self):
        """Test per il servizio con ID non intero."""
        port = mock.Mock(spec=GetRisultatoTestPort)
        service = GetRisultatoTestService(port)

        with pytest.raises(ValueError):
            service.getRisultatoTestById("uno")


class TestGetAllRisultatiTestService:

    def test_get_all_risultati_test(self):
        """Test per il servizio di recupero di tutti i RisultatoTest."""
        port = mock.Mock(spec=GetAllRisultatiTestPort)
        service = GetAllRisultatiTestService(port)

        expected = {RisultatoTest(1, 0.8, "LLM", "2024-01-01", "set1", set())}
        port.getAllRisultatiTest.return_value = expected

        result = service.getAllRisultatiTest()

        port.getAllRisultatiTest.assert_called_once()
        assert result == expected


class TestGetRisultatoSingolaDomandaService:

    def test_get_risultato_singola_domanda_by_id(self):
        """Test per il servizio di recupero di una singola domanda tramite ID."""
        port = mock.Mock(spec=GetRisultatoSingolaDomandaPort)
        service = GetRisultatoSingolaDomandaService(port)

        expected = RisultatoSingolaDomanda(1, "Domanda?", "Risposta", "LLM", 0.9, {"score": 0.9})
        port.getRisultatoSingolaDomandaTestById.return_value = expected

        result = service.getRisultatoSingolaDomandaTestById(1)

        port.getRisultatoSingolaDomandaTestById.assert_called_once_with(1)
        assert result == expected

    def test_get_risultato_singola_domanda_invalid_id(self):
        """Test per ID non valido nel recupero della singola domanda."""
        port = mock.Mock(spec=GetRisultatoSingolaDomandaPort)
        service = GetRisultatoSingolaDomandaService(port)

        with pytest.raises(ValueError):
            service.getRisultatoSingolaDomandaTestById("abc")
