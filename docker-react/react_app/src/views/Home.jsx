import React, { useState, useEffect } from 'react';
import axios from "axios";
import 'bootstrap/dist/css/bootstrap.min.css';

function Home() {
    const [models, setModels] = useState([]); // Stato per i modelli disponibili
    const [selectedModel, setSelectedModel] = useState(''); // Modello selezionato
    const [question, setQuestion] = useState('');
    const [expAnswer, setExpAnswer] = useState('');
    const [response, setResponse] = useState(null); // Stato per la risposta dal server
    const [error, setError] = useState(null); // Stato per eventuali errori
    const [loading, setLoading] = useState(false); // Stato per l'icona di caricamento

    // Recupera i modelli dall'API all'avvio
    useEffect(() => {
        const fetchModels = async () => {
            try {
                const res = await axios.get('/models');
                const models = res.data.data;
                if (Array.isArray(models) && models.length > 0) {
                    setModels(models);
                    setSelectedModel(models[0].id);
                } else {
                    setModels([]);
                    setSelectedModel('');
                    console.warn('No models found in the response.');
                }
            } catch (err) {
                console.error('Errore nel recupero dei modelli:', err);
                setError('Failed to fetch models. Please try again later.');
            }
        };

        fetchModels();
    }, []);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true); // Mostra l'icona di caricamento
        setResponse(null); // Nasconde il box verde dei risultati
        setError(null); // Nasconde eventuali errori precedenti

        try {
            const res = await axios.post('http://localhost:5000/testllm', {
                model: selectedModel,
                question,
                expAnswer,
            });

            const { question: serverQuestion, expected_answer, model_response, evaluation, message } = res.data;

            // Converti l'evaluation da decimale (0-1) a un punteggio (1-10)
            const evaluationScore = (evaluation * 10).toFixed(1); // Lascia una virgola nel numero

            setResponse({
                question: serverQuestion,
                expected_answer,
                model_response,
                evaluation: evaluationScore,
                message
            });
        } catch (err) {
            console.error("Errore durante l'invio dei dati:', err");
            setError('An error occurred. Please check your input and try again.');
        } finally {
            setLoading(false); // Nasconde l'icona di caricamento
        }
    };

    return (
        <div className="container mt-5">
            <h1 className="text-center mb-4">LLM Evaluator</h1>
            <form className="row g-3 justify-content-center" onSubmit={handleSubmit}>
                <div className="col-md-5">
                    <select
                        className="form-select custom-select"
                        value={selectedModel}
                        onChange={(e) => setSelectedModel(e.target.value)}
                    >
                        {models.map((model) => (
                            <option key={model.id} value={model.id}>
                                {model.id}
                            </option>
                        ))}
                    </select>
                </div>

                <div className="col-md-5">
                    <input
                        type="text"
                        className="form-control"
                        placeholder="Enter the question"
                        value={question}
                        onChange={(e) => setQuestion(e.target.value)}
                        required
                    />
                </div>
                <div className="col-md-5">
                    <input
                        type="text"
                        className="form-control"
                        placeholder="Enter the expected answer"
                        value={expAnswer}
                        onChange={(e) => setExpAnswer(e.target.value)}
                        required
                    />
                </div>
                <div className="col-auto">
                    <button type="submit" className="submitButton" disabled={loading}>
                        {loading ? (
                            <span className="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                        ) : (
                            'Test LLM'
                        )}
                    </button>
                </div>
            </form>

            {/* Mostra la risposta in modo ordinato */}
            {response && (
                <div className="alert alert-success mt-4">
                    <h4>Results</h4>
                    <p><strong>Question:</strong> {response.question}</p>
                    <p><strong>Expected Answer:</strong> {response.expected_answer}</p>
                    <p><strong>Model Response:</strong> {response.model_response}</p>
                    <p><strong>Evaluation Score:</strong> {response.evaluation} / 10</p>
                    <p><strong>Message:</strong> {response.message}</p>
                </div>
            )}

            {/* Mostra gli errori */}
            {error && (
                <div className="alert alert-danger mt-4">
                    <strong>Error:</strong> {error}
                </div>
            )}
        </div>
    );
}

export default Home;