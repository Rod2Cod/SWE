from flask import request, jsonify, Blueprint
from flask.views import MethodView
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer
from src.application.evaluation.status_tracker import test_status_tracker
from src.application.ports.input import ExecuteTestUseCase
from threading import Thread
import time
from flask import current_app

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__)

class ExecuteTestController(MethodView):
    def __init__(self, useCase: ExecuteTestUseCase = Provide[RootContainer.executeTestContainer.ExecuteTestService]):
        self.__useCase = useCase

    @inject
    def post(self):
        try:

            app = current_app._get_current_object()

            def run_test_in_thread(app, useCase):
                with app.app_context():
                    risultato = useCase.executeTest()
                    print(risultato.getId())
                    test_status_tracker.set_id_risultato(risultato.getId())

            test_status_tracker.mark_starting()
            Thread(target=run_test_in_thread, args=(app, self.__useCase)).start()

            time.sleep(3)
            status = test_status_tracker.get_status()

            if status["in_progress"]:
                return jsonify({"message": "Test avviato con successo"}), 200
            else:
                return jsonify({
                    "message": "Errore durante l'avvio del test",
                    "error": "Il test non risulta in esecuzione dopo 5 secondi"
                }), 500


        except Exception as e:
            return jsonify({f"message": "Si è verificato un errore nel server, riprova più tardi ", "error": str(e)}), 500
        
executeTest_blueprint.add_url_rule('/executeTest', view_func=ExecuteTestController.as_view('execute_test'))



class TestStatusController(MethodView):
    def get(self):
        return jsonify(test_status_tracker.get_status()), 200

executeTest_blueprint.add_url_rule('/status', view_func=TestStatusController.as_view('status'))