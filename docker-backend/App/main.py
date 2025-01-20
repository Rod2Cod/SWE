from flask import Flask, request, jsonify
import requests
import json
import os
from dotenv import load_dotenv
from flask_cors import CORS  # Importa CORS

# Carica le variabili d'ambiente dal file .env
load_dotenv()
app = Flask(__name__)


# Abilita CORS per tutte le route
CORS(app)

# URL dell'endpoint API del modello (preso dall'ambiente)
LLM_STUDIO_API_URL = os.getenv("LLM_STUDIO_API_URL")

@app.route("/models", methods=["GET"])
def get_models():
    """Endpoint per ottenere la lista dei modelli disponibili."""
    try:
        response = requests.get(f"{LLM_STUDIO_API_URL}/v1/models")
        if response.status_code == 200:
            return jsonify(response.json()), 200
        else:
            return jsonify({"error": f"{response.status_code}: {response.text}"}), response.status_code
    except Exception as e:
        return jsonify({"error": f"Errore nella richiesta: {str(e)}"}), 500


@app.route("/chat", methods=["POST"])
def chat_completions():
    """Endpoint per generare una risposta in modalità chat."""
    user_data = request.json
    if not user_data:
        return jsonify({"error": "Missing request data"}), 400

    data = {
        "model": user_data.get("model", "gemma-2-2b-it"),
        "messages": user_data.get("messages", []),
        "temperature": user_data.get("temperature", 0.7),
        "max_tokens": user_data.get("max_tokens", 100),
    }

    headers = {"Content-Type": "application/json"}
    try:
        response = requests.post(f"{LLM_STUDIO_API_URL}/v1/chat/completions", headers=headers, data=json.dumps(data))
        if response.status_code == 200:
            return jsonify(response.json()), 200
        else:
            return jsonify({"error": f"{response.status_code}: {response.text}"}), response.status_code
    except Exception as e:
        return jsonify({"error": f"Errore nella richiesta: {str(e)}"}), 500


@app.route("/completions", methods=["POST"])
def completions():
    """Endpoint per completare un testo dato un prompt."""
    user_data = request.json
    if not user_data:
        return jsonify({"error": "Missing request data"}), 400

    data = {
        "model": user_data.get("model", "text-davinci-003"),
        "prompt": user_data.get("prompt", ""),
        "temperature": user_data.get("temperature", 0.7),
        "max_tokens": user_data.get("max_tokens", 100),
    }

    headers = {"Content-Type": "application/json"}
    try:
        response = requests.post(f"{LLM_STUDIO_API_URL}/v1/completions", headers=headers, data=json.dumps(data))
        if response.status_code == 200:
            return jsonify(response.json()), 200
        else:
            return jsonify({"error": f"{response.status_code}: {response.text}"}), response.status_code
    except Exception as e:
        return jsonify({"error": f"Errore nella richiesta: {str(e)}"}), 500




@app.route("/testllm", methods=["POST"])
def test_llm():
    """
    Endpoint per inviare una domanda al modello selezionato e ottenere una risposta.
    """
    data = request.get_json()

    # Controlla che tutti i parametri richiesti siano forniti
    question = data.get("question")
    expAnswer = data.get("expAnswer")
    model = data.get("model")  # Ottieni il modello selezionato

    if not question or not expAnswer or not model:
        return jsonify({"error": "Parameters 'question', 'expAnswer', and 'model' are required."}), 400

    # Prepara i dati per l'inoltro al modello
    chat_data = {
        "model": model,
        "messages": [
            {"role": "user", "content": question}
        ],
        "temperature": 0.7,
        "max_tokens": 100,
    }

    headers = {"Content-Type": "application/json"}

    try:
        # Invio della richiesta al modello selezionato tramite la funzione `chat`
        response = requests.post(f"{LLM_STUDIO_API_URL}/v1/chat/completions", headers=headers, data=json.dumps(chat_data))

        if response.status_code == 200:
            model_response = response.json()
            return jsonify({
                "question": question,
                "expected_answer": expAnswer,
                "model_response": model_response,
                "message": "Data processed successfully!"
            }), 200
        else:
            return jsonify({"error": f"Model request failed: {response.status_code}: {response.text}"}), response.status_code
    except Exception as e:
        return jsonify({"error": f"Errore nell'inoltro al modello: {str(e)}"}), 500


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
