== Diagrammi delle classi

== Database
#figure(
  image("../pictures/db/Artificial_QI_ER.jpg"),
  caption: [
    Architettura del database
  ]
)

=== Entità
Il database è composto da 5 entità:
  - *ElementoDomanda*: rappresenta una singola domanda con annessa risposta. È composto da:
    - id: identificativo univoco dell'elemento domanda
    - domanda: testo della domanda
    - risposta: testo della risposta

  - *RisultatoTest*: rappresenta il risultato di un test di valutazione svolto su delle domande. È composto da:
    - id: identificativo univoco del risultato
    - score: punteggio ottenuto dal test
    - LLM: nome dell'LLM a cui vengono poste le domande
    - data: data in cui è stato svolto il test
    - nomeSet: nome del set di domande utilizzato per il test. Questo campo può essere nullo se il test viene svolto su tutte le domande disponibili

  - *RisultatoSingolaDomanda*: rappresenta il risultato ottenuto da una singola domanda all'interno del risultato di un test . È composto da:
    - id: identificativo univoco del risultato
    - idRisultatoTest: identificativo del risultato del test a cui appartiene
    - domanda: testo della domanda testata
    - risposta: testo della risposta testata
    - rispostaLLM: testo della risposta fornita dall'LLM
    - score: punteggio ottenuto dalla domanda
    - risultatoTestId: id del risultato del test a cui si riferisce

  - *RisultatoMetrica*: rappresenta il risultato ottenuto da metrica su un determinato risultato della singola domanda. È composto da:
    - nomeMetrica: nome della metrica
    - score: punteggio ottenuto dalla metrica
    - risultatoDomandaId: id del risultato della singola domanda a cui si riferisce

=== Query
Le operazioni principali che vengono eseguite sul database sono:
- *Inserimento*:
  - di un elemento domanda
  - di un risultato di un test, con conseguente caricamento di risultati delle singole domande e dei relativi risultati delle singole metriche.
- *Ottenimento*:
  - di un elemento domanda o di tutti gli elementi domanda presenti.
  - di un risultato di un test o di tutti i risultati di test presenti. In entrambi i casi, con conseguente ottenimento di risultati delle singole domande e dei relativi risultati delle singole metriche.
  - di un risultato di una singola domanda, con conseguente ottenimento dei risultati delle singole metriche.
- *Eliminazione*:
  - di uno o più elementi domanda
- *Aggiornamento*:
  - di domanda o risposta di un determinato elemento domanda

== Architettura
=== Architettura di Deployment
L'architettura di deployment utilizzata dall'applicativo sia lato client che lato server è di tipo *monolitico*. Questo tipo di architettura porta diversi vantaggi:
- Semplicità di sviluppo
- Facilità di deployment
- Facilità di testing
- Prestazioni migliori

=== Architettura Logica
L'architettura logica dell'applicativo è invece di tipo *esagonale*, il quale permette di *isolare* la logica di business e renderla indipendente da eventuali servizi esterni, con i quali andrà a *comunicare* tramite l'uso di *interfacce* che fungeranno da porte. Questo permette di rendere il sistema più flessibile a comunicazioni con servizi esterni differenti. \

La parte centrale dell'esagono è rappresentata quindi dalla *logica di business*, il quale contiene quindi il dominio del programma. \

Le porte, punto focale di comunicazione con l'esterno, sono rappresentate dalle *interfacce*. Ne distinguiamo di due tipi:
 - Le *Inbound Ports* (o Use Case) saranno quelle utilizzate da attori esterni per comunicare con il sistema. Queste interfacce saranno implementate dal sistema stesso tramite un sistema di API. Esse definiscono quindi i casi d'uso e le operazioni implementate dal sistema.
 - Le *Outbound Ports* saranno invece quelle utilizzate dal sistema stesso per comunicare con attori esterni. \

Gli *Adapters* sono invece le classe che andranno ad implementare in maniera concreta le porte definite dalle interfacce. Queste classi faranno quindi da ponte tramite la logica interna e i servizi esterni. Anche qui ne distinguiamo di due tipi:
- Gli *Inbound Adapters* saranno quelli che implementeranno le interfacce Inbound, andando a definire quindi le operazioni che il sistema dovrà eseguire in base ai casi d'uso.
- Gli *Outbound Adapters* saranno quelli che implementeranno le interfacce Outbound, andando a definire quindi le operazioni che il sistema dovrà eseguire per comunicare con servizi esterni.

== Design Patterns Utilizzati
=== Singleton
Il pattern *Singleton* viene utilizzato per garantire che una classe abbia una sola istanza e fornire un punto di accesso globale a tale istanza. Ciò è utile in casi in cui sia hanno classi diverse che utilizzano un'istanza di un'altra classe in maniera condivisa. Questo pattern è stato utilizzato per gestire la creazione di un'unica istanza di connessione al database.

=== Strategy
Il pattern *Strategy* viene principalmente utilizzato per definire una famiglia di algoritmi, incapsularli e renderli intercambiabili. Questo pattern è stato utilizzato per definire le diverse strategie e algoritmi che permettono la valutazione delle domande.

=== Factory Method
Il pattern *Factory Method* viene utilizzato per definire un'interfaccia per la creazione di un oggetto, ma lascia alle sottoclassi la decisione su quale classe istanziare. Questo pattern è stato utilizzato per la creazione e gestione di dipendenze tramite dependency injection.

=== Decorator
Il pattern *Decorator* viene utilizzato per aggiungere funzionalità a un oggetto dinamicamente, incapsulandolo in un nuovo oggetto che contiene queste funzionalità. Questo pattern è stato utilizzato per esempio per l'"iniezione" delle dipendenze all'interno dei controllers.

=== Dependency injection
Il pattern *Dependency Injection* viene utilizzato per fornire alle classi le loro dipendenze dall'esterno, piuttosto che crearle direttamente al loro interno. Questo approccio migliora la modularità e facilita il testing, permettendo di sostituire facilmente le dipendenze con implementazioni alternative o mock durante i test. \
Nel nostro progetto, la dependency injection è stata utilizzata per gestire la configurazione e l'inizializzazione dei servizi principali, come i repository, i servizi di business e i controllers per la comunicazione con servizi esterni.