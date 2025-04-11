-- Creazione del database (PostgreSQL non supporta USE, quindi bisogna connettersi manualmente)

CREATE DATABASE Artificial_QI;

-- Creazione delle tabelle

CREATE TABLE ElementoDomanda (
    id SERIAL PRIMARY KEY,
    domanda TEXT NOT NULL,
    risposta TEXT NOT NULL
);

CREATE TABLE RisultatoTest (
    id SERIAL PRIMARY KEY,
    LLM TEXT NOT NULL,
    score FLOAT NOT NULL,
    data TIMESTAMP NOT NULL,
    nomeSet TEXT,
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set) ON UPDATE CASCADE
);

CREATE TABLE RisultatoSingolaDomanda (
    id SERIAL PRIMARY KEY,
    domanda TEXT NOT NULL,
    risposta TEXT NOT NULL,
    rispostaLLM TEXT NOT NULL,
    score FLOAT NOT NULL,
    risultatoTestId INT NOT NULL,
    FOREIGN KEY (risultatoTestId) REFERENCES RisultatoTest(id) ON UPDATE CASCADE
);

CREATE TABLE RisultatoMetrica (
    nomeMetrica TEXT NOT NULL,
    risultatoDomandaId INT NOT NULL,
    score FLOAT NOT NULL,
    PRIMARY KEY (nome_metrica, risultatoDomandaId),
    FOREIGN KEY (risultatoDomandaId) REFERENCES RisultatoSingolaDomanda(id) ON UPDATE CASCADE
);