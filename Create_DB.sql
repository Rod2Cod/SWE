CREATE DATABASE ArtificialQI;
USE ArtificialQI;

-- Tabella SET (rinominata per evitare conflitti con parola chiave SQL)
CREATE TABLE set_domande (
    id_set INT PRIMARY KEY AUTO_INCREMENT,
    nome_set VARCHAR(100) NOT NULL
);

-- Tabella DOMANDA
CREATE TABLE domanda (
    id_domanda INT PRIMARY KEY AUTO_INCREMENT,
    testo_domanda TEXT NOT NULL,
    risposta_attesa TEXT NOT NULL,
    ultima_versione  BOOLEAN NOT NULL,
    id_set INT NOT NULL
);

-- Tabella RISULTATO_TEST
CREATE TABLE risultato_test (
    id_risultato_test INT PRIMARY KEY AUTO_INCREMENT,
    LLM VARCHAR(200) NOT NULL,
    score_generale FLOAT NOT NULL,
    data_test DATETIME NOT NULL,
    nome_set VARCHAR(100),
    id_set INT NOT NULL,
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set)
);

-- Tabella RISULTATO_DOMANDA
CREATE TABLE risultato_domanda (
    id_risultato_domanda INT PRIMARY KEY AUTO_INCREMENT,
    risposta_LLM TEXT NOT NULL,
    score_generale FLOAT NOT NULL,
    id_domanda INT NOT NULL,
    id_risultato_test INT NOT NULL,
    FOREIGN KEY (id_domanda) REFERENCES domanda(id_domanda),
    FOREIGN KEY (id_risultato_test) REFERENCES risultato_test(id_risultato_test)
);

-- Tabella METRICA
CREATE TABLE metrica (
    nome_metrica VARCHAR(100) NOT NULL,
    score_parziale FLOAT NOT NULL,
    id_risultato_domanda INT NOT NULL,
    FOREIGN KEY (id_risultato_domanda) REFERENCES risultato_domanda(id_risultato_domanda),
    PRIMARY KEY (nome_metrica, id_risultato_domanda)
);  

-- DOMANDE NEI SET
CREATE TABLE domande_nei_set (
    id_set INT NOT NULL,
    id_domanda INT NOT NULL,
    PRIMARY KEY (id_set , id_domanda),
    FOREIGN KEY (id_set) REFERENCES set_domande(id_set),
    FOREIGN KEY (id_domanda) REFERENCES domanda(id_domanda)
);

DELIMITER $$

CREATE TRIGGER before_update_domanda
BEFORE UPDATE ON domanda
FOR EACH ROW
BEGIN
    DECLARE ref_count INT;
    
    -- Conta quanti record in risultato_domanda fanno riferimento alla domanda
    SELECT COUNT(*) INTO ref_count 
    FROM risultato_domanda 
    WHERE id_domanda = OLD.id_domanda;
    -- Se la domanda è visibile e ha almeno un riferimento, viene copiata invece di essere aggiornata
    IF ref_count > 0 THEN
        -- imposto a false la proprietà ultima_versione 
        UPDATE domanda
        SET ultima_versione  = false
        WHERE id_domanda = OLD.id_domanda;
        -- Creazione della copia della domanda con i nuovi dati
        INSERT INTO domanda (testo_domanda, ultima_versione , risposta_attesa)
        VALUES (NEW.testo_domanda, true , NEW.risposta_attesa);

        SET new_id = LAST_INSERT_ID(); -- Ottieni l'ID della nuova domanda

        UPDATE domande_nei_set 
        SET id_domanda = new_id
        WHERE id_domanda = OLD.id_domanda;

         -- Impedire l'aggiornamento della domanda originale
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Modifica bloccata: domanda referenziata nella tabella risultato_domanda (presente all interno di un test nello storico), creata una copia con le modifiche.';

    END IF;
END

CREATE TRIGGER before_delete_domanda
BEFORE DELETE ON domanda
FOR EACH ROW
BEGIN
    UPDATE domanda
    SET ultima_versione = false
    WHERE id_domanda = OLD.id_domanda;

    DELETE FROM domande_nei_set
    WHERE id_domanda = OLD.id_domanda;
END

CREATE TRIGGER before_delete_test
BEFORE DELETE ON test
FOR EACH ROW
BEGIN
    -- Declare a variable to store the question ID
    DECLARE v_id_domanda INT;

    -- Cursor to loop through all questions in the test being deleted
    DECLARE cur CURSOR FOR
        SELECT id_domanda 
        FROM risultato_domanda 
        WHERE id_risultato_test = OLD.id_risultato_test;

    -- Handler for when no more rows are found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET @done = TRUE;

    -- Open the cursor
    OPEN cur;

    -- Loop through each question in the test
    read_loop: LOOP
        FETCH cur INTO v_id_domanda;
        IF @done THEN
            LEAVE read_loop;
        END IF;

        -- Check if the question is an old version and not referenced in any other test
        IF EXISTS (
            SELECT 1 
            FROM domanda 
            WHERE id_domanda = v_id_domanda 
              AND ultima_versione = FALSE
        ) AND NOT EXISTS (
            SELECT 1 
            FROM risultato_domanda 
            WHERE id_domanda = v_id_domanda 
              AND id_risultato_test <> OLD.id_risultato_test
        ) THEN
            -- Delete the question if it meets the conditions
            DELETE FROM domanda 
            WHERE id_domanda = v_id_domanda;
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
END$$

DELIMITER ;
