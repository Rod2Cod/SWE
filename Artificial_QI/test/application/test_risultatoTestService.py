import src.application.RisultatoTestServices as rts
import pytest
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from unittest.mock import Mock

def test_invalidValidateId():
    with pytest.raises(ValueError):
        rts.validateId("ciao")

def test_validValidateId():
    assert rts.validateId(1) == None

class Test_getRisultatoTestService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = Mock(name="mockPort")
        cls.service = rts.GetRisultatoTestService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_getRisultatoTestById(self):
        risultatoTest = RisultatoTest(1, 0.5, "GPT-3", "01-01-2021", "", set())
        self.mockPort.getRisultatoTestById.return_value = risultatoTest

        assert self.service.getRisultatoTestById(1) == risultatoTest
        self.mockPort.getRisultatoTestById.assert_called_once_with(1)

class Test_getAllRisultatiTestService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = Mock(name="mockPort")
        cls.service = rts.GetAllRisultatiTestService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_getAllRisultatiTest(self):
        risultati = set([
            RisultatoTest(1, 0.5, "GPT-3", "01-01-2021", "", set()),
            RisultatoTest(2, 0.6, "GPT-3", "01-01-2021", "", set()),
            RisultatoTest(3, 0.7, "GPT-3", "01-01-2021", "", set())
            ])
        self.mockPort.getAllRisultatiTest.return_value = risultati

        assert self.service.getAllRisultatiTest() == risultati
        self.mockPort.getAllRisultatiTest.assert_called_once()

class Test_getAllRisultatiSingoleDomandeService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = Mock(name="mockPort")
        cls.service = rts.GetAllRisultatiSingoleDomandeService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_getAllRisultatiSingoleDomandeByTestId(self):
        risultati = set([
            RisultatoSingolaDomanda(1, "domanda1", "risposta1", "risposta_llm1", 0.5, {"metrica1": 0.7, "metrica2": 0.3}),
            RisultatoSingolaDomanda(2, "domanda2", "risposta2", "risposta_llm2", 0.6, {"metrica1": 0.7, "metrica2": 0.3}),
            RisultatoSingolaDomanda(3, "domanda3", "risposta3", "risposta_llm3", 0.7, {"metrica1": 0.7, "metrica2": 0.3})
            ])
        self.mockPort.getAllRisultatiSingoleDomandeByTestId.return_value = risultati

        assert self.service.getAllRisultatiSingoleDomandeByTestId(1) == risultati
        self.mockPort.getAllRisultatiSingoleDomandeByTestId.assert_called_once_with(1)

class Test_getRisultatoSingolaDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = Mock(name="mockPort")
        cls.service = rts.GetRisultatoSingolaDomandaService(cls.mockPort)

    def setup_method(self):
        self.mockPort.reset_mock()

    def test_getRisultatoSingolaDomandaTestById(self):
        risultato = RisultatoSingolaDomanda(1, "domanda1", "risposta1", "risposta_llm1", 0.5, {"metrica1": 0.7, "metrica2": 0.3})
        self.mockPort.getRisultatoSingolaDomandaTestById.return_value = risultato

        assert self.service.getRisultatoSingolaDomandaTestById(1) == risultato
        self.mockPort.getRisultatoSingolaDomandaTestById.assert_called_once_with(1)