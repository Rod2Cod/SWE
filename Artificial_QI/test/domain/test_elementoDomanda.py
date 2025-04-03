from src.domain import ElementoDomanda,Domanda,Risposta

# TEST DOMANDA

domanda = "Qual è la capitale d'Italia?"

class TestDomanda:
    def setup_method(self):
        self.domanda = Domanda(domanda)

    def test_get_text(self):  
        """Test per il metodo getText."""
        assert self.domanda.getText() == domanda

    def test_set_text(self):
        """Test per il metodo setText."""
        self.domanda.setText("Qual è la capitale della Francia?")
        assert self.domanda.getText() == "Qual è la capitale della Francia?"
        
# TEST RISPOSTA

risposta = "Roma"

class TestRisposta:
    def setup_method(self):
        self.risposta = Risposta(risposta)

    def test_get_text(self):
        """Test per il metodo getText."""
        assert self.risposta.getText() == risposta

    def test_set_text(self):
        """Test per il metodo setText."""
        self.risposta.setText("Parigi")
        assert self.risposta.getText() == "Parigi"

# TEST ELEMENTO DOMANDA

id = 1

class TestElementoDomanda:
    def setup_method(self):
        self.elemento_domanda = ElementoDomanda(domanda, risposta, id) 

    def test_get_id(self):  
        """Test per il metodo getId."""
        assert self.elemento_domanda.getId() == id

    def test_get_domanda(self):  
        """Test per il metodo getDomanda."""
        assert self.elemento_domanda.getDomanda().getText() == domanda

    def test_get_risposta(self):  
        """Test per il metodo getRisposta."""
        assert self.elemento_domanda.getRisposta().getText() == risposta

    def test_set_domanda(self):
        """Test per il metodo setDomanda."""
        self.elemento_domanda.setDomanda("Qual è la capitale della Francia?")
        assert self.elemento_domanda.getDomanda().getText() == "Qual è la capitale della Francia?"

    def test_set_risposta(self):
        """Test per il metodo setRisposta."""
        self.elemento_domanda.setRisposta("Parigi")
        assert self.elemento_domanda.getRisposta().getText() == "Parigi"