from flask import request, jsonify, Blueprint
from flask.views import MethodView
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer
from src.application.evaluation.status.StatusTracker import TestStatusTracker
from src.application.ports.input import ExecuteTestUseCase
from threading import Thread
import time
from flask import current_app

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__)

class ExecuteTestController(MethodView):
    def __init__(self, useCase: ExecuteTestUseCase = Provide[RootContainer.executeTestContainer.ExecuteTestService], \
                status_tracker: TestStatusTracker = Provide[RootContainer.executeTestContainer.TestStatusTracker]):
        self.__status_tracker = status_tracker
        self.__useCase = useCase

    @inject
    def post(self):
        try:

            app = current_app._get_current_object()

            def run_test_in_thread(app, useCase):
                with app.app_context():
                    risultato = useCase.executeTest()
                    self.__status_tracker.set_id_risultato(risultato.getId())

            Thread(target=run_test_in_thread, args=(app, self.__useCase)).start()

            time.sleep(3)
            status = self.__status_tracker.get_status()

            if status["in_progress"]:
                return jsonify({"message": "Test avviato con successo"}), 200
            else:
                return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        except Exception:
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
executeTest_blueprint.add_url_rule('/executeTest', view_func=ExecuteTestController.as_view('execute_test'))

class GetTestStatusController(MethodView):
    def __init__(self, status_tracker: TestStatusTracker = Provide[RootContainer.executeTestContainer.TestStatusTracker]):
        self.__useCase = status_tracker
    
    def get(self):
        return jsonify(self.__useCase.get_status()), 200

executeTest_blueprint.add_url_rule('/executeTest/status', view_func=GetTestStatusController.as_view('test_status'))