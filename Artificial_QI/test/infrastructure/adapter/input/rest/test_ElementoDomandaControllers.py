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
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        id = 1
        mockUseCase.addElementoDomanda.return_value = {"id": id, "domanda": domanda, "risposta": risposta}
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST per aggiungere un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json={"domanda": domanda, "risposta": risposta})

        assert response.status_code == 201
        assert response.json["message"] == "Elemento aggiunto con successo"
        mockUseCase.addElementoDomanda.assert_called_once_with(domanda, risposta)
    
    @pytest.mark.parametrize("json", [{"risposta": "Roma"}, {"domanda": "Qual è la capitale d'Italia?"}, {}, None])
    def test_add_elemento_domanda_invalid(self, client, app, json):
        """Test per il controller di aggiunta di un elemento domanda con dati non validi."""
        mockUseCase = mock.Mock(spec=AddElementoDomandaUseCase)
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST con dati non validi
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json=json)
            
        assert response.status_code == 400
        assert response.json["message"] == "Domanda e risposta sono campi obbligatori."
        mockUseCase.addElementoDomanda.assert_not_called()
        
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_add_elemento_domanda_server_error(self, client, app, error):
        """Test per il controller di aggiunta di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=AddElementoDomandaUseCase)
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        if not error:
            mockUseCase.addElementoDomanda.return_value = None
        else:
            mockUseCase.addElementoDomanda.side_effect = error
        
        with app.container.elementoDomandaContainer.AddElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta POST per aggiungere un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.add_elemento_domanda'), json={"domanda": domanda, "risposta": risposta})

        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        mockUseCase.addElementoDomanda.assert_called_once_with(domanda, risposta)
        
class TestGetElementoDomandaController:
    def test_get_elemento_domanda_by_id(self, client, app):
        """Test per il controller di recupero di un elemento domanda."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        id = 1
        mockUseCase.getElementoDomandaById.return_value = ElementoDomanda(id=id, domanda=domanda, risposta=risposta)
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare un elemento domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id=id))
            
        assert response.status_code == 200
        assert response.json["id"] == id
        assert response.json["domanda"] == domanda
        assert response.json["risposta"] == risposta
        mockUseCase.getElementoDomandaById.assert_called_once_with(id)

    def test_get_elemento_domanda_by_id_not_found(self, client, app):
        """Test per il controller di recupero di un elemento domanda non trovato."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        id = 999
        mockUseCase.getElementoDomandaById.side_effect = ValueError("Elemento domanda non trovato")
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare un elemento domanda non trovato
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id=id))
            
        assert response.status_code == 400
        assert response.json["message"] == "Elemento domanda non trovato"
        mockUseCase.getElementoDomandaById.assert_called_once_with(id)
    
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_get_elemento_domanda_by_id_server_error(self, client, app, error):
        """Test per il controller di recupero di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=GetElementoDomandaUseCase)
        id = 1
        if not error:
            mockUseCase.getElementoDomandaById.return_value = None
        else:
            mockUseCase.getElementoDomandaById.side_effect = error
        
        with app.container.elementoDomandaContainer.GetElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare un elemento domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_elemento_domanda_by_id', id=id))
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        mockUseCase.getElementoDomandaById.assert_called_once_with(id)
        
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
        mockUseCase.getAllElementiDomanda.assert_called_once()
        
    def test_get_all_elementi_domanda_empty(self, client, app):
        """Test per il controller di recupero di tutti gli elementi domanda quando non ci sono elementi."""
        mockUseCase = mock.Mock(spec=GetAllElementiDomandaUseCase)
        mockUseCase.getAllElementiDomanda.return_value = {}
        
        with app.container.elementoDomandaContainer.GetAllElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare tutti gli elementi domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_all_elementi_domanda'))
            
        assert response.status_code == 200
        assert len(response.json) == 0
        mockUseCase.getAllElementiDomanda.assert_called_once()
        
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_get_all_elementi_domanda_server_error(self, client, app, error):
        """Test per il controller di recupero di tutti gli elementi domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=GetAllElementiDomandaUseCase)
        if not error:
            mockUseCase.getAllElementiDomanda.return_value = None
        else:
            mockUseCase.getAllElementiDomanda.side_effect = error
        
        with app.container.elementoDomandaContainer.GetAllElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta GET per recuperare tutti gli elementi domanda
                response = client.get(url_for('elementoDomanda_blueprint.get_all_elementi_domanda'))
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        mockUseCase.getAllElementiDomanda.assert_called_once()
        
class TestDeleteElementiDomandaController:
    def test_delete_elementi_domanda_by_id(self, client, app):
        """Test per il controller di eliminazione di un elemento domanda."""
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        mockUseCase.deleteElementiDomandaById.return_value = True
        ids = [1, 2, 3]
        
        with app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta DELETE per eliminare un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.delete_elementi_domanda'), json={"ids": ids})
            
        assert response.status_code == 200
        assert response.json["message"] == "Elementi eliminati con successo"
        mockUseCase.deleteElementiDomandaById.assert_called_once_with(ids)
    
    @pytest.mark.parametrize("json", [{}, None])
    def test_delete_elementi_domanda_by_id_invalid(self, client, app, json):
        """Test per il controller di eliminazione di un elemento domanda con ID non valido."""
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        
        with app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
            # Simulo una richiesta DELETE con ID non valido
                response = client.post(url_for('elementoDomanda_blueprint.delete_elementi_domanda'), json=json)
            
        assert response.status_code == 400
        assert response.json["message"] == "La lista di id è un campo obbligatorio."
        mockUseCase.deleteElementiDomandaById.assert_not_called()
    
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_delete_elementi_domanda_by_id_server_error(self, client, app, error):
        mockUseCase = mock.Mock(spec=DeleteElementiDomandaUseCase)
        ids = [1, 2, 3]
        if not error:
            mockUseCase.deleteElementiDomandaById.return_value = False
        else:
            mockUseCase.deleteElementiDomandaById.side_effect = error
        
        with app.container.elementoDomandaContainer.DeleteElementiDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta DELETE per eliminare un elemento domanda
                response = client.post(url_for('elementoDomanda_blueprint.delete_elementi_domanda'), json={"ids": ids})
                
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        mockUseCase.deleteElementiDomandaById.assert_called_once_with(ids)
        
class TestUpdateElementoDomandaController:
    def test_update_elemento_domanda_by_id(self, client, app):
        """Test per il controller di aggiornamento di un elemento domanda."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        mockUseCase.updateElementoDomandaById.return_value = True
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        id = 1
        
        with app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta PUT per aggiornare un elemento domanda
                response = client.put(url_for('elementoDomanda_blueprint.update_elemento_domanda', id=id), json={"domanda": domanda, "risposta": risposta})
            
        assert response.status_code == 200
        assert response.json["message"] == "Elemento aggiornato con successo"
        mockUseCase.updateElementoDomandaById.assert_called_once_with(id, domanda, risposta)
        
    @pytest.mark.parametrize("json", [{"risposta": "Roma"}, {"domanda": "Qual è la capitale d'Italia?"}, {}, None])
    def test_update_elemento_domanda_by_id_invalid(self, client, app, json):
        """Test per il controller di aggiornamento di un elemento domanda con ID non valido."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        id = 1
        
        with app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase):
            with app.test_request_context():
                # Simulo una richiesta PUT con ID non valido
                response = client.put(url_for('elementoDomanda_blueprint.update_elemento_domanda', id=id), json=json)
        
        assert response.status_code == 400
        assert response.json["message"] == "Domanda e risposta sono campi obbligatori."
        mockUseCase.updateElementoDomandaById.assert_not_called()
        
    def test_update_elemento_domanda_by_id_not_found(self, client, app):
        """Test per il controller di aggiornamento di un elemento domanda non trovato."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        mockUseCase.updateElementoDomandaById.side_effect = ValueError("Elemento domanda non trovato")
        id = 999
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        
        app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta PUT per aggiornare un elemento domanda non trovato
            response = client.put(url_for('elementoDomanda_blueprint.update_elemento_domanda', id=id), json={"domanda": domanda, "risposta": risposta})
            
        assert response.status_code == 400
        assert response.json["message"] == "Elemento domanda non trovato"
        mockUseCase.updateElementoDomandaById.assert_called_once_with(id, domanda, risposta)
        
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_update_elemento_domanda_by_id_server_error(self, client, app, error):
        """"Test per il controller di aggiornamento di un elemento domanda in presenza di un errore nel server."""
        mockUseCase = mock.Mock(spec=UpdateElementoDomandaUseCase)
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        id = 1

        if not error:
            mockUseCase.updateElementoDomandaById.return_value = False
        else:
            mockUseCase.updateElementoDomandaById.side_effect = error
            
        app.container.elementoDomandaContainer.UpdateElementoDomandaService.override(mockUseCase)
        with app.test_request_context():
            # Simulo una richiesta PUT per aggiornare un elemento domanda
            response = client.put(url_for('elementoDomanda_blueprint.update_elemento_domanda', id=id), json={"domanda": domanda, "risposta": risposta})
            
        assert response.status_code == 500
        assert response.json["message"] == "Si è verificato un errore nel server, riprova più tardi"
        mockUseCase.updateElementoDomandaById.assert_called_once_with(id, domanda, risposta)