from src.application.evaluation.status.StatusTrackerImpl import TestStatusTrackerImpl

class Test_StatusTracker:
    def setup_class(cls):
        cls.status_tracker = TestStatusTrackerImpl()
        
    def setup_method(self):
        self.status_tracker = TestStatusTrackerImpl()
        
    def test_start_test(self):
        self.status_tracker.start_test(5)
        status = self.status_tracker.get_status()
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
        for _ in range(5):
            self.status_tracker.update_progress()
        self.status_tracker.finish_test()
        status = self.status_tracker.get_status()
        assert status["in_progress"] == False
        assert status["completed"] == 5
        assert status["percentage"] == 100.0
        assert status["id_risultato"] == None
        
    def test_set_error(self):
        self.status_tracker.set_error("Test failed")
        status = self.status_tracker.get_status()
        assert status["error"] == "Test failed"
        assert status["in_progress"] == False
        
    def test_get_status(self):
        self.status_tracker.start_test(5)
        self.status_tracker.update_progress()
        status = self.status_tracker.get_status()
        assert status["in_progress"] == True
        assert status["completed"] == 1
        assert status["total"] == 5
        assert status["percentage"] == 20.0
        assert status["id_risultato"] == None
        assert status["error"] == None
        self.status_tracker.finish_test()