*LLM Evaluator* è un sistema progettato per valutare frasi utilizzando diversi modelli LLM, tra cui BERT e RoBERTa. Integra inoltre numerose metriche di valutazione, come BLEU, TER, CHRF, ROUGE, BERTscore e CrossEncoder.
Per implementare tutte queste tecnologie in Python, è stato utilizzato il gestore di pacchetti pip, che consente di installare facilmente le librerie necessarie.
Nel progetto, l’intero sistema è stato strutturato all’interno della cartella src/application/evaluation, all'interno della cartella Artificial_QI. Questo file include tutte le componenti e le funzioni necessarie per garantire il corretto funzionamento del sistema.

== Allenamento Random Forest

Il nostro sistema utilizza un metodo chiamato Random Forest per calcolare i punteggi, sfruttando alberi decisionali per determinare un punteggio di somiglianza tra le due frasi in ingresso. Questo approccio permette di ottenere risultati suufficientemente accurati rispetto alla realtà.
Le Random Forest richiedono un processo di allenamento per funzionare correttamente. Sebbene il nostro sistema sia già stato addestrato su un dataset di 5000 domande, l’allenamento è un’operazione opzionale. Qualora fosse necessario ricalibrare i pesi, viene fornito tutto il necessario all'interno della cartella `trainModel`. Si consiglia di utilizzare cuda con la corrispondente versione di pytorch per velocizzare il processo di allenamento. Il file `requirements.txt` contiene le librerie aggiuntive che è necessario installare per scaricare un dataset ed elaborarlo. Il primo passo per l'allenamento consiste nello scaricare il dataset, il modello preimpostato è `mteb/stsb_multi_mt`(solo la parte in italiano). Dopo aver scaricato e preparato il modello si puo procedere con l'allenamento. Il file `train.py` contiene il codice necessario per farlo.\
Nello specifico il dataset viene scaricato, elaborato e salvato nella cartella assets come `ds1`. Il trainer carica poi il dataset elaborato e procede con l'allenamento. Il modello viene salvato nella cartella assets come `newmodel.joblib`.
==== Passi da eseguire per l'allenamento (default)
+ Installare le dipendenze aggiuntive:
  ```bash
  pip install -r trainModel/requirements.txt
  ```
+ Scaricare e preparare il dataset:
  ```bash
  python trainModel/dsLoader.py
  ```
+ Eseguire lo script di allenamento:
  ```bash
  python trainModel/train.py
  ```

== Sistema di valutazione

Come descritto in precedenza, il sistema è interamente implementato nel backend, all’interno di un file denominato AlgoritmoValutazioneRisposteImpl.py. Questo file rappresenta il cuore del sistema di valutazione e richiede un modello che accetti in input i valori delle metriche e in output restituisca lo score.

=== Installazione
Per l'installazione non serve altro che eseguire un comando di Python  per installare tutte le librerie specificate nel file `requirements.txt`, un file che contiene la lista di librerie necessarie per il corretto funzionamento:
 
 ```bash
  pip install -r requirements.txt
 ```

 
 Grazie a questo comando tutte le librerie necessarie verranno installate.
 
=== Utilizzo
L’utilizzo del sistema è stato integrato all’interno delle API tramite una route dedicata, sviluppata utilizzando Flask. Il loro utilizzo è descitto nel documento di Specifica Tecnica nel capitodo dedicato alle API.


