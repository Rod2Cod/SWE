from src.application.evaluation.status.StatusTrackerImpl import TestStatusTrackerImpl

class Test_StatusTracker:
    def setup_class(cls):
        cls.status_tracker = TestStatusTrackerImpl()
        
    def test_mark_starting(self):
        self.status_tracker.mark_starting()
        status = self.status_tracker.get_status()
        assert status["starting"] == True
        assert status["in_progress"] == False
        
    def test_start_test(self):
        self.status_tracker.start_test(5)
        status = self.status_tracker.get_status()
        assert status["starting"] == False
        assert status["in_progress"] == True
        assert status["total"] == 5
        assert status["completed"] == 0
        assert status["percentage"] == 0.0
        
    def test_update_progress(self):
        self.status_tracker.start_test(5)
        self.status_tracker.update_progress()
        status = self.status_tracker.get_status()
        assert status["completed"] == 1
        
    def test_set_id_risultato(self):
        self.status_tracker.set_id_risultato(123)
        status = self.status_tracker.get_status()
        assert status["id_risultato"] == 123
        
    def test_finish_test(self):
        self.status_tracker.start_test(5)
        self.status_tracker.finish_test()
        status = self.status_tracker.get_status()
        assert status["in_progress"] == False
        assert status["starting"] == False
        
    def test_get_status(self):
        self.status_tracker.start_test(5)
        for _ in range(3):
            self.status_tracker.update_progress()
        status = self.status_tracker.get_status()
        assert status["starting"] == False
        assert status["in_progress"] == True
        assert status["total"] == 5
        assert status["completed"] == 3
        assert status["percentage"] == 60.0
        assert status["id_risultato"] == None