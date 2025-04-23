Flask è un framework leggero e super flessibile per Python, utile per creare applicazioni web e API. È molto usato per progetti piccoli e medi, ma con le giuste estensioni può gestire anche cose più grandi. Le sue API sono perfette per creare sistemi RESTful e far comunicare il backend con frontend o altri servizi. Motivo per cui abbiamo scelto di utilizzarlo nel progetto.

== Requisiti
- Docker e Docker Compose installati sul sistema (vedi punto 4.2).
- Permessi di amministratore per configurare directory locali e impostare volumi.

== Configurazione del Sistema
Alcune parti del sistema richiedono una determinata configurazione, modificale tramite il file `config.ini` presente nella cartella del progetto. All'interno di questo file si possono configurare le seguenti variabili:
  - Sezione `llm`
    - `url`: url per l'invio delle richieste al LLM.
    - `nome`: nome del modello LLM da utilizzare.
  - Sezione `evaluator`
    - `model`: percorso del file .joblib contenente il modello di valutazione. Questo percorso è relativo a partire dalla cartella del progetto.
  - Sezione `database`
    - `uri`: URI per la connessione al database Postgres.

== Avvio del Sistema

+ Posizionati nella directory del progetto contenente il file docker-compose.yml.
+ Esegui il comando per avviare i container in background:
  ```bash
  docker compose up -d
  ```
  
+ L'API Flask sarà disponibile all'indirizzo: http://localhost:5000.

== Configurazione dell'API
+ Una volta avviato il sistema, l'API Flask sarà accessibile tramite richieste HTTP all'indirizzo: http://localhost:5000.
+ Verifica che l'endpoint di default risponda correttamente:
  ```bash
  curl http://localhost:5000
  ```
  
+ Utilizzeremo questo endpoint anche nel progetto, per cui tutte le richieste verranno effettuate da axios (vedi punto 5.6) verso questo endpoint, utilizzando poi le varie route, per sfruttare servizi diversi.
== Gestione del Progetto
 - Eseguire comandi all'interno del container Flask:
    ```bash
    docker exec -it <nome_container_flask> /bin/sh
    ```
- Controllare i log delle richieste in tempo reale:
  ```bash
  docker logs -f <nome_container_flask>
  ```

== Arresto del Sistema
Per arrestare e rimuovere i container:
  ```bash
  docker-compose down
  ```
== Test
Per il test dei componenti di backend, viene fornito ed utilizzato lo strumento *pytest* e di seguito viene presentata una scaletta di esempio per avviarne l'esecuzione e testarne quindi le classi.
  + Prima di tutto creare un *ambiente virtuale* e installare le *dipendenze* necessarie(tra queste sarà presente anche pytest):
    ```bash
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    ```
  + Aggiungere quindi alla *variabile d'ambiente* ```env PYTHONPATH``` il percorso della cartella contenente le sottocartelle *src* e *test*:
    ```bash
    export PYTHONPATH=$PYTHONPATH:/path/alla/cartella/padre
    ```
  + Posizionarsi quindi all'interno della cartella padre contenente *src* e *test*
  + *Avviare* il test con il seguente comando:
    ```bash
    pytest -v --cov-report=term-missing --cov=./src -n 2 ./test
    ```
    - Il flag ```-v``` permette di visualizzare i *dettagli* dei test eseguiti.
    - Il flag ```--cov-report=term-missing``` permette di visualizzare la *copertura* dei test eseguiti a terminale.
    - Il flag ```--cov=./src``` permette di specificare la *cartella* da *testare*.
    - Il flag ```-n 2``` permette di eseguire i test in *parallelo* su 2 core.
    - Il flag ```./test``` permette di specificare la *cartella* contenente i *test* da eseguire.

  + In caso di terminazione dei test senza errori, apparira a terminale una tabella indicante la copertura dei test effettuati.

==== Riferimenti
  Per eventuali *approndimentimenti* riguardanti l'utilizzo di pytest, è possibile consultare le seguenti documentazioni:
    - *Pytest* (https://docs.pytest.org/en/latest/)
    - *Pytest-cov* (https://pytest-cov.readthedocs.io/en/latest/)
    - *Pytest-xdist* (https://pytest-xdist.readthedocs.io/en/stable/).

== Note Finali
- Per testare endpoint più complessi, utilizza strumenti come Postman o cURL.
- In caso di problemi:
 - Controlla i log del container Flask(vedi punto 7.4)
 - Assicurati che le porte configurate nel file docker-compose.yml siano disponibili.

== Possibili Estensioni
Qui di seguito sono elencate alcune possibili estensioni per la sezione backend del progetto.

=== Set di Elementi Domanda
Come descritto all'interno della Specifica Tecnica, il dominio delle domande presenti nel sistema viene rappresentato dall'oggetto *ElementoDomanda*, composto da *Domanda* e *Risposta*. Al momento dell'esecuzione del test però, si vanno a ricavare tutti gli Elementi Domanda presenti nel sistema, senza la possibilità di lavorare solo su alcuni di questi. La soluzione potrebbe essere quella di implementare un'entità *SetElementiDomanda*, in modo da poter raggruppare alcuni Elementi Domanda in base ad un certo criterio, ed andare quindi ad eseguire il test solo su questi.

==== Entità Set Elementi Domanda
#align(center)[
      #image("uml/Set.png", height: 16%)
    ]
===== Attributi :
- elementiDomanda : set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appartenenti al set.
- nome : nome identificativo del set.
===== Metodi : 
- updateElementiDomandaAssociati : viene passato come parametro il set degli elementi domanda che si vuole siano associati al set. Tutti gli elementi domanda precedentemente associati vengono dissociati e sostituiti con i nuovi. 
- getAllElementiDomanda : restituisce il set di elementi domanda associati al set.
- setNome : una stringa contenente il nuovo nome viene passata come parametro e il nome del set viene sostituito con essa. 
- getNome : restituisce la stringa contenente il nome del set. 
- getSize : restituisce il numero di elementi domanda associati al set. 

==== Controllers
I *Controllers* si occuperanno di fornire tramite *API*, degli endpoint per gestire le richieste HTTP. Per portare a termine la richiesta faranno quindi uso di uno o più *UseCase* definiti precedentemente, ed implementati nei *Services* corrispondenti.
Di seguito vengono quindi elencate le possibili strutture dei vari Controllers.




#set heading(numbering: none)
===== Aggiunta singola
#align(center)[
      #image("uml/AddSetElementiDomandaC.png", height: 6%)
    ]

Questo controller si occuperà di esporre un endpoint per l'aggiunta di un Set di Elementi Domanda, prendendo in input, il nome che si vuole assegnare al Set, e gli id degli Elementi Domanda che si vogliono aggiungere a quest'ultimo. Si andrà quindi poi a creare il nuovo Set tramite lo *UseCase* e il *Service* corrispondente.

===== Ottenimento singolo
#align(center)[
      #image("uml/GetSetElementiDomandaC.png", height: 6%)
    ]

Questo controller si occuperà di esporre un endpoint per l'ottenimento di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole ottenere. Si andrà quindi a recuperare il Set tramite lo *UseCase* e il *Service* corrispondente.

===== Ottenimento collettivo
#align(center)[
      #image("uml/GetAllSetElementiDomandaC.png", height: 6%)
    ]

Questo controller si occuperà di esporre un endpoint per l'ottenimento di tutti i Set di Elementi Domanda presenti nel sistema. Si andranno quindi a recuperare i vari Set tramite lo *UseCase* e il *Service* corrispondente.

===== Eliminazione singola
#align(center)[
      #image("uml/DeleteSetElementiDomandaC.png", height: 7%)
    ]

Questo controller si occuperà di esporre un endpoint per l'eliminazione di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole eliminare. Si andrà quindi a rimuovere il Set tramite lo *UseCase* e il *Service* corrispondente.

===== Modifica nome

#align(center)[
      #image("uml/EditNomeSetElementiDomandaC.png", height: 6%)
    ]
Questo controller si occuperà di esporre un endpoint per la modifica del nome di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole modificare e il nuovo nome che si vuole assegnare. Si andrà quindi a modificare il nome del Set tramite lo *UseCase* e il *Service* corrispondente.

===== Aggiornamento Elementi Domanda associati

#align(center)[
      #image("uml/UpdateElementiDomandaSetC.png", height: 5.5%)
    ]
Questo controller si occuperà di esporre un endpoint per l'aggiornamento degli Elementi Domanda associati ad un Set, prendendo in input, il nome del Set che si vuole modificare e gli id degli Elementi Domanda che si vogliono sostituire a quelli attualmente assegnati. Si andrà quindi a modificare gli Elementi Domanda associati al Set tramite lo *UseCase* e il *Service* corrispondente.

===== Esecuzione Test
#align(center)[
      #image("uml/ExecuteTestOnSetController.png", height: 7%)
    ]

Questo controller si occuperà di esporre un endpoint per l'esecuzione del test su un Set di Elementi Domanda, prendendo in input, il nome del Set su cui si vuole eseguire il test. Si andrà quindi a recuperare il Set tramite lo *UseCase* e il *Service* corrispondente, e si andrà a generare il test.

#set heading(numbering: "1.1")
==== Services

I *Services* si occuperanno di implementare gli *UseCase* e realizzare quindi la logica di business. Per portare a termine la richiesta faranno quindi uso di *Porte*, le quali veranno implementate nel o negli *Adapters* corrispondenti.

#set heading(numbering: none)
===== Aggiunta singola
#align(center)[
      #image("uml/AddSetElementiDomanda.png", height: 6%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'aggiunta di un Set di Elementi Domanda, prendendo in input, il nome che si vuole assegnare al Set, e gli id degli Elementi Domanda che si vogliono aggiungere a quest'ultimo. Si andrà quindi a creare il nuovo Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Ottenimento singolo
#align(center)[
      #image("uml/GetSetElementiDomanda.png", height: 6%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'ottenimento di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole ottenere. Si andrà quindi a recuperare il Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Ottenimento collettivo
#align(center)[
      #image("uml/GetAllSetElementiDomanda.png", height: 6%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'ottenimento di tutti i Set di Elementi Domanda presenti nel sistema. Si andranno quindi a recuperare i vari Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Eliminazione singola
#align(center)[
      #image("uml/DeleteSetElementiDomanda.png", height: 7%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'eliminazione di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole eliminare. Si andrà quindi a rimuovere il Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Modifica nome
#align(center)[
      #image("uml/EditNomeSetElementiDomanda.png", height: 6%)
    ]

Questo *Service* si occuperà di eseguire la logica per la modifica del nome di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole modificare e il nuovo nome che si vuole assegnare. Si andrà quindi a modificare il nome del Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Aggiornamento Elementi Domanda associati
#align(center)[
      #image("uml/UpdateElementiDomandaSet.png", height: 5.5%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'aggiornamento degli Elementi Domanda associati ad un Set, prendendo in input, il nome del Set che si vuole modificare e gli id degli Elementi Domanda che si vogliono sostituire a quelli attualmente assegnati. Si andrà quindi a modificare gli Elementi Domanda associati al Set tramite la *Porta* e l'*Adapter* corrispondente.

===== Esecuzione Test
#align(center)[
      #image("uml/ExecuteTestOnSet.png", height: 23%)
    ]

Questo *Service* si occuperà di eseguire la logica per l'esecuzione del test su un Set di Elementi Domanda, prendendo in input, il nome del Set su cui si vuole eseguire il test. Si andrà quindi a recuperare il Set e le relative domande tramite la *Porta* corrispondente. Successivamente si potrà eseguire il test tramite le apposite *Porte* fornite e precedentemente. Infine, per l'operazione di salvataggio si farà uso della *Porta* e dell'*Adapter* corrispondente già presenti.

#set heading(numbering: "1.1")
==== Adapter  

L'*Adapter* si occuperà di implementare le *Porte* definite precedentemente, e di esporre quindi i metodi per la comunicazione con il database. Per portare a termine la richiesta farà quindi uso di uno o più *Repository*, *Mappers* ed *Entity*.

#align(center)[
      #image("uml/Adapter.png", height: 20%)
    ]

L'*Adapter* andrà quindi ad implementare le *Porte* precedentemente definite, ed a utilizzare la rispettiva *Repository* per andare a comunicare con il database. Per portare a termine la richiesta farà quindi uso di uno o più *Mappers* ed *Entity*.
Le loro operazioni riguarderanno la possibilità di:
  - *Creare* un nuovo Set di Elementi Domanda, prendendo in input, il nome che si vuole assegnare al Set, e gli id degli Elementi Domanda che si vogliono aggiungere a quest'ultimo.
  - *Recuperare* un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole ottenere.
  - *Recuperare* tutti i Set di Elementi Domanda presenti nel sistema.
  - *Rimuovere* un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole eliminare.
  - *Modificare* il nome di un Set di Elementi Domanda, prendendo in input, il nome del Set che si vuole modificare e il nuovo nome che si vuole assegnare.
  - *Aggiornare* gli Elementi Domanda associati ad un Set, prendendo in input, il nome del Set che si vuole modificare e gli id degli Elementi Domanda che si vogliono sostituire a quelli attualmente assegnati.

Il *Mapper* sarà quindi sempre presente e si occuperà di "tradurre" le *Entity* del database in elementi del dominio quali *SetElementiDomanda* ed *Elementi Domanda*, e viceversa.

=== Database
La struttura del database subirà perciò alcuni cambiamenti, simili a quelli elencati in seguito.

#image("pictures/Artificial_QI_ER_Set.jpg")

#set heading(numbering: "1.1")

=== Caricamento da File
Attualmente gli unici modi disponibili per *inserire* un *Elemento Domanda* o il *Risultato* di un *Test* sono, nel primo caso attraverso l'*inserimento manuale* di domanda e risposta e l'invio di queste ultime alle API. Nel secondo caso invece il Risultato del Test viene *generato automaticamente* dal sistema. Una possibile soluzione potrebbe essere quella di permettere quindi l'inserimento sia di uno o più Elementi Domanda eventualmente raggruppati all'interno di un Set, che di un Risultato di Test, tramite il *caricamento* di un *file*.

==== Controllers
I *Controllers* si occuperanno di fornire tramite *API*, degli endpoint per gestire le richieste HTTP. Per portare a termine la richiesta faranno quindi uso di uno o più *UseCase* definiti precedentemente, ed implementati nei *Services* corrispondenti.
Di seguito vengono quindi elencate le possibili strutture dei vari Controllers.

#set heading(numbering: none)
===== Caricamento Elementi Domanda o Set

#align(center)[
      #image("uml/FileElementiDomandaUploadController.png", height: 15%)
    ]

Questo controller si occuperà di esporre un endpoint per il caricamento di uno o più Elementi Domanda, o di un Set di Elementi Domanda, prendendo in input, il file che contiene gli Elementi Domanda o il Set. Si andrà quindi ad utilizzare gli *UseCase* e i *Service* corrispondenti già presenti, per andare a creare prima gli Elementi Domanda e poi l'eventuale Set.

===== Caricamento Risultato Test

#align(center)[
      #image("uml/FileTestUploadController.png", height: 10%)
    ]
Questo controller si occuperà di esporre un endpoint per il caricamento del Risultato di un Test, prendendo in input, il file che contiene il Risultato. Successivamente andrà quindi a fornire, tramite specifici DTO intermedi, i dati necessari allo *UseCase* e al *Service* corrispondente, per andare quindi ad inserire il nuovo Risultato.

#set heading(numbering: "1.1")
==== Services
I *Services* si occuperanno di implementare gli *UseCase* e realizzare quindi la logica di business. Per portare a termine la richiesta faranno quindi uso di *Porte*, le quali verranno implementate nel o negli *Adapters* corrispondenti.
Di seguito vengono quindi elencate le possibili strutture dei vari Services.

#set heading(numbering: none)
===== Caricamento Risultato Test
#align(center)[
      #image("uml/AddTest.png", height: 7%)
    ]

Questo *Service* si occuperà di eseguire la logica per il caricamento del Risultato di un Test, prendendo in input, il *DTO* riguardante il Risultato da caricare. Si andrà quindi ad aggiungere quest'ultimo tramite la *Porta* e l'*Adapter* corrispondente già presente.

#align(center)[
      #image("uml/RisultatoTestDTO.png", height: 13%)
    ]