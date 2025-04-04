from src.application.evaluation.status.StatusTracker import TestStatusTracker

class TestStatusTrackerImpl(TestStatusTracker):
    def __init__(self):
        self.__in_progress = False
        self.__is_starting = False
        self.__total_questions = 0
        self.__questions_completed = 0
        self.__id_risultato = None

    def mark_starting(self):
        self.__is_starting = True
        self.__in_progress = False

    def start_test(self, total_questions: int):
        self.__id_risultato = None
        self.__is_starting = False
        self.__in_progress = True
        self.__total_questions = total_questions
        self.__questions_completed = 0

    def update_progress(self):
        self.__questions_completed += 1

    def set_id_risultato(self, id_risultato):
        self.__id_risultato = id_risultato

    def finish_test(self):
        self.__in_progress = False
        self.__is_starting = False

    def get_status(self) -> dict:
        percentage = 0
        if self.__total_questions > 0:
            percentage = (self.__questions_completed / self.__total_questions) * 100
        return {
            "starting": self.__is_starting,
            "in_progress": self.__in_progress,
            "completed": self.__questions_completed,
            "total": self.__total_questions,
            "percentage": percentage,
            "id_risultato": self.__id_risultato,
        }