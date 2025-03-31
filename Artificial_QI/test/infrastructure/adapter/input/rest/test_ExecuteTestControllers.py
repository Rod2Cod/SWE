from unittest import mock
import pytest
from flask import url_for
from application import create_app
from src.application.ports.input import ExecuteTestUseCase
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
    def test_execute_test(self,client,app):
        # Mocking the ExecuteTestUseCase
        mock_use_case = mock.Mock(spec=ExecuteTestUseCase)
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
        mock_use_case.executeTest.return_value = result

        with app.test_request_context():
            # Sending a POST request to the endpoint
            response = client.post(url_for('executeTest_blueprint.execute_test'))

        # Asserting the response status code and data
        assert response.status_code == 200
        assert response.json == result.serialize()

    def test_execute_test_no_result(self, client, app):
        # Mocking the ExecuteTestUseCase
        mock_use_case = mock.Mock(spec=ExecuteTestUseCase)
        app.container.executeTestContainer.ExecuteTestService.override(mock_use_case)

        # Mocking the return value of executeTest method to return None
        mock_use_case.executeTest.return_value = None

        with app.test_request_context():
            # Sending a POST request to the endpoint
            response = client.post(url_for('executeTest_blueprint.execute_test'))

        # Asserting the response status code and data
        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}

    def test_execute_test_error(self, client, app):
        # Mocking the ExecuteTestUseCase
        mock_use_case = mock.Mock(spec=ExecuteTestUseCase)
        app.container.executeTestContainer.ExecuteTestService.override(mock_use_case)

        # Mocking the return value of executeTest method to raise an exception
        mock_use_case.executeTest.side_effect = Exception()

        with app.test_request_context():
            # Sending a POST request to the endpoint
            response = client.post(url_for('executeTest_blueprint.execute_test'))

        # Asserting the response status code and data
        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}
    