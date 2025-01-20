import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios'; // Importa axios

function Questions() {
    const navigate = useNavigate();

    const [questions, setQuestions] = useState([]); // Inizializza con un array vuoto
    const [loading, setLoading] = useState(true); // Stato per caricare i dati
    const [error, setError] = useState(null); // Stato per errori
    const [deleting, setDeleting] = useState(null); // Stato per tracciare quale domanda è in fase di eliminazione

    // Funzione per ottenere le domande dal server
    const fetchQuestions = async () => {
        try {
            const response = await axios.get('/questions'); // Cambia con il tuo URL API
            setQuestions(response.data); // Imposta le domande ricevute
        } catch (err) {
            setError('Error fetching questions');
            console.error(err);
        } finally {
            setLoading(false); // Imposta loading a false una volta terminata la richiesta
        }
    };

    // Chiamata all'API quando il componente viene montato
    useEffect(() => {
        fetchQuestions();
    }, []); // L'array vuoto assicura che la chiamata venga fatta solo una volta

    // Funzione per eliminare una domanda
    const handleDeleteQuestion = async (id) => {
        try {
            // Imposta il loading per questa domanda specifica
            setDeleting(id);

            // Fai la richiesta DELETE per eliminare la domanda dal server
            const response = await axios.delete(`/questions/${id}`);
            console.log(response.data.message); // Log del messaggio di successo

            // Ricarica la lista delle domande dopo la cancellazione
            fetchQuestions();
        } catch (err) {
            setError('Error deleting the question');
            console.error(err);
        } finally {
            // Una volta completata la cancellazione, resetta lo stato
            setDeleting(null);
        }
    };

    return (
        <div className="container d-flex justify-content-center align-items-center flex-column">
            <h1 className="text-center mb-4">Questions List</h1>

            <div className="row justify-content-center align-items-center mb-4" style={{ width: '80%' }}>
                <div className="col-md-6 text-center">
                    <button
                        className="btn btn-light w-100"
                        style={{ color: 'black', border: '1px solid black' }}
                        onClick={() => navigate('/addquestion')}
                    >
                        Aggiungi Domanda
                    </button>
                </div>
            </div>

            {/* Gestione della fase di caricamento */}
            {loading ? (
                <div className="loading-container">
                    <div className="spinner"></div> {/* Rotella di caricamento */}
                </div>
            ) : error ? (
                <p className="text-center text-danger">{error}</p> // Mostra errore se c'è
            ) : (
                <div className="row justify-content-center" style={{ flexDirection: 'column', width: '80vw' }}>
                    {questions.length > 0 ? (
                        questions.map((q) => (
                            <div
                                key={q.id} // Usa 'id' al posto di 'index' per evitare errori con gli ID
                                className="mb-3"
                                style={{
                                    width: '70%',
                                    backgroundColor: '#333F6D',
                                    color: 'white',
                                    borderRadius: '10px',
                                    minHeight: '150px',
                                    margin: 'auto',
                                    padding: '10px',
                                }}
                            >
                                <div className="card-body d-flex justify-content-between align-items-center">
                                    <div style={{ flex: 1, marginRight: '20px' }}>
                                        <h5>
                                            <strong>Question:</strong>
                                        </h5>
                                        <p>{q.question}</p>
                                        <h5>
                                            <strong>Answer:</strong>
                                        </h5>
                                        <p>{q.answer}</p>
                                    </div>
                                    <button
                                        className="btn btn-danger"
                                        onClick={() => handleDeleteQuestion(q.id)} // Passa l'ID della domanda da eliminare
                                        disabled={deleting === q.id} // Disabilita il bottone mentre l'operazione è in corso
                                    >
                                        {deleting === q.id ? (
                                            <div className="spinnerDelete"></div> // Mostra la rotella di caricamento
                                        ) : (
                                            '🗑️'
                                        )}
                                    </button>
                                </div>
                            </div>
                        ))
                    ) : (
                        <p className="text-center text-muted">No questions available. Add a new one!</p>
                    )}
                </div>
            )}
        </div>
    );
}

export default Questions;
