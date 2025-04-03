from src.infrastructure.adapter.output.LLM.LLMAdapter import LLMAdapter
import pytest

class TestLLMAdapter:
    @classmethod
    def setup_class(cls):
        cls.url = "http://localhost:5000/v1/chat/completions"
        cls.nome = "gpt-3.5-turbo"
        cls.llm_adapter = LLMAdapter(cls.url, cls.nome)

    def test_make_question(self, mocker):
        """Test della funzione makeQuestion per verificare la risposta corretta."""

        # Mock della risposta del server
        mock_response = {
            "id": "chat-1",
            "object": "chat.completion",
            "created": 20250403,
            "model": "lmstudio/gpt-3.5-turbo",
            "choices": [
                {
                    "message": {
                        "content": "La capitale d'Italia è Roma."
                    }
                }
            ]
        }
        mocker.patch("requests.post", return_value=mocker.Mock(status_code=200, json=lambda: mock_response))

        domanda = "Qual è la capitale d'Italia?"
        risposta = self.llm_adapter.makeQuestion(domanda)
        
        assert risposta == "La capitale d'Italia è Roma."
        
    def test_make_question_error(self, mocker):
        """Test della funzione makeQuestion per verificare la gestione degli errori."""
        
        # Mock della risposta del server con errore
        mocker.patch("requests.post", return_value=mocker.Mock(status_code=500))

        domanda = "Qual è la capitale d'Italia?"
        
        with pytest.raises(Exception):
            self.llm_adapter.makeQuestion(domanda)

    def test_getName(self):
        """Test della funzione getName per verificare il nome del modello."""
        assert self.llm_adapter.getName() == self.nome