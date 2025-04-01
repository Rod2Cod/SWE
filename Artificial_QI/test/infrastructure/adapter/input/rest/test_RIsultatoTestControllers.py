from unittest import mock
import pytest
from flask import url_for
from application import create_app
from src.application.ports.input import GetRisultatoTestUseCase, GetAllRisultatiTestUseCase, GetRisultatoSingolaDomandaUseCase
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

class TestGetRisultatoTestControllers:
    def test_get_risultato_test_by_id(self,client,app):
        # Mocking the GetRisultatoTestUseCase
        mock_use_case = mock.Mock(spec=GetRisultatoTestUseCase)
        app.container.risultatoTestContainer.GetRisultatoTestService.override(mock_use_case)
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
        mock_use_case.getRisultatoTestById.return_value = result

        with app.test_request_context():
            # Sending a GET request to the endpoint
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_test_by_id', id=1))

        assert response.status_code == 200
        assert response.json == result.serialize()

    def test_get_risultato_test_by_id_not_found(self,client,app):
        mock_use_case = mock.Mock(spec=GetRisultatoTestUseCase)
        app.container.risultatoTestContainer.GetRisultatoTestService.override(mock_use_case)
        mock_use_case.getRisultatoTestById.side_effect = ValueError("Test non trovato")

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_test_by_id', id=999))

        assert response.status_code == 400
        assert response.json == "Test non trovato"

    def test_get_risultato_test_by_id_server_error(self,client,app):
        mock_use_case = mock.Mock(spec=GetRisultatoTestUseCase)
        app.container.risultatoTestContainer.GetRisultatoTestService.override(mock_use_case)
        mock_use_case.getRisultatoTestById.side_effect = Exception("Errore interno del server")

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_test_by_id', id=1))

        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}

class TestGetAllRisultatiTestController:
    def test_get_all_risultati_test(self,client,app):
        # Mocking the GetAllRisultatiTestUseCase
        mock_use_case = mock.Mock(spec=GetAllRisultatiTestUseCase)
        app.container.risultatoTestContainer.GetAllRisultatiTestService.override(mock_use_case)
        result = {
            RisultatoTest(
                id=1,
                score=7.5,
                LLM="GPT-3",
                dataEsecuzione=date.today(),
                nomeSet="Test 1",
                risultatiDomande={}
            ),
            RisultatoTest(
                id=2,
                score=8.0,
                LLM="GPT-4",
                dataEsecuzione=date.today(),
                nomeSet="Test 2",
                risultatiDomande={}
            )
        }
        mock_use_case.getAllRisultatiTest.return_value = result

        with app.test_request_context():
            # Sending a GET request to the endpoint
            response = client.get(url_for('risultatoTest_blueprint.get_all_risultati_test'))

        assert response.status_code == 200
        assert response.json == [risultato.serializeForList() for risultato in result]

    def test_get_all_risultati_test_empty(self,client,app):
        mock_use_case = mock.Mock(spec=GetAllRisultatiTestUseCase)
        app.container.risultatoTestContainer.GetAllRisultatiTestService.override(mock_use_case)
        mock_use_case.getAllRisultatiTest.return_value = None

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_all_risultati_test'))

        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}

    def test_get_all_risultati_server_error(self,client,app):
        mock_use_case = mock.Mock(spec=GetAllRisultatiTestUseCase)
        app.container.risultatoTestContainer.GetAllRisultatiTestService.override(mock_use_case)

        mock_use_case.getAllRisultatiTest.side_effect = Exception()

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_all_risultati_test'))

        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}

class TestGetRisultatoSingolaDomandaController:
    def test_get_risultato_singola_domanda_by_id(self,client,app):
        # Mocking the GetRisultatoSingolaDomandaUseCase
        mock_use_case = mock.Mock(spec=GetRisultatoSingolaDomandaUseCase)
        app.container.risultatoTestContainer.GetRisultatoSingolaDomandaService.override(mock_use_case)
        result = RisultatoSingolaDomanda(
            id=1,
            domanda="Domanda 1",
            risposta="Risposta 1",
            rispostaLLM="Risposta LLM",
            score=5.5, 
            metriche={"metrica1": 0.9, "metrica2": 8.6}
        )
        mock_use_case.getRisultatoSingolaDomandaTestById.return_value = result

        with app.test_request_context():
            # Sending a GET request to the endpoint
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_singola_domanda_test_by_id', id=1))

        assert response.status_code == 200
        assert response.json == result.serialize()

    def test_get_risultato_singola_domanda_by_id_invalid(self,client,app):
        mock_use_case = mock.Mock(spec=GetRisultatoSingolaDomandaUseCase)
        app.container.risultatoTestContainer.GetRisultatoSingolaDomandaService.override(mock_use_case)
        mock_use_case.getRisultatoSingolaDomandaTestById.side_effect = ValueError("ID non valido")

        with app.test_request_context():
            with pytest.raises(ValueError):
                _ = client.get(url_for('risultatoTest_blueprint.get_risultato_singola_domanda_test_by_id', id="invalid"))


    def test_get_risultato_singola_domanda_by_id_not_found(self,client,app):
        mock_use_case = mock.Mock(spec=GetRisultatoSingolaDomandaUseCase)
        app.container.risultatoTestContainer.GetRisultatoSingolaDomandaService.override(mock_use_case)
        mock_use_case.getRisultatoSingolaDomandaTestById.side_effect = ValueError("Test non trovato")

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_singola_domanda_test_by_id', id=999))

        assert response.status_code == 400
        assert response.json == "Test non trovato"

    def test_get_risultato_singola_domanda_by_id_server_error(self,client,app):
        mock_use_case = mock.Mock(spec=GetRisultatoSingolaDomandaUseCase)
        app.container.risultatoTestContainer.GetRisultatoSingolaDomandaService.override(mock_use_case)
        mock_use_case.getRisultatoSingolaDomandaTestById.side_effect = Exception("Errore interno del server")

        with app.test_request_context():
            response = client.get(url_for('risultatoTest_blueprint.get_risultato_singola_domanda_test_by_id', id=1))
        
        assert response.status_code == 500
        assert response.json == {"message": "Si è verificato un errore nel server, riprova più tardi"}