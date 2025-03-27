from flask import request, jsonify, Blueprint
from werkzeug.exceptions import BadRequest
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import (AddElementoDomandaUseCase, 
                                         GetElementoDomandaUseCase, 
                                         GetAllElementiDomandaUseCase, 
                                         DeleteElementiDomandaUseCase, 
                                         UpdateElementoDomandaUseCase)


elementoDomanda_blueprint = Blueprint('elementoDomanda_blueprint', __name__)

class AddElementoDomandaController:
    def __init__(self, useCase: AddElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.AddElementoDomandaService]):
        self.__useCase = useCase
        elementoDomanda_blueprint.add_url_rule('/domande', view_func=self.addElementoDomanda, methods=['POST'])

    @inject
    def addElementoDomanda(self):
        try:
            # prendo domanda e risposta dal body della richiesta, se non presenti ritorna BadRequest
            domanda = request.json['domanda']
            risposta = request.json['risposta']
            elemento = self.__useCase.addElementoDomanda(domanda, risposta)
            # se errore da adapter in poi
            return (jsonify("Elemento aggiunto con successo"), 201) \
                if elemento else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        # se errore di validazione nella business logic
        except ValueError as e:
            return jsonify(str(e)), 400
        except BadRequest:
            return jsonify("Domanda e risposta sono campi obbligatori."), 400
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500
   
class GetElementoDomandaController:
    def __init__(self, useCase: GetElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.GetElementoDomandaService]):
        self.__useCase = useCase
        elementoDomanda_blueprint.add_url_rule('/domande/<int:id>', view_func=self.getElementoDomandaById, methods=['GET'])

    @inject
    def getElementoDomandaById(self, id: int):
        try:
            elemento = self.__useCase.getElementoDomandaById(id)
            return (jsonify(elemento.serialize()), 200) \
                if elemento else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except Exception as e:
            return jsonify(str(e)), 500
    
class GetAllElementiDomandaController:
    def __init__(self, useCase: GetAllElementiDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.GetAllElementiDomandaService]):
        self.__useCase = useCase
        elementoDomanda_blueprint.add_url_rule('/domande', view_func=self.getAllElementiDomanda, methods=['GET'])

    @inject
    def getAllElementiDomanda(self):
        try:
            elementi = self.__useCase.getAllElementiDomanda()
            # Se elementi è set vuoto lo ritorna, altrimento se è None ritorna errore 500
            return (jsonify([elemento.serialize() for elemento in elementi]), 200) \
                if elementi else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500
    
class DeleteElementiDomandaController:
    def __init__(self, useCase: DeleteElementiDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.DeleteElementiDomandaService]):
        self.__useCase = useCase
        elementoDomanda_blueprint.add_url_rule('/domande/delete', view_func=self.deleteElementiDomandaByid, methods=['POST'])

    @inject
    def deleteElementiDomandaByid(self):
        try:
            ids = request.json['ids']
            deleted = self.__useCase.deleteElementiDomandaById(ids)
            return (jsonify("Elementi eliminati con successo"), 200) \
                if deleted else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except BadRequest:
            return jsonify("Ids è un campo obbligatorio."), 400
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500
    
class UpdateElementoDomandaController:
    def __init__(self, useCase: UpdateElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.UpdateElementoDomandaService]):
        self.__useCase = useCase
        elementoDomanda_blueprint.add_url_rule('/domande/<int:id>', view_func=self.updateElementoDomandaById, methods=['PUT'])

    @inject
    def updateElementoDomandaById(self, id: int):
        try:
            domanda = request.json['domanda']
            risposta = request.json['risposta']
            updated = self.__useCase.updateElementoDomandaById(id, domanda, risposta)
            return (jsonify("Elemento aggiornato con successo"), 200) \
                if updated else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except BadRequest:
            return jsonify("Domanda e risposta sono campi obbligatori."), 400
        except Exception:
            return jsonify("Si è verificato un errore nel server, riprova più tardi"), 500
        except ValueError as e:
            return jsonify(str(e)), 400