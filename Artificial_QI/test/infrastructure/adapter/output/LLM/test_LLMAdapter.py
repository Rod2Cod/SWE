from src.infrastructure.adapter.output.LLM.LLMAdapter import LLMAdapter
import pytest
from unittest.mock import Mock, patch

class TestLLMAdapter:
    @classmethod
    def setup_class(cls):
        cls.url = "http://localhost:5000/v1/chat/completions"
        cls.nome = "gpt-3.5-turbo"
        cls.llm_adapter = LLMAdapter(cls.url, cls.nome)

    def test_make_question(self):
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
        
        domanda = "Qual è la capitale d'Italia?"
        
        with patch("requests.post", return_value=Mock(status_code=200, json=lambda: mock_response)):
            risposta = self.llm_adapter.makeQuestion(domanda)
        
        assert risposta == "La capitale d'Italia è Roma."
        
    def test_make_question_error(self):
        """Test della funzione makeQuestion per verificare la gestione degli errori."""
        
        domanda = "Qual è la capitale d'Italia?"
        
        with patch("requests.post", return_value=Mock(status_code=500)):
            with pytest.raises(Exception):
                self.llm_adapter.makeQuestion(domanda)

    def test_getName(self):
        """Test della funzione getName per verificare il nome del modello."""

        assert self.llm_adapter.getName() == self.nome