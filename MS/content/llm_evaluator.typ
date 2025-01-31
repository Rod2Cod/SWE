*LLM Evaluator* è un sistema progettato per valutare frasi utilizzando diversi modelli LLM, tra cui BERT e RoBERTa. Integra inoltre numerose metriche di valutazione, come BLEU, TER, CHRF, ROUGE, BERTscore e CrossEncoder.
Per implementare tutte queste tecnologie in Python, è stato utilizzato il gestore di pacchetti pip, che consente di installare facilmente le librerie necessarie.
Nel progetto, l’intero sistema è stato strutturato all’interno di un file chiamato LLMEval.py, situato nel backend. Questo file include tutte le componenti e le funzioni necessarie per garantire il corretto funzionamento del sistema.

== Allenamento Random Forest

Il nostro sistema utilizza un metodo chiamato Random Forest per calcolare i punteggi, sfruttando alberi decisionali per determinare i pesi da assegnare a ciascuna metrica. Questo approccio permette di ottenere risultati il più accurati possibile rispetto alla realtà.
Le Random Forest richiedono un processo di allenamento per funzionare correttamente. Sebbene il nostro sistema sia già stato addestrato su un dataset di 2000 domande, l’allenamento è un’operazione opzionale. Qualora fosse necessario ricalibrare i pesi, basterà fornire un dataset contenente coppie di frasi e i punteggi di similarità associati.
La funzione di allenamento prenderà in input il dataset e, utilizzando le metriche e i modelli definiti nel sistema, valuterà l’accuratezza di ciascun elemento, generando così i nuovi pesi da assegnare. Questo processo potrebbe richiedere diverse ore, a seconda delle dimensioni del dataset e della complessità del calcolo.
Una volta completato l’allenamento, sarà sufficiente inserire i nuovi pesi nel sistema per aggiornare il modello e continuare ad ottenere valutazioni precise ed affidabili.

== Sistema di valutazione

Come descritto in precedenza, il sistema è interamente implementato nel backend, all’interno di un file denominato LLMEval.py. Questo file rappresenta il cuore del sistema di valutazione e include tutte le componenti necessarie per il suo funzionamento.

=== Installazione
Per l'installazione non serve altro che eseguire un comando di Python  per installare tutte le librerie specificate nel file `requirements.txt`, un file che contiene la lista di librerie necessarie per il corretto funzionamento:
 
 ```bash pip install -r requirements.txt```

 
 Grazie a questo comando tutte le librerie verranno installate, compresi i modelli e le metriche.
 
=== Utilizzo
L’utilizzo del sistema è stato integrato all’interno delle API tramite una route dedicata, sviluppata utilizzando Flask. Questa route, progettata specificamente per la valutazione, si occupa di eseguire le seguenti operazioni:

+ *Input*: La route accetta in input la domanda e la risposta attesa.
+ *Invio al modello*: La funzione invia la domanda al modello da testare e attende la risposta generata.
+ *Valutazione*: Prende la risposta attesa e quella generata dal modello, quindi le invia al sistema di valutazione.
+ *Calcolo delle metriche*: Il sistema calcola i punteggi per ciascuna metrica o modello (ad esempio, BLEU, TER, CHRF, ROUGE, BERTscore, CrossEncoder).
+ *Punteggio finale*: Utilizzando i pesi calcolati dalla Random Forest, combina i punteggi delle metriche per ottenere un punteggio finale.
+ *Risultato*: La route restituisce il punteggio finale, espresso come un valore compreso tra 0 e 1, indicando la qualità della risposta generata rispetto a quella attesa.

== Note Finali

+ tilizzo dei Dataset:

 - Assicurati che il dataset utilizzato per l’allenamento o la valutazione sia di qualità e ben bilanciato. Dati inaccurati possono influire negativamente sui risultati del sistema.
 - I dataset devono essere formattati in modo chiaro, con coppie di frasi e i punteggi di similarità.
+ Ottimizzazione delle Performance:

  - Il processo di allenamento delle Random Forest può essere dispendioso in termini di tempo e risorse. È consigliabile eseguirlo su macchine con capacità di calcolo adeguate.
 - Durante la valutazione, il sistema potrebbe richiedere una quantità significativa di memoria, specialmente se i modelli LLM utilizzati sono di grandi dimensioni.

+ Aggiornamenti: 
 - Controlla regolarmente la disponibilità di nuove versioni delle librerie e dei modelli utilizzati (ad esempio, BERT o RoBERTa). Aggiornarle può migliorare le prestazioni e l’accuratezza del sistema.

+ Test del Sistema:

 - Esegui test regolari per verificare la precisione e l’affidabilità del sistema, utilizzando dataset di test specifici.
 - Confronta i risultati con quelli di altri sistemi di valutazione per validare le prestazioni.
