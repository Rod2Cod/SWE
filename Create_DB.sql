-- Creazione del database (PostgreSQL non supporta USE, quindi bisogna connettersi manualmente)

CREATE DATABASE Artificial_QI;

-- Creazione delle tabelle

CREATE TABLE ElementoDomanda (
    id_domanda SERIAL PRIMARY KEY,
    testo_domanda TEXT NOT NULL,
    risposta_attesa TEXT NOT NULL
);

CREATE TABLE RisultatoTest (
    id_risultato_test SERIAL PRIMARY KEY,
    LLM TEXT NOT NULL,
    score_generale FLOAT NOT NULL,
    data_test TIMESTAMP NOT NULL,
    nome_set TEXT,
    id_set INT NOT NULL,
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set) ON UPDATE CASCADE
);

CREATE TABLE RisultatoSingolaDomanda (
    id_risultato_domanda SERIAL PRIMARY KEY,
    domanda TEXT NOT NULL,
    risposta_attesa TEXT NOT NULL,
    risposta_LLM TEXT NOT NULL,
    score_generale FLOAT NOT NULL,
    id_risultato_test INT NOT NULL,
    FOREIGN KEY (id_risultato_test) REFERENCES risultato_test(id_risultato_test) ON UPDATE CASCADE
);

CREATE TABLE RisultatoMetrica (
    nome_metrica TEXT NOT NULL,
    id_risultato_domanda INT NOT NULL,
    score_parziale FLOAT NOT NULL,
    PRIMARY KEY (nome_metrica, id_risultato_domanda),
    FOREIGN KEY (id_risultato_domanda) REFERENCES risultato_domanda(id_risultato_domanda) ON UPDATE CASCADE
);