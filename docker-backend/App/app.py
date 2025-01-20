from flask import Flask, request, jsonify
import requests
from dotenv import load_dotenv
from extensions import db
from models import Questions
from flask_cors import CORS
import json
import os
import logging
import LLMEval

# Carica variabili d'ambiente dal file .env
load_dotenv()

# Configurazione Flask
app = Flask(__name__)
app.config['SECRET_KEY'] = os.getenv("SECRET_KEY", "default_secret_key")
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("DATABASE_URL")
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


# Inizializza il database
db.init_app(app)

# Abilita CORS per tutte le route
CORS(app)

#Logger
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

# URL dell'endpoint API del modello (preso dall'ambiente)
LLM_STUDIO_API_URL = os.getenv("LLM_STUDIO_API_URL")


# Rotte per le domande e risposte -----------------------------------------------------
@app.route('/')
def home():
    return jsonify({"message": "Benvenuto nell'app Flask!"})

@app.route('/questions', methods=['GET'])
def get_questions():
    """Ottieni tutte le domande, ordinate dalla più recente alla meno recente"""
    questions = Questions.query.order_by(Questions.id.desc()).all()  # Ordina per ID in modo decrescente
    result = [
        {"id": q.id, "question": q.question, "answer": q.answer} for q in questions
    ]
    return jsonify(result), 200


@app.route('/questions/<int:id>', methods=['GET'])
def get_question_by_id(id):
    """Ottieni una domanda per ID"""
    question = Questions.query.get_or_404(id)
    return jsonify({"id": question.id, "question": question.question, "answer": question.answer}), 200

@app.route('/questions', methods=['POST'])
def create_question():
    """Crea una nuova domanda"""
    data = request.get_json()
    new_question = Questions(
        question=data.get('question'),
        answer=data.get('answer')
    )
    db.session.add(new_question)
    db.session.commit()
    return jsonify({"message": "Domanda creata con successo!", "id": new_question.id}), 201

@app.route('/questions/<int:id>', methods=['PUT'])
def update_question(id):
    """Aggiorna una domanda esistente"""
    question = Questions.query.get_or_404(id)
    data = request.get_json()
    question.question = data.get('question', question.question)
    question.answer = data.get('answer', question.answer)
    db.session.commit()
    return jsonify({"message": "Domanda aggiornata con successo!"}), 200

@app.route('/questions/<int:id>', methods=['DELETE'])
def delete_question(id):
    """Elimina una domanda"""
    question = Questions.query.get_or_404(id)
    db.session.delete(question)
    db.session.commit()
    return jsonify({"message": "Domanda eliminata con successo!"}), 200

# FINE Rotte per le domande e risposte xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


# Rotte per comunicazione con LLM in LLM STUDIO ------------------------------------------------------------------

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

            content = model_response.get('choices', [{}])[0].get('message', {}).get('content', 'Default content')



            result = LLMEval.EvaluateLLM([[expAnswer, content]])

            print(result)

            return jsonify({
                "question": question,
                "expected_answer": expAnswer,
                "model_response": content,
                "evaluation": result[0],
                "message": "Data processed successfully!"
            }), 200
        else:
            return jsonify({"error": f"Model request failed: {response.status_code}: {response.text}"}), response.status_code
    except Exception as e:
        return jsonify({"error": f"Errore nell'inoltro al modello: {str(e)}"}), 500

# FINE Rotte per comunicazione con LLM in LLM STUDIO xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



# Punto di ingresso
if __name__ == '__main__':
    with app.app_context():
        db.create_all()  # Crea le tabelle se non esistono
    app.run(debug=True)
