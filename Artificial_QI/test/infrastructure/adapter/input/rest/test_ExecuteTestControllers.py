from unittest.mock import Mock, patch
import pytest
from flask import url_for
from application import create_app
from src.application.ports.input import ExecuteTestUseCase, GetTestStatusUseCase
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from datetime import date

@pytest.fixture()
def app():
    """Funzione di setup per l'app Flask."""
    app = create_app(True)
    yield app
    app.container.unwire()
    
@pytest.fixture()
def client(app):
    return app.test_client()

class TestExecuteTestController:
    def test_execute_test(self, client, app):
        """Test per il controller di esecuzione del test."""
        
        # Mocking the ExecuteTestUseCase
        mock_use_case = Mock(spec=ExecuteTestUseCase)
        mock_status_use_case = Mock(spec=GetTestStatusUseCase)
        app.container.executeTestContainer.GetTestStatusService.override(mock_status_use_case)
        app.container.executeTestContainer.ExecuteTestService.override(mock_use_case)

        # Mocking the return value of executeTest method
        result = RisultatoTest(
            id=1,
            score=7.5,
            LLM="GPT-3",
            dataEsecuzione=date.today(),
            nomeSet="Test 1",
            risultatiDomande={
                RisultatoSingolaDomanda(
                    id=1,
                    domanda="Domanda 1",
                    risposta="Risposta 1",
                    rispostaLLM="Risposta LLM",
                    score=5.5, 
                    metriche={"metrica1": 0.9, "metrica2": 8.6}
                ),
                RisultatoSingolaDomanda(
                    id=1,
                    domanda="Domanda 2",
                    risposta="Risposta 2",
                    rispostaLLM="Risposta LLM",
                    score=6.3, 
                    metriche={"metrica1": 4.7, "metrica2": 6.9}
                )
            }
        )
        
        mock_use_case.executeTest.return_value = None
        mock_status_use_case.getTestStatus.return_value = {
            "starting": False,
            "in_progress": True,
            "completed": 1,
            "total": 2,
            "percentage": 50,
            "id_risultato": None
        }
        
        def fake_thread_start():
        # simula il codice run_test_in_thread(...)
            mock_use_case.executeTest()

        with patch("src.infrastructure.adapter.input.rest.ExecuteTestControllers.Thread") as mock_thread, \
            patch("src.infrastructure.adapter.input.rest.ExecuteTestControllers.time.sleep") as mock_sleep:
            
            mock_thread_instance = mock_thread.return_value
            mock_thread_instance.start.side_effect = fake_thread_start
                
            with app.test_request_context():
                # Sending a POST request to the endpoint
                response = client.post(url_for('executeTest_blueprint.execute_test'))
                
                mock_thread_instance.start.assert_called_once()
                mock_sleep.assert_called_once_with(1)

        # Asserting the response status code and data
        assert response.status_code == 200
        assert response.json == {"message": "Test avviato con successo"}
        mock_use_case.executeTest.assert_called_once()
        mock_status_use_case.getTestStatus.assert_called_once()

    @pytest.mark.parametrize("error", [{"in_progress": False}, Exception()])
    def test_execute_test_error(self, client, app, error):
        # Mocking the ExecuteTestUseCaseoverride
        mock_use_case = Mock(spec=ExecuteTestUseCase)
        mock_status_use_case = Mock(spec=GetTestStatusUseCase)
        app.container.executeTestContainer.GetTestStatusService.override(mock_status_use_case)
        app.container.executeTestContainer.ExecuteTestService.override(mock_use_case)
        
        if error is Exception:
            mock_use_case.executeTest.side_effect = error
        else:
            mock_status_use_case.getTestStatus.return_value = error
        
        def fake_thread_start():
        # simula il codice run_test_in_thread(...)
            mock_use_case.executeTest()

        with patch("src.infrastructure.adapter.input.rest.ExecuteTestControllers.Thread") as mock_thread, \
            patch("src.infrastructure.adapter.input.rest.ExecuteTestControllers.time.sleep") as mock_sleep:
            
            mock_thread_instance = mock_thread.return_value
            mock_thread_instance.start.side_effect = fake_thread_start
                
            with app.test_request_context():
                # Sending a POST request to the endpoint
                response = client.post(url_for('executeTest_blueprint.execute_test'))
                
                mock_thread_instance.start.assert_called_once()
                mock_sleep.assert_called_once_with(1)

        # Asserting the response status code and data
        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}
        mock_use_case.executeTest.assert_called_once()
        mock_status_use_case.getTestStatus.assert_called_once()
        
class TestGetTestStatusController:
    def test_get_test_status(self, client, app):
        # Mocking the GetTestStatusUseCase
        mock_use_case = Mock(spec=GetTestStatusUseCase)
        app.container.executeTestContainer.GetTestStatusService.override(mock_use_case)

        # Mocking the return value of getTestStatus method
        mock_use_case.getTestStatus.return_value = {
            "starting": False,
            "in_progress": False,
            "completed": 0,
            "total": 0,
            "percentage": 0,
            "id_risultato": None
        }

        with app.test_request_context():
            # Sending a GET request to the endpoint
            response = client.get(url_for('executeTest_blueprint.test_status'))

        # Asserting the response status code and data
        assert response.status_code == 200
        assert response.json == mock_use_case.getTestStatus.return_value
        mock_use_case.getTestStatus.assert_called_once()
        
    def test_get_test_status_server_error(self, client, app):
        # Mocking the GetTestStatusUseCase
        mock_use_case = Mock(spec=GetTestStatusUseCase)
        app.container.executeTestContainer.GetTestStatusService.override(mock_use_case)

        # Mocking the return value of getTestStatus method
        mock_use_case.getTestStatus.side_effect = Exception("Errore di test")

        with app.test_request_context():
            # Sending a GET request to the endpoint
            response = client.get(url_for('executeTest_blueprint.test_status'))

        # Asserting the response status code and data
        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}
        mock_use_case.getTestStatus.assert_called_once()