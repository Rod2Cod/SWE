import pytest
from src.application.RisultatoTestServices import (GetRisultatoTestService, 
                                                   GetAllRisultatiTestService, 
                                                   GetRisultatoSingolaDomandaService,
                                                   validateId)
from src.application.ports.output.RisultatoTestPorts import GetRisultatoTestPort, GetAllRisultatiTestPort, GetRisultatoSingolaDomandaPort
from src.domain.RisultatoTest import RisultatoTest, RisultatoSingolaDomanda
from unittest import mock

def test_validate_id_invalid():
    with pytest.raises(ValueError):
        validateId("ciao")

def test_validate_id():
    assert validateId(1) == None

class TestGetRisultatoTestService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=GetRisultatoTestPort)
        cls.service = GetRisultatoTestService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_get_risultato_test_by_id(self):
        """Test per il servizio di recupero di un RisultatoTest tramite ID."""

        self.mockPort.getRisultatoTestById.return_value = mock.Mock(1, 0.8, "LLM", "2024-01-01", "set1", set())

        result = self.service.getRisultatoTestById(1)

        self.mockPort.getRisultatoTestById.assert_called_once_with(1)
        assert result == self.mockPort.getRisultatoTestById.return_value

    def test_get_risultato_test_by_invalid_id(self):
        """Test per il servizio con ID non intero."""

        with pytest.raises(ValueError):
            self.service.getRisultatoTestById("uno")


class TestGetAllRisultatiTestService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=GetAllRisultatiTestPort)
        cls.service = GetAllRisultatiTestService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_get_all_risultati_test(self):
        """Test per il servizio di recupero di tutti i RisultatoTest."""

        self.mockPort.getAllRisultatiTest.return_value = {
                                                            mock.Mock(1, 0.8, "LLM", "2024-01-01", "set1", set()),
                                                            mock.Mock(2, 0.9, "LLM", "2024-01-02", "set2", set())
                                                        }

        result = self.service.getAllRisultatiTest()

        self.mockPort.getAllRisultatiTest.assert_called_once()
        assert result == self.mockPort.getAllRisultatiTest.return_value
        
    def test_get_all_risultati_test_empty(self):
        """Test per il servizio di recupero di tutti i RisultatoTest quando non ci sono risultati."""

        self.mockPort.getAllRisultatiTest.return_value = set()

        result = self.service.getAllRisultatiTest()

        self.mockPort.getAllRisultatiTest.assert_called_once()
        assert len(result) == 0


class TestGetRisultatoSingolaDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=GetRisultatoSingolaDomandaPort)
        cls.service = GetRisultatoSingolaDomandaService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_get_risultato_singola_domanda_by_id(self):
        """Test per il servizio di recupero di una singola domanda tramite ID."""

        self.mockPort.getRisultatoSingolaDomandaTestById.return_value = mock.Mock(1, "Domanda?", "Risposta", "LLM", 0.9, {"metrica1": 0.9, "metrica2": 0.1})

        result = self.service.getRisultatoSingolaDomandaTestById(1)

        self.mockPort.getRisultatoSingolaDomandaTestById.assert_called_once_with(1)
        assert result == self.mockPort.getRisultatoSingolaDomandaTestById.return_value

    def test_get_risultato_singola_domanda_invalid_id(self):
        """Test per ID non valido nel recupero della singola domanda."""

        with pytest.raises(ValueError):
            self.service.getRisultatoSingolaDomandaTestById("uno")
