from src.domain.ElementoDomanda import ElementoDomanda, Domanda, Risposta
from unittest.mock import Mock, patch

class Test_Domanda:
    @classmethod
    def setup_class(cls):
        cls.domanda = Domanda("domanda")

    def setup_method(self):
        self.domanda.setText("domanda")

    def test_getText(self):
        assert self.domanda.getText() == "domanda"

    def test_setText(self):
        self.domanda.setText("new_domanda")
        assert self.domanda.getText() == "new_domanda"

class Test_Risposta:
    @classmethod
    def setup_class(cls):
        cls.risposta = Risposta("risposta")

    def setup_method(self):
        self.risposta.setText("risposta")

    def test_getText(self):
        assert self.risposta.getText() == "risposta"

    def test_setText(self):
        self.risposta.setText("new_risposta")
        assert self.risposta.getText() == "new_risposta"

class Test_ElementoDomanda:
    @classmethod
    def setup_class(cls):
        cls.mockDomanda = Mock(name="Domanda")
        cls.mockDomanda.getText.return_value = "domanda"
        cls.mockRisposta = Mock(name="Risposta")
        cls.mockRisposta.getText.return_value = "risposta"

        with patch("src.domain.ElementoDomanda.Domanda", return_value = cls.mockDomanda):
            with patch("src.domain.ElementoDomanda.Risposta", return_value = cls.mockRisposta):
                cls.elemento = ElementoDomanda("useless1", "useless2", 1)

    def setup_method(self):
        self.mockDomanda.reset_mock()
        self.mockRisposta.reset_mock()

    def test_getId(self):
        assert self.elemento.getId() == 1

    def test_getDomanda(self):
        assert self.elemento.getDomanda() == self.mockDomanda

    def test_getRisposta(self):
        assert self.elemento.getRisposta() == self.mockRisposta

    def test_setDomanda(self):
        self.elemento.setDomanda("new_domanda")
        self.mockDomanda.setText.assert_called_once_with("new_domanda")

    def test_setRisposta(self):
        self.elemento.setRisposta("new_risposta")
        self.mockRisposta.setText.assert_called_once_with("new_risposta")
    
    def test_serialize(self):
        assert self.elemento.serialize() == {
            "id": 1,
            "domanda": "domanda",
            "risposta": "risposta"
        }