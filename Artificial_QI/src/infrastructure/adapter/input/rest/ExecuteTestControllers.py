from flask import request, jsonify, Blueprint
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import ExecuteTestUseCase

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__)

class ExecuteTestController:
    def __init__(self, useCase: ExecuteTestUseCase = Provide[RootContainer.executeTestContainer.ExecuteTestService]):
        self.__useCase = useCase
        executeTest_blueprint.add_url_rule('/executeTest', view_func=self.executeTest, methods=['GET'])

    @inject
    def executeTest(self):
        try:
            risultato = self.__useCase.executeTest()
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify("Si è verificato un errore nel server, riprova pià tardi"), 500)
        except Exception as e:
            print(e)
            return jsonify("Si è verificato un errore nel server, riprova pià tardi"), 500