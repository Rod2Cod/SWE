from flask import request, jsonify, Blueprint
from flask.views import MethodView
from werkzeug.exceptions import BadRequest, UnsupportedMediaType
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer

from src.application.ports.input import (AddElementoDomandaUseCase, 
                                         GetElementoDomandaUseCase, 
                                         GetAllElementiDomandaUseCase, 
                                         DeleteElementiDomandaUseCase, 
                                         UpdateElementoDomandaUseCase)


elementoDomanda_blueprint = Blueprint('elementoDomanda_blueprint', __name__)

class AddElementoDomandaController(MethodView):
    def __init__(self, useCase: AddElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.AddElementoDomandaService]):
        self.__useCase = useCase

    @inject
    def post(self):
        try:
            # prendo domanda e risposta dal body della richiesta, se non presenti ritorna BadRequest
            domanda = request.json['domanda']
            risposta = request.json['risposta']
            elemento = self.__useCase.addElementoDomanda(domanda, risposta)
            return (jsonify({"message": "Elemento aggiunto con successo"}), 201) \
                if elemento else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        # se errore di validazione nella business logic
        except ValueError as e:
            return jsonify(str(e)), 400
        except (KeyError, BadRequest):
            return jsonify({"message": "Domanda e risposta sono campi obbligatori."}), 400
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
elementoDomanda_blueprint.add_url_rule('/domande', view_func=AddElementoDomandaController.as_view('add_elemento_domanda'))
   
class GetElementoDomandaController(MethodView):
    def __init__(self, useCase: GetElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.GetElementoDomandaService]):
        self.__useCase = useCase

    @inject
    def get(self, id: int):
        try:
            elemento = self.__useCase.getElementoDomandaById(id)
            return (jsonify(elemento.serialize()), 200) \
                if elemento else (jsonify("Si è verificato un errore nel server, riprova più tardi"), 500)
        except ValueError as e:
            return jsonify({"message": str(e)}), 400
        except Exception as e:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
elementoDomanda_blueprint.add_url_rule('/domande/<int:id>', view_func=GetElementoDomandaController.as_view('get_elemento_domanda_by_id'))

class GetAllElementiDomandaController(MethodView):
    def __init__(self, useCase: GetAllElementiDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.GetAllElementiDomandaService]):
        self.__useCase = useCase

    @inject
    def get(self):
        try:
            elementi = self.__useCase.getAllElementiDomanda()
            # Se elementi è set vuoto lo ritorna, altrimento se è None ritorna errore 500
            return (jsonify([elemento.serialize() for elemento in elementi]), 200) \
                if elementi is not None else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
elementoDomanda_blueprint.add_url_rule('/domande', view_func=GetAllElementiDomandaController.as_view('get_all_elementi_domanda'))

class DeleteElementiDomandaController(MethodView):
    def __init__(self, useCase: DeleteElementiDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.DeleteElementiDomandaService]):
        self.__useCase = useCase

    @inject
    def delete(self):
        try:
            ids = request.json['ids']
            deleted = self.__useCase.deleteElementiDomandaById(ids)
            return (jsonify({"message": "Elementi eliminati con successo"}), 200) \
                if deleted else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except ValueError as e:
            return jsonify({"message": str(e)}), 400
        except (KeyError, BadRequest, UnsupportedMediaType):
            return jsonify({"message": "La lista di id è un campo obbligatorio."}), 400
        except Exception as e:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
elementoDomanda_blueprint.add_url_rule('/domande/delete', view_func=DeleteElementiDomandaController.as_view('delete_elementi_domanda'))

class UpdateElementoDomandaController(MethodView):
    def __init__(self, useCase: UpdateElementoDomandaUseCase = Provide[RootContainer.elementoDomandaContainer.UpdateElementoDomandaService]):
        self.__useCase = useCase

    @inject
    def put(self, id: int):
        try:
            domanda = request.json['domanda']
            risposta = request.json['risposta']
            updated = self.__useCase.updateElementoDomandaById(id, domanda, risposta)
            return (jsonify({"message": "Elemento aggiornato con successo"}), 200) \
                if updated else (jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500)
        except ValueError as e:
            return jsonify(str(e)), 400
        except (KeyError, BadRequest):
            return jsonify({"message": "Domanda e risposta sono campi obbligatori."}), 400
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500

elementoDomanda_blueprint.add_url_rule('/domande/<int:id>', view_func=UpdateElementoDomandaController.as_view('update_elemento_domanda'))