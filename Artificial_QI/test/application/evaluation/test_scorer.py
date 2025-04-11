from src.application.evaluation.Scorer import Scorer



class Test_Scorer:
    @classmethod
    def setup_class(cls):
        cls.scorer = Scorer()
        cls.scores = cls.scorer.score("test", "test")

    def test_returnType(self):
        assert type(self.scores) == dict
        for i in self.scores.values():
            assert type(i) == float
    
    def test_metrics(self):
        metrics = ["BLEU", "TER", "CHRF", "ROUGE", "BERT", "CrossEncoder"].sort()
        keys = list(self.scores.keys()).sort()
        assert metrics == keys

    def test_values(self):
        for i in self.scores.values():
            assert round(i,2) >= 0 and round(i,2) <= 1