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
    risposta_attesa TEXT NOT NULL,
    ultima_versione BOOLEAN NOT NULL
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
    risposta_LLM TEXT NOT NULL,
    score_generale FLOAT NOT NULL,
    id_domanda INT NOT NULL,
    id_risultato_test INT NOT NULL,
    FOREIGN KEY (id_domanda) REFERENCES domanda(id_domanda) ON UPDATE CASCADE,
    FOREIGN KEY (id_risultato_test) REFERENCES risultato_test(id_risultato_test) ON UPDATE CASCADE
);

CREATE TABLE metrica (
    nome_metrica VARCHAR(100) PRIMARY KEY
);

CREATE TABLE score_metriche(
    nome_metrica VARCHAR(100) NOT NULL,
    id_risultato_domanda INT NOT NULL,
    score_parziale FLOAT NOT NULL,
    PRIMARY KEY (nome_metrica, id_risultato_domanda),
    FOREIGN KEY (nome_metrica) REFERENCES metrica(nome_metrica) ON UPDATE CASCADE,
    FOREIGN KEY (id_risultato_domanda) REFERENCES risultato_domanda(id_risultato_domanda) ON UPDATE CASCADE
);

CREATE TABLE domande_nei_set (
    id_set INT NOT NULL ,
    id_domanda INT NOT NULL,
    PRIMARY KEY (id_set, id_domanda),
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set) ON UPDATE CASCADE,
    FOREIGN KEY (id_domanda) REFERENCES domanda(id_domanda) ON UPDATE CASCADE
);

-- Trigger per impedire aggiornamenti diretti su domande referenziate
CREATE OR REPLACE FUNCTION before_update_domanda()
RETURNS TRIGGER AS $$
DECLARE
    ref_count INT;
BEGIN
    SELECT COUNT(*) INTO ref_count FROM risultato_domanda WHERE id_domanda = OLD.id_domanda;
    IF ref_count > 0 THEN
        INSERT INTO domanda (testo_domanda, ultima_versione, risposta_attesa)
        VALUES (NEW.testo_domanda, FALSE, NEW.risposta_attesa) ;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_update_domanda
BEFORE UPDATE ON domanda
FOR EACH ROW
EXECUTE FUNCTION before_update_domanda();

-- Trigger per eliminazione domande
CREATE OR REPLACE FUNCTION before_delete_domanda()
RETURNS TRIGGER AS $$
DECLARE
    ref_count INT;
BEGIN
    SELECT COUNT(*) INTO ref_count FROM risultato_domanda WHERE id_domanda = OLD.id_domanda;
    IF ref_count > 0 THEN
        UPDATE domanda SET ultima_versione = FALSE WHERE id_domanda = OLD.id_domanda;
        DELETE FROM domande_nei_set WHERE id_domanda = OLD.id_domanda;
        RETURN NULL;
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_delete_domanda
BEFORE DELETE ON domanda
FOR EACH ROW
EXECUTE FUNCTION before_delete_domanda();

-- Trigger per eliminazione test
CREATE OR REPLACE FUNCTION before_delete_test()
RETURNS TRIGGER AS $$
DECLARE
    v_id_domanda INT;
BEGIN
    FOR v_id_domanda IN
        SELECT id_domanda FROM risultato_domanda WHERE id_risultato_test = OLD.id_risultato_test
    LOOP
        IF EXISTS (
            SELECT 1 FROM domanda WHERE id_domanda = v_id_domanda AND ultima_versione = FALSE
        ) AND NOT EXISTS (
            SELECT 1 FROM risultato_domanda WHERE id_domanda = v_id_domanda AND id_risultato_test <> OLD.id_risultato_test
        ) THEN
            DELETE FROM domanda WHERE id_domanda = v_id_domanda;
        END IF;
    END LOOP;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_delete_test
BEFORE DELETE ON risultato_test
FOR EACH ROW
EXECUTE FUNCTION before_delete_test();
