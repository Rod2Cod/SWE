import requests
import json
import uuid

url = "http://192.168.2.42:1234/v1/chat/completions"
obj = {
    "model": "hermes-3-llama-3.2-3b", 
    "messages": [{"role": "user", "content": "Qual'è la capitale dell'Italia?"}], 
    "max_tokens": 100
}

headers = {"Content-Type": "application/json"}

"""response = requests.post(url=url, headers=headers, data=json.dumps(obj))
print(response.json())"""

print(uuid.uuid1().int>>64)