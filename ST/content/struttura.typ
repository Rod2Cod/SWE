== Diagrammi delle classi

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
Il pattern Singleton viene utilizzato per garantire che una classe abbia una sola istanza e fornire un punto di accesso globale a tale istanza. Questo pattern è stato utilizzato per gestire la creazione di un'unica istanza di connessione al database.

=== Strategy
Il pattern Strategy viene principalmente utilizzato per definire una famiglia di algoritmi, incapsularli e renderli intercambiabili. Questo pattern è stato utilizzato per definire le diverse strategie e algoritmi che permettono la valutazione delle domande.

=== Factory Method
Il pattern Factory Method viene utilizzato per definire un'interfaccia per la creazione di un oggetto, ma lascia alle sottoclassi la decisione su quale classe istanziare. Questo pattern è stato utilizzato per la creazione e gestione di dipendenze tramite dependency injection.

=== Decorator
Il pattern Decorator viene utilizzato per aggiungere funzionalità a un oggetto dinamicamente. Questo pattern è stato utilizzato per esempio nella creazione e gestione delle route API del backend.