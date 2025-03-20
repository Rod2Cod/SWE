-- Creazione del database (PostgreSQL non supporta USE, quindi bisogna connettersi manualmente)
CREATE DATABASE artificialqi;

-- Creazione delle tabelle
CREATE TABLE set_domande (
    id_set SERIAL PRIMARY KEY,
    nome_set VARCHAR(100) NOT NULL
);

CREATE TABLE domanda (
    id_domanda SERIAL PRIMARY KEY,
    testo_domanda TEXT NOT NULL,
    risposta_attesa TEXT NOT NULL
);

CREATE TABLE risultato_test (
    id_risultato_test SERIAL PRIMARY KEY,
    LLM VARCHAR(200) NOT NULL,
    score_generale FLOAT NOT NULL,
    data_test TIMESTAMP NOT NULL,
    nome_set VARCHAR(100),
    id_set INT NOT NULL,
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set) ON UPDATE CASCADE
);

CREATE TABLE risultato_domanda (
    id_risultato_domanda SERIAL PRIMARY KEY,
    domanda TEXT NOT NULL,
    risposta_attesa TEXT NOT NULL,
    risposta_LLM TEXT NOT NULL,
    score_generale FLOAT NOT NULL,
    id_risultato_test INT NOT NULL,
    FOREIGN KEY (id_risultato_test) REFERENCES risultato_test(id_risultato_test) ON UPDATE CASCADE
);


CREATE TABLE metriche(
    nome_metrica VARCHAR(100) NOT NULL,
    id_risultato_domanda INT NOT NULL,
    score_parziale FLOAT NOT NULL,
    PRIMARY KEY (nome_metrica, id_risultato_domanda),
    FOREIGN KEY (id_risultato_domanda) REFERENCES risultato_domanda(id_risultato_domanda) ON UPDATE CASCADE
);

CREATE TABLE domande_nei_set (
    id_set INT NOT NULL ,
    id_domanda INT NOT NULL,
    PRIMARY KEY (id_set, id_domanda),
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set) ON UPDATE CASCADE,
    FOREIGN KEY (id_domanda) REFERENCES domanda(id_domanda) ON UPDATE CASCADE
);
