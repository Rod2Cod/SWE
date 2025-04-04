from abc import ABC, abstractmethod

class TestStatusTracker(ABC):
    @abstractmethod
    def start_test(self, total_questions: int):
        pass

    @abstractmethod
    def update_progress(self):
        pass

    @abstractmethod
    def set_id_risultato(self, id_risultato):
        pass

    @abstractmethod
    def finish_test(self):
        pass

    @abstractmethod
    def get_status(self) -> dict:
        pass