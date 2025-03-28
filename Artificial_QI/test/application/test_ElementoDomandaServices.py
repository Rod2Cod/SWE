import pytest
from src.application.ElementoDomandaServices import AddElementoDomandaService, GetElementoDomandaService, GetAllElementiDomandaService, DeleteElementiDomandaService, UpdateElementoDomandaService
from src.application.ports.output.ElementiDomandaPorts import SaveElementoDomandaPort, GetElementoDomandaPort, GetAllElementiDomandaPort, DeleteElementiDomandaPort, UpdateElementoDomandaPort
from unittest import mock

class TestAddElementoDomandaService:
    
    def test_add_elemento_domanda(self):
        """Test per il servizio di aggiunta di un elemento domanda."""
        mockPort = mock.Mock(spec=SaveElementoDomandaPort)
        service = AddElementoDomandaService(mockPort)
        
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        mockPort.saveElementoDomanda.return_value = {"id": 1, "domanda": domanda, "risposta": risposta}
        
        result = service.addElementoDomanda(domanda, risposta)
        
        mockPort.saveElementoDomanda.assert_called_once_with(domanda, risposta)
        assert result == mockPort.saveElementoDomanda.return_value
        
    def test_add_elemento_domanda_invalid(self):
        """Test per il servizio di aggiunta di un elemento domanda con dati non validi."""
        mockPort = mock.Mock(spec=SaveElementoDomandaPort)
        service = AddElementoDomandaService(mockPort)
        
        with pytest.raises(ValueError):
            service.addElementoDomanda("", "Roma")
        with pytest.raises(ValueError):
            service.addElementoDomanda("Qual è la capitale d'Italia?", "")
        with pytest.raises(ValueError):
            service.addElementoDomanda(123, "Roma")
        with pytest.raises(ValueError):
            service.addElementoDomanda("Qual è la capitale d'Italia?", 456)
            
class TestGetElementoDomandaService:
    
    def test_get_elemento_domanda_by_id(self):
        """Test per il servizio di recupero di un elemento domanda."""
        mockPort = mock.Mock(spec=GetElementoDomandaPort)
        service = GetElementoDomandaService(mockPort)
        
        id = 1
        mockPort.getElementoDomandaById.return_value = {"id": id, "domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"}
        
        result = service.getElementoDomandaById(id)
        
        mockPort.getElementoDomandaById.assert_called_once_with(id)
        assert result == mockPort.getElementoDomandaById.return_value
        
    def test_get_elemento_domanda_by_id_invalid(self):
        """Test per il servizio di recupero di un elemento domanda con ID non valido."""
        mockPort = mock.Mock(spec=GetElementoDomandaPort)
        service = GetElementoDomandaService(mockPort)
        
        with pytest.raises(ValueError):
            service.getElementoDomandaById("1")
            
class TestGetAllElementiDomandaService:
    
    def test_get_all_elementi_domanda(self):
        """Test per il servizio di recupero di tutti gli elementi domanda."""
        mockPort = mock.Mock(spec=GetAllElementiDomandaPort)
        service = GetAllElementiDomandaService(mockPort)
        
        mockPort.getAllElementiDomanda.return_value = [
            {"id": 1, "domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"},
            {"id": 2, "domanda": "Qual è la capitale della Francia?", "risposta": "Parigi"}
        ]
        
        result = service.getAllElementiDomanda()
        
        mockPort.getAllElementiDomanda.assert_called_once()
        assert result == mockPort.getAllElementiDomanda.return_value
        
    def test_get_all_elementi_domanda_empty(self):
        """Test per il servizio di recupero di tutti gli elementi domanda quando non ci sono elementi."""
        mockPort = mock.Mock(spec=GetAllElementiDomandaPort)
        service = GetAllElementiDomandaService(mockPort)
        
        mockPort.getAllElementiDomanda.return_value = []
        
        result = service.getAllElementiDomanda()
        
        mockPort.getAllElementiDomanda.assert_called_once()
        assert result == mockPort.getAllElementiDomanda.return_value
        assert len(result) == 0
        
class TestDeleteElementiDomandaService:
    
    def test_delete_elementi_domanda_by_id(self):
        """Test per il servizio di eliminazione di uno o più elementi domanda."""
        mockPort = mock.Mock(spec=DeleteElementiDomandaPort)
        service = DeleteElementiDomandaService(mockPort)
        
        ids = {1, 2}
        mockPort.deleteElementiDomandaById.return_value = True
        
        result = service.deleteElementiDomandaById(ids)
        
        mockPort.deleteElementiDomandaById.assert_called_once_with(ids)
        assert result == mockPort.deleteElementiDomandaById.return_value
        
    def test_delete_elementi_domanda_by_id_invalid(self):
        """Test per il servizio di eliminazione di uno o più elementi domanda con ID non validi."""
        mockPort = mock.Mock(spec=DeleteElementiDomandaPort)
        service = DeleteElementiDomandaService(mockPort)
        
        with pytest.raises(ValueError):
            service.deleteElementiDomandaById(set())
        with pytest.raises(ValueError):
            service.deleteElementiDomandaById({1, "2"})

class TestUpdateElementoDomandaService:
    
    def test_update_elemento_domanda_by_id(self):
        """Test per il servizio di aggiornamento di un elemento domanda."""
        mockPort = mock.Mock(spec=UpdateElementoDomandaPort)
        service = UpdateElementoDomandaService(mockPort)
        
        id = 1
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        mockPort.updateElementoDomandaById.return_value = True
        
        result = service.updateElementoDomandaById(id, domanda, risposta)
        
        mockPort.updateElementoDomandaById.assert_called_once_with(id, domanda, risposta)
        assert result == mockPort.updateElementoDomandaById.return_value
        
    def test_update_elemento_domanda_by_id_invalid(self):
        """Test per il servizio di aggiornamento di un elemento domanda con dati non validi."""
        mockPort = mock.Mock(spec=UpdateElementoDomandaPort)
        service = UpdateElementoDomandaService(mockPort)
        
        with pytest.raises(ValueError):
            service.updateElementoDomandaById("1", "Qual è la capitale d'Italia?", "Roma")
        with pytest.raises(ValueError):
            service.updateElementoDomandaById(1, "", "Roma")
        with pytest.raises(ValueError):
            service.updateElementoDomandaById(1, "Qual è la capitale d'Italia?", "")
        with pytest.raises(ValueError):
            service.updateElementoDomandaById(1, 123, "Roma")
        with pytest.raises(ValueError):
            service.updateElementoDomandaById(1, "Qual è la capitale d'Italia?", 456)