class TestStatusTracker:
    def __init__(self):
        self._in_progress = False
        self._is_starting = False
        self._total_questions = 0
        self._questions_completed = 0

    def mark_starting(self):
        self._is_starting = True
        self._in_progress = False

    def start_test(self, total_questions: int):
        self._is_starting = False
        self._in_progress = True
        self._total_questions = total_questions
        self._questions_completed = 0

    def update_progress(self):
        self._questions_completed += 1

    def finish_test(self):
        self._in_progress = False
        self._is_starting = False

    def get_status(self) -> dict:
        percentage = 0
        if self._total_questions > 0:
            percentage = (self._questions_completed / self._total_questions) * 100
        return {
            "starting": self._is_starting,
            "in_progress": self._in_progress,
            "completed": self._questions_completed,
            "total": self._total_questions,
            "percentage": percentage
        }

test_status_tracker = TestStatusTracker()
