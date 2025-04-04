from flask import request, jsonify, Blueprint
from flask.views import MethodView
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import (GetRisultatoTestUseCase, 
                                         GetAllRisultatiTestUseCase, 
                                         GetRisultatoSingolaDomandaUseCase)


risultatoTest_blueprint = Blueprint('risultatoTest_blueprint', __name__)
        
class GetRisultatoTestController(MethodView):
    def __init__(self, useCase: GetRisultatoTestUseCase = Provide[RootContainer.risultatoTestContainer.GetRisultatoTestService]):
        self.__useCase = useCase

    @inject
    def get(self, id: int):
        try:
            risultato = self.__useCase.getRisultatoTestById(id)
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except ValueError as e:
            return jsonify({"message": str(e)}), 400
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
risultatoTest_blueprint.add_url_rule('/risultati/<int:id>', view_func=GetRisultatoTestController.as_view('get_risultato_test_by_id'))

class GetAllRisultatiTestController(MethodView):
    def __init__(self, useCase: GetAllRisultatiTestUseCase = Provide[RootContainer.risultatoTestContainer.GetAllRisultatiTestService]):
        self.__useCase = useCase

    @inject
    def get(self):
        try:
            risultati = self.__useCase.getAllRisultatiTest()
            return (jsonify([risultato.serializeForList() for risultato in risultati]), 200) \
                if risultati is not None else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
risultatoTest_blueprint.add_url_rule('/risultati', view_func=GetAllRisultatiTestController.as_view('get_all_risultati_test'))

class GetRisultatoSingolaDomandaController(MethodView):
    def __init__(self, useCase: GetRisultatoSingolaDomandaUseCase = Provide[RootContainer.risultatoTestContainer.GetRisultatoSingolaDomandaService]):
        self.__useCase = useCase

    @inject
    def get(self, id: int):
        try:
            risultato = self.__useCase.getRisultatoSingolaDomandaTestById(id)
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
risultatoTest_blueprint.add_url_rule('/risultatiDomanda/<int:id>', view_func=GetRisultatoSingolaDomandaController.as_view('get_risultato_singola_domanda_test_by_id'))