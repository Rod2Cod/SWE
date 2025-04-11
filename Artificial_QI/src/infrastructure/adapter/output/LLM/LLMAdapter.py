from src.application.ports.output import LLMPort
import requests
import json
import re

class LLMAdapter(LLMPort):
    def __init__(self, url: str, nome: str):
        self.__url = url
        self.__nome = nome
    
    def makeQuestion(self, domanda: str) -> str:        
        data = {
            "model": self.__nome, 
            "messages": [{"role": "user", "content": domanda}], 
            "max_tokens": 100
        }
 
        headers = {"Content-Type": "application/json"}
        response = requests.post(url=self.__url, headers=headers, data=json.dumps(data))
        if response.status_code == 200:
            risposta = response.json()["choices"][0]["message"]["content"]
            risposta = re.sub(r'[\n\t\r]+', ' ', risposta).strip()

            # Se vuoi anche rimuovere più spazi consecutivi:
            risposta = re.sub(r'\s{2,}', ' ', risposta)
            return risposta
        else:
            raise Exception("Errore nella richiesta al server LLM")
    
    def getName(self) -> str:
        return self.__nome