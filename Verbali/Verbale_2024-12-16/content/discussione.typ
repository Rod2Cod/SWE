#import "../../functions.typ": decisioni


== Stesura verbale

Per la stesura di questo verbale è stato designato *Luca Calzetta*.

== Diario di bordo

Il diario di bordo della settimana scorsa deve ancora essere presentato. Ma comunque è stato deciso il successore. Il diario di bordo del 08 gennaio 2025 verrà scritto e presentato da *Michele Nesler*

== Proposte modifiche analisi dei requisiti e visione uml

Durante la riunione sono state nuovamente discusse diverse opinioni in merito all’analisi dei requisiti, con un’attenzione particolare alla sezione dedicata ai casi d’uso (UC) e al relativo diagramma UML. Su quest’ultimo, un membro del gruppo ha presentato una prima versione, fornendo così una base di partenza per l’individuazione delle interazioni tra gli attori e il sistema. Durante il confronto, tuttavia, sono emersi alcuni dubbi che dovranno essere chiariti prima di poter considerare completa l’analisi dei requisiti. Inoltre, è stata sollevata la questione delle diverse versioni di sistema su cui il nostro software dovrà essere in grado di funzionare. 

  #decisioni(
  [
    - Stilare una serie di domande da porre al professor Cardin, al fine di ottenere maggiori chiarimenti.
    - Aggiungere una sezione dedicata alle diverse versioni dei sistemi su cui il nostro software dovrà essere eseguito.
  ],
  [
    - Chiarire alcuni dubbi e ambiguità al fine di completare l’analisi dei requisiti. In particolare, i dubbi riguardano l’UC5: ha senso includerlo in altri UC, tenendo presente che ciò potrebbe introdurre vincoli per questi ultimi? Inoltre, un ulteriore dubbio riguarda gli UC relativi alla gestione degli errori: è opportuno gestirli tramite un unico UC, denominato “errore generico”, oppure è necessario specificarli singolarmente per ogni UC?
    - Dal momento che il capitolato, e quindi l’azienda, non ci impone alcun vincolo di questo tipo, abbiamo ritenuto opportuno specificare comunque questa informazione nell’analisi dei requisiti.
  ]
)

== Automatizzazione del sistema di ticketing 

Durante l’ultimo periodo sono state svolte diverse ricerche per automatizzare i ticket in funzione del completamento delle issue su GitHub. Durante la riunione si è discusso di questo aspetto ed è stata presa una decisione in merito.

#decisioni(
  [
    - Non automatizzare il sistema di ticketing in base alle issue.
  ],
  [
    - Dopo alcune settimane di ricerca, abbiamo concluso che, per poter implementare questa forma di automazione, sarebbero necessarie risorse esterne e ulteriore lavoro di sviluppo. Pertanto, riteniamo che non ne valga la pena per questo progetto e che i ticket dovranno essere spostati manualmente una volta chiusa un’issue.
  ]
)

== Diagrammi di Gantt

Dopo aver condotto diverse ricerche sull’argomento e aver valutato varie soluzioni alternative, è stato proposto e presentato il sistema di diagrammi integrato nelle board di GitHub. 

#decisioni(
  [
    - Utilizzare i diagrammi di Gantt forniti da GitHub
  ],
  [
    - Dopo averne discusso, abbiamo deciso di adottare questo sistema di diagrammi poiché, utilizzando già GitHub e le sue board come sistema di ticketing, risulta più rapido e intuitivo sfruttare gli strumenti integrati nello stesso ambiente.
  ]
)

== Creazione template per le issue dei verbali

Un componente del gruppo ha creato un template da utilizzare al momento della creazione delle issue dedicate ai verbali.

#decisioni(
  [
    - Utilizzare l’apposito template per la creazione delle issue sui verbali.
  ],
  [
    - Uniformare le issue riguardanti questo tema, in modo da garantire coerenza e facilitare la gestione delle informazioni.
  ]
)

= Restituzione lavoro individuale

Durante la settimana sono state svolte diverse attività di ricerca e di completamento della documentazione:

- È stata proseguita la stesura di alcuni documenti, tra cui l’Analisi dei Requisiti, il Manuale dello Sviluppatore, il Glossario e il Piano di Progetto.
- È stata presentata una ricerca su GitHub riguardante l’automazione dei ticket che ha portato alla decisione già riportata nel verbale precedente.
- È stato creato il template per le issue relative ai verbali.
- È stata presentata una nuova ricerca sulle metriche: in particolare, sono stati discussi diversi modelli in grado di valutare frasi restituendo uno score. Due modelli, i quali utilizzano approcci differenti nella valutazione, sono stati mostrati in azione e messi a confronto. Dai test effettuati, RoBERTa è emerso come il modello con la valutazione più accurata, rispondendo positivamente a vari test, tra cui la negazione di una frase o la modifica di una singola parola.
- Infine, è stato presentato LM Studio, integrato con le API. È stata individuata una soluzione che consente di avere tutti i modelli desiderati in un unico luogo, rendendoli accessibili tramite API. Durante la riunione, è stato mostrato l’utilizzo del software LM Studio, spiegandone brevemente il funzionamento e fornendo dimostrazioni di interazione con i modelli tramite API.