from flask import request, jsonify, Blueprint
from flask.views import MethodView
from dependency_injector.wiring import inject, Provide
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer
from src.application.ports.input import ExecuteTestUseCase, GetTestStatusUseCase
from threading import Thread
import time
from flask import current_app

executeTest_blueprint = Blueprint('executeTest_blueprint', __name__)

class ExecuteTestController(MethodView):
    def __init__(self, useCase: ExecuteTestUseCase = Provide[RootContainer.executeTestContainer.ExecuteTestService], \
                status_tracker: GetTestStatusUseCase = Provide[RootContainer.executeTestContainer.GetTestStatusService]):
        self.__status_tracker_use_case = status_tracker
        self.__useCase = useCase

    @inject
    def post(self):
        try:

            app = current_app._get_current_object()

            def run_test_in_thread(app, useCase):
                with app.app_context():
                    useCase.executeTest()

            Thread(target=run_test_in_thread, args=(app, self.__useCase)).start()

            time.sleep(1)
            status = self.__status_tracker_use_case.getTestStatus()

            if status["in_progress"]:
                return jsonify({"message": "Test avviato con successo"}), 200
            else:
                return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        except Exception as e:
            print(e)
            return jsonify({"message": "Si è verificato un errore nel server, riprova più tardi"}), 500
        
executeTest_blueprint.add_url_rule('/executeTest', view_func=ExecuteTestController.as_view('execute_test'))

class GetTestStatusController(MethodView):
    def __init__(self, status_tracker: GetTestStatusUseCase = Provide[RootContainer.executeTestContainer.GetTestStatusService]):
        self.__useCase = status_tracker
    
    def get(self):
        return jsonify(self.__useCase.getTestStatus()), 200

executeTest_blueprint.add_url_rule('/executeTest/status', view_func=GetTestStatusController.as_view('test_status'))