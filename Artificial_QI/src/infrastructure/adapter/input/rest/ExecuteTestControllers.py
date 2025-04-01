from flask import request, jsonify, Blueprint
from flask.views import MethodView
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import ExecuteTestUseCase

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__)

class ExecuteTestController(MethodView):
    def __init__(self, useCase: ExecuteTestUseCase = Provide[RootContainer.executeTestContainer.ExecuteTestService]):
        self.__useCase = useCase

    @inject
    def post(self):
        try:
            risultato = self.__useCase.executeTest()
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except Exception:
            return jsonify({"message": f"Si è verificato un errore nel server, riprova più tardi" }), 500
        
executeTest_blueprint.add_url_rule('/executeTest', view_func=ExecuteTestController.as_view('execute_test'))