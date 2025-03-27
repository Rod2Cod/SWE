from flask import request, jsonify, Blueprint
from werkzeug.exceptions import BadRequest
from pydantic import ValidationError

from src.application.ports.input import ExecuteTestUseCase, ExecuteTestOnSetUseCase

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__, url_prefix='/api')

class ExecuteTestController:
    def __init__(self, useCase: ExecuteTestUseCase):
        self.useCase = useCase

    @executeTest_blueprint.route('/executeTest', methods=['POST'])
    def executeTest(self):
        try:
            risultato = self.useCase.executeTest()
            return jsonify(self.useCase.executeTest().serialize()), 200 if risultato else jsonify("Si è verificato un errore nel server, riprova pià tardi"), 500
        except Exception as e:
            return jsonify("Si è verificato un errore nel server, riprova pià tardi"), 500
        
class ExecuteTestOnSetController:
    def __init__(self, useCase: ExecuteTestOnSetUseCase):
        self.useCase = useCase

    @executeTest_blueprint.route('/executeTestOnSet', methods=['POST'])
    def executeTestOnSet(self):
        
        try:
            nomeSet = request.json['nomeSet']
            return jsonify(self.useCase.executeTestOnSet(nomeSet).serialize()), 200
        except ValidationError as e:
            return jsonify(e.errors(), 400)
        except Exception as e:
            return jsonify("Si è verificato un errore nel server, riprova pià tardi"), 500
        except BadRequest:
            return jsonify("Nome del set obbligatorio.", 400)