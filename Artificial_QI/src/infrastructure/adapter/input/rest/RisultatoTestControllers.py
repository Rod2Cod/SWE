from flask import request, jsonify, Blueprint
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import (GetRisultatoTestUseCase, 
                                         GetAllRisultatiTestUseCase, 
                                         GetAllRisultatiSingoleDomandeUseCase, 
                                         GetRisultatoSingolaDomandaUseCase)


risultatoTest_blueprint = Blueprint('risultatoTest_blueprint', __name__)
        
class GetRisultatoTestController:
    def __init__(self, useCase: GetRisultatoTestUseCase = Provide[RootContainer.risultatoTestContainer.GetRisultatoTestService]):
        self.__useCase = useCase
        risultatoTest_blueprint.add_url_rule('/risultati/<int:id>', view_func=self.getRisultatoTestById, methods=['GET'])

    @inject
    def getRisultatoTestById(self, id: int):
        try:
            risultato = self.__useCase.getRisultatoTestById(id)
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500

class GetAllRisultatiTestController:
    def __init__(self, useCase: GetAllRisultatiTestUseCase = Provide[RootContainer.risultatoTestContainer.GetAllRisultatiTestService]):
        self.__useCase = useCase
        risultatoTest_blueprint.add_url_rule('/risultati', view_func=self.getAllRisultatiTest, methods=['GET'])

    @inject
    def getAllRisultatiTest(self):
        try:
            risultati = self.__useCase.getAllRisultatiTest()
            return (jsonify([risultato.serializeForList() for risultato in risultati]), 200) \
                if risultati else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500

class GetAllRisultatiSingoleDomandeController:
    def __init__(self, useCase: GetAllRisultatiSingoleDomandeUseCase = Provide[RootContainer.risultatoTestContainer.GetAllRisultatiSingoleDomandeService]):
        self.__useCase = useCase
        risultatoTest_blueprint.add_url_rule('/risultati/<int:id>/domande', view_func=self.getAllRisultatiSingoleDomandeByTestId, methods=['GET'])

    @inject
    def getAllRisultatiSingoleDomandeByTestId(self, id: int):
        try:
            risultati = self.__useCase.getAllRisultatiSingoleDomandeByTestId(id)
            return (jsonify([risultato.serialize() for risultato in risultati]), 200) \
                if risultati else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except Exception as e:
            print(e)
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500

class GetRisultatoSingolaDomandaController:
    def __init__(self, useCase: GetRisultatoSingolaDomandaUseCase = Provide[RootContainer.risultatoTestContainer.GetRisultatoSingolaDomandaService]):
        self.__useCase = useCase
        risultatoTest_blueprint.add_url_rule('/risultati/domande/<int:id>', view_func=self.getRisultatoSingolaDomandaById, methods=['GET'])

    @inject
    def getRisultatoSingolaDomandaById(self, id: int):
        try:
            risultato = self.__useCase.getRisultatoSingolaDomandaTestById(id)
            return (jsonify(risultato.serialize()), 200) \
                if risultato else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500