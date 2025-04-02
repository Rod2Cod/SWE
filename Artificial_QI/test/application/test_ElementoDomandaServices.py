import pytest
from unittest import mock
from src.application.ElementoDomandaServices import (AddElementoDomandaService, 
                                                     GetElementoDomandaService, 
                                                     GetAllElementiDomandaService, 
                                                     DeleteElementiDomandaService, 
                                                     UpdateElementoDomandaService,
                                                     validateDomandaRisposta,
                                                     validateId,
                                                     validateIdSet)
from src.application.ports.output.ElementiDomandaPorts import (SaveElementoDomandaPort, 
                                                               GetElementoDomandaPort, 
                                                               GetAllElementiDomandaPort, 
                                                               DeleteElementiDomandaPort, 
                                                               UpdateElementoDomandaPort)
from src.domain.ElementoDomanda import ElementoDomanda

@pytest.mark.parametrize("domanda, risposta", [("domanda", False), (True, "risposta"), (True,False), ("", "risposta"), ("domanda", "")])
def test_validate_domanda_risposta_invalid(domanda,risposta):
    with pytest.raises(ValueError):
        validateDomandaRisposta(domanda, risposta)

def test_validate_domanda_risposta():
    validateDomandaRisposta("domanda", "risposta")
    assert True

def test_validate_id_invalid():
    with pytest.raises(ValueError):
        validateId("id")

def test_validate_id():
    validateId(1)
    assert True

@pytest.mark.parametrize("ids", [set([1,"2",3]), set([1,2,"3"]), set(["1",2,3]),set()])
def test_validate_id_set_invalid(ids):
    with pytest.raises(ValueError):
        validateIdSet(ids)

def test_validate_id_set():
    validateIdSet(set([1,2,3]))
    assert True

class TestAddElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=SaveElementoDomandaPort)
        cls.service = AddElementoDomandaService(cls.mockPort)
    
    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_add_elemento_domanda(self):
        """Test per il servizio di aggiunta di un elemento domanda."""
        
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        self.mockPort.saveElementoDomanda.return_value = ElementoDomanda(domanda=domanda, risposta=risposta, id=1)
        
        result = self.service.addElementoDomanda(domanda, risposta)
        
        self.mockPort.saveElementoDomanda.assert_called_once_with(domanda, risposta)
        assert result == self.mockPort.saveElementoDomanda.return_value
        
    @pytest.mark.parametrize("domanda,risposta", [("", "Roma"), ("Qual è la capitale d'Italia?", ""), (123, "Roma"), ("Qual è la capitale d'Italia?", 456)])
    def test_add_elemento_domanda_invalid(self, domanda, risposta):
        """Test per il servizio di aggiunta di un elemento domanda con dati non validi."""
        
        with pytest.raises(ValueError):
            self.service.addElementoDomanda(domanda, risposta)
            
class TestGetElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=GetElementoDomandaPort)
        cls.service = GetElementoDomandaService(cls.mockPort)
    
    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_get_elemento_domanda_by_id(self):
        """Test per il servizio di recupero di un elemento domanda."""
        
        id = 1
        self.mockPort.getElementoDomandaById.return_value = ElementoDomanda(domanda="Qual è la capitale d'Italia?", risposta="Roma", id=id)
        
        result = self.service.getElementoDomandaById(id)
        
        self.mockPort.getElementoDomandaById.assert_called_once_with(id)
        assert result == self.mockPort.getElementoDomandaById.return_value
        
    def test_get_elemento_domanda_by_id_invalid(self):
        """Test per il servizio di recupero di un elemento domanda con ID non valido."""
        
        with pytest.raises(ValueError):
            self.service.getElementoDomandaById("1")
            
class TestGetAllElementiDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=GetAllElementiDomandaPort)
        cls.service = GetAllElementiDomandaService(cls.mockPort)
    
    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_get_all_elementi_domanda(self):
        """Test per il servizio di recupero di tutti gli elementi domanda."""
        
        self.mockPort.getAllElementiDomanda.return_value = [
            ElementoDomanda(domanda="Qual è la capitale d'Italia?", risposta="Roma", id=1),
            ElementoDomanda(domanda="Qual è la capitale della Francia?", risposta="Parigi", id=2)
        ]
        
        result = self.service.getAllElementiDomanda()
        
        self.mockPort.getAllElementiDomanda.assert_called_once()
        assert result == self.mockPort.getAllElementiDomanda.return_value
        
    def test_get_all_elementi_domanda_empty(self):
        """Test per il servizio di recupero di tutti gli elementi domanda quando non ci sono elementi."""
        
        self.mockPort.getAllElementiDomanda.return_value = []
        
        result = self.service.getAllElementiDomanda()
        
        self.mockPort.getAllElementiDomanda.assert_called_once()
        assert result == self.mockPort.getAllElementiDomanda.return_value
        assert len(result) == 0
        
class TestDeleteElementiDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=DeleteElementiDomandaPort)
        cls.service = DeleteElementiDomandaService(cls.mockPort)
    
    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_delete_elementi_domanda_by_id(self):
        """Test per il servizio di eliminazione di uno o più elementi domanda."""
        
        ids = {1, 2}
        self.mockPort.deleteElementiDomandaById.return_value = True
        
        result = self.service.deleteElementiDomandaById(ids)
        
        self.mockPort.deleteElementiDomandaById.assert_called_once_with(ids)
        assert result == self.mockPort.deleteElementiDomandaById.return_value
        
    @pytest.mark.parametrize("ids", [set(), {1, "2"}, {1, 2, "3"}])
    def test_delete_elementi_domanda_by_id_invalid(self, ids):
        """Test per il servizio di eliminazione di uno o più elementi domanda con ID non validi."""
        
        with pytest.raises(ValueError):
            self.service.deleteElementiDomandaById(ids)

class TestUpdateElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.mockPort = mock.Mock(spec=UpdateElementoDomandaPort)
        cls.service = UpdateElementoDomandaService(cls.mockPort)
    
    def setup_method(self):
        self.mockPort.reset_mock()
    
    def test_update_elemento_domanda_by_id(self):
        """Test per il servizio di aggiornamento di un elemento domanda."""
        
        id = 1
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        self.mockPort.updateElementoDomandaById.return_value = True
        
        result = self.service.updateElementoDomandaById(id, domanda, risposta)
        
        self.mockPort.updateElementoDomandaById.assert_called_once_with(id, domanda, risposta)
        assert result == self.mockPort.updateElementoDomandaById.return_value
        
    @pytest.mark.parametrize("id,domanda,risposta", [(1, "", "Roma"), (1, "Qual è la capitale d'Italia?", ""), (1, 123, "Roma"), (1, "Qual è la capitale d'Italia?", 456)])
    def test_update_elemento_domanda_by_id_invalid(self, id, domanda, risposta):
        """Test per il servizio di aggiornamento di un elemento domanda con dati non validi."""
        
        with pytest.raises(ValueError):
            self.service.updateElementoDomandaById(id, domanda, risposta)