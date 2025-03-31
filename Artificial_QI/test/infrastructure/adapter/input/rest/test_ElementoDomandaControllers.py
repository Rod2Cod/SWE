from unittest import mock
import pytest
from flask import url_for
from application import create_app
from src.application.ports.input import AddElementoDomandaUseCase, GetElementoDomandaUseCase, GetAllElementiDomandaUseCase, DeleteElementiDomandaUseCase, UpdateElementoDomandaUseCase
from src.domain import ElementoDomanda

@pytest.fixture()
def app():
    """Funzione di setup per l'app Flask."""
    app = create_app(True)
    yield app
    app.container.unwire()
    
@pytest.fixture()
def client(app):
    return app.test_client()

class TestAddElementoDomandaController:
    def test_add_elemento_domanda(self, client, app):
        """Test per il controller di aggiunta di un elemento domanda."""
        mockUseCase = mock.Mock(spec=AddElementoDomandaUseCase)
        mockUseCase.addElementoDomanda.return_value = {"id": 1, "domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"}
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST per aggiungere un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json={"domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"})

        assert response.status_code == 201
        assert response.json["message"] == "Elemento aggiunto con successo"
        
    def test_add_elemento_domanda_invalid(self, client, app):
        """Test per il controller di aggiunta di un elemento domanda con dati non validi."""
        mockUseCase = mock.Mock(spec=AddElementoDomandaUseCase)
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST con dati non validi
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json={"risposta": "Roma"})
            
        assert response.status_code == 400
        assert response.json["message"] == "Domanda e risposta sono campi obbligatori."
        
    def test_add_elemento_domanda_server_error(self, client, app):
        """Test per il controller di aggiunta di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=AddElementoDomandaUseCase)
        mockUseCase.addElementoDomanda.return_value = None
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST per aggiungere un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json={"domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"})

        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"     
        
class TestGetElementoDomandaController:
    def test_get_elemento_domanda_by_id(self, client, app):
        """Test per il controller di recupero di un elemento domanda."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        mockUseCase.getElementoDomandaById.return_value = ElementoDomanda(id=1, domanda="Qual è la capitale d'Italia?", risposta="Roma")
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare un elemento domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id=1))
            
        assert response.status_code == 200
        assert response.json["id"] == 1
        assert response.json["domanda"] == "Qual è la capitale d'Italia?"
        assert response.json["risposta"] == "Roma"
        
    def test_get_elemento_domanda_by_id_invalid(self, client, app):
        """Test per il controller di recupero di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET con ID non valido
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id="invalid"))
            
        assert response.status_code == 400
        assert "ID non valido" in response.json.values()
        
    def test_get_elemento_domanda_by_id_server_error(self, client, app):
        """Test per il controller di recupero di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        mockUseCase.getElementoDomandaById.return_value = None
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare un elemento domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id=1))
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        
class TestGetAllElementiDomandaController:
    def test_get_all_elementi_domanda(self, client, app):
        """Test per il controller di recupero di tutti gli elementi domanda."""
        mockUseCase = mock.Mock(spec=GetAllElementiDomandaUseCase)
        mockUseCase.getAllElementiDomanda.return_value = [ElementoDomanda(id=1, domanda="Qual è la capitale d'Italia?", risposta="Roma"), 
                                                          ElementoDomanda(id=2, domanda="Qual è la capitale della Francia?", risposta="Parigi")]
        
        with app.container.elementoDomandaContainer.GetAllElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare tutti gli elementi domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_all_elementi_domanda'))
            
        assert response.status_code == 200
        assert response.json[0]["id"] == 1
        assert response.json[0]["domanda"] == "Qual è la capitale d'Italia?"
        assert response.json[0]["risposta"] == "Roma"
        assert response.json[1]["id"] == 2
        assert response.json[1]["domanda"] == "Qual è la capitale della Francia?"
        assert response.json[1]["risposta"] == "Parigi"
        assert len(response.json) == 2
        
    def test_get_all_elementi_domanda_empty(self, client, app):
        """Test per il controller di recupero di tutti gli elementi domanda quando non ci sono elementi."""
        mockUseCase = mock.Mock(spec=GetAllElementiDomandaUseCase)
        mockUseCase.getAllElementiDomanda.return_value = []
        
        with app.container.elementoDomandaContainer.GetAllElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare tutti gli elementi domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_all_elementi_domanda'))
            
        assert response.status_code == 200
        assert len(response.json) == 0
        
class TestDeleteElementiDomandaController:
    def test_delete_elementi_domanda_by_id(self, client, app):
        """Test per il controller di eliminazione di un elemento domanda."""
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        mockUseCase.deleteElementiDomandaById.return_value = True
        
        app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta DELETE per eliminare un elemento domanda
            response = client.delete(url_for('elementoDomanda_blueprint.deleteElementiDomandaById'), json={"ids": [1, 2, 3]})
            
        assert response.status_code == 200
        assert response.json["message"] == "Elemento eliminato con successo"
        
    def test_delete_elementi_domanda_by_id_invalid(self, client, app):
        """Test per il controller di eliminazione di un elemento domanda con ID non valido."""
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        
        app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta DELETE con ID non valido
            response = client.delete(url_for('elementoDomanda_blueprint.deleteElementiDomandaById'), json={})
            response2 = client.delete(url_for('elementoDomanda_blueprint.deleteElementiDomandaById'))
            
        assert response.status_code == 400
        assert response.json["message"] == "La lista di id è un campo obbligatorio."
        assert response2.status_code == 400
        assert response2.json["message"] == "La lista di id è un campo obbligatorio."
        
    def test_delete_elementi_domanda_by_id_not_found(self, client, app):
        """Test per il controller di eliminazione di un elemento domanda non trovato."""
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        mockUseCase.deleteElementiDomandaById.return_value = False
        
        app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta DELETE per eliminare un elemento domanda non trovato
            response = client.delete(url_for('elementoDomanda_blueprint.deleteElementiDomandaById'), json={"ids": [999]})
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        
class TestUpdateElementoDomandaController:
    def test_update_elemento_domanda_by_id(self, client, app):
        """Test per il controller di aggiornamento di un elemento domanda."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        mockUseCase.updateElementoDomandaById.return_value = True
        
        app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta PUT per aggiornare un elemento domanda
            response = client.put(url_for('elementoDomanda_blueprint.updateElementoDomandaById', id=1), json={"domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"})
            
        assert response.status_code == 200
        assert response.json["message"] == "Elemento aggiornato con successo"
        
    def test_update_elemento_domanda_by_id_invalid(self, client, app):
        """Test per il controller di aggiornamento di un elemento domanda con ID non valido."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        
        app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta PUT con ID non valido
            response = client.put(url_for('elementoDomanda_blueprint.updateElementoDomandaById', id="invalid"), json={"domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"})
            
        assert response.status_code == 400
        assert response.json["message"] == "Id deve essere un intero."
        
    def test_update_elemento_domanda_by_id_not_found(self, client, app):
        """Test per il controller di aggiornamento di un elemento domanda non trovato."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        mockUseCase.updateElementoDomandaById.return_value = False
        
        app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta PUT per aggiornare un elemento domanda non trovato
            response = client.put(url_for('elementoDomanda_blueprint.updateElementoDomandaById', id=999), json={"domanda": "Qual è la capitale d'Italia?", "risposta": "Roma"})
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"