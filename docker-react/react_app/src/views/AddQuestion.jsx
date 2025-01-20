import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios'; // Importa Axios

function AddQuestion() {
    const [question, setQuestion] = useState('');
    const [answer, setAnswer] = useState('');
    const [error, setError] = useState('');
    const [successMessage, setSuccessMessage] = useState(''); // Nuovo stato per il messaggio di successo
    const navigate = useNavigate();

    const handleSubmit = async (e) => {
        e.preventDefault();

        // Validazione base
        if (!question.trim() || !answer.trim()) {
            setError('Both question and answer are required.');
            return;
        }

        // Resetta messaggi precedenti
        setError('');
        setSuccessMessage('');

        try {
            // Fai la richiesta POST all'API per creare la domanda
            const response = await axios.post('/questions', {
                question,
                answer
            });

            // Gestisci la risposta positiva
            setSuccessMessage(response.data.message); // Mostra il messaggio di successo
            console.log('Question created:', response.data); // Mostra i dati ricevuti dal backend

            // Resetta il form
            setQuestion('');
            setAnswer('');

            // Reindirizza alla lista delle domande
            setTimeout(() => {
                navigate('/questions');
            }, 2000); // Dopo 2 secondi, reindirizza per dare il tempo di vedere il messaggio
        } catch (err) {
            // Gestisci gli errori
            setError('There was an error creating the question. Please try again.');
            console.error('Error:', err);
        }
    };

    return (
        <div className="container mt-5">
            <h1 className="text-center mb-4">Add a New Question</h1>

            <div className="row justify-content-center">
                <div className="col-md-8"> {/* Aumentata la larghezza */}
                    <form onSubmit={handleSubmit}>
                        {/* Messaggi di errore e successo */}
                        {error && (
                            <div className="alert alert-danger" role="alert">
                                {error}
                            </div>
                        )}
                        {successMessage && (
                            <div className="alert alert-success" role="alert">
                                {successMessage}
                            </div>
                        )}

                        <div className="mb-3">
                            <label htmlFor="question" className="form-label text-white"> {/* Colore bianco */}
                                Question
                            </label>
                            <input
                                type="text"
                                id="question"
                                className="form-control"
                                placeholder="Enter the question"
                                value={question}
                                onChange={(e) => setQuestion(e.target.value)}
                            />
                        </div>

                        <div className="mb-3">
                            <label htmlFor="answer" className="form-label text-white"> {/* Colore bianco */}
                                Answer
                            </label>
                            <input
                                type="text"
                                id="answer"
                                className="form-control"
                                placeholder="Enter the answer"
                                value={answer}
                                onChange={(e) => setAnswer(e.target.value)}
                            />
                        </div>

                        <div className="d-flex justify-content-between">
                            <button type="button" className="btn btn-secondary" onClick={() => navigate('/questions')}>
                                Back to Questions
                            </button>
                            <button
                                type="submit"
                                className="btn"
                                style={{
                                    backgroundColor: 'white',
                                    color: 'black',
                                    fontWeight: 'bold',
                                    border: '1px solid black'
                                }}
                            >
                                Save Question
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default AddQuestion;
