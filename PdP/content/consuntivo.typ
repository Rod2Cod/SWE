#import "functions_mod.typ": table-json , costi

#let consuntivi = json("tabelle.json").at("consuntivo")

== Introduzione
 Il consuntivo rappresenta le ore effettivamente svolte nel periodo analizzato. Idealmente coincide con il preventivo dello stesso periodo.\
 Le differenze possono essere dovute a diversi fattori, come un'errata previsione delle disponibilità personali dei componenti o del tempo necessario a portare a termine un lavoro.
  
  Per semplicità verranno usate le stesse abbreviazioni utilizzate nei preventivi:
  - *Res* : Responsabile
  - *Amm* : Amministratore
  - *Ana* : Analista
  - *Ptt* : Progettista
  - *Pre* : Programmatore
  - *Ver* : Verificatore

#pagebreak()

== Requirements and Technology Baseline
  === Primo Periodo 05/11/2024 - 18/11/2024
  *Consuntivo Orario*
    #table-json(consuntivi.at("1"), 8)
    #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c1_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c1_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("1")), 3)
  ],
  [
    #table-json(consuntivi.at("tot1"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c1_budget.png",height: 20%)

  *Retrospective*:
  
La decisione di preventivare molte ore per l'amministratore in questa fase iniziale si è rivelata corretta, ma comunque non sufficiente. La principale fonte di errore infatti è stata l'aspettativa di iniziare già nel primo sprint con l'analisi, che è invece stata sostituita dal settaggio dell'ambiente per la documentazione in Latex e la successiva migrazione a Typst.
Il consiglio ricevuto da compagni di corso più grandi di preventivare già da subito ore all'amministratore si è rivelato corretto.
I costi sono stati in linea con le aspettative, solo leggermente inferiori, questo merito della previsione di "dover ingranare" e quindi non riuscire a svolgere subito molto lavoro.

#pagebreak()

  === Secondo Periodo 19/11/2024 - 02/12/2024
  *Consuntivo Orario*
  #table-json(consuntivi.at("2"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c2_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c2_dist_ore.png",height: 18%)
  ])
  
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("2")), 3)
  ],
  [
    #table-json(consuntivi.at("tot2"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c2_budget.png",height: 20%)
  *Retrospective*:
  
Nel periodo precedente ci eravamo resi conto dell'onerosità del processo di verifica, quindi abbiamo preventivato di conseguenza e si è rivelato corretto. L'esperienza però ci ha spinto durante questa retrospective a cercare un metodo per diminuire il carico di lavoro dovuto alla verifica. Abbiamo individuato una possibile soluzione nel migliorare i template dei documenti, rendendoli più strutturati e automatizzando il glossario. 
#pagebreak()
  === Terzo Periodo 03/12/2024 - 16/12/2024
  *Consuntivo Orario*
  #table-json(consuntivi.at("3"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c3_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c3_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("3")), 3)
  ],
  [
    #table-json(consuntivi.at("tot3"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c3_budget.png",height: 20%)
  *Retrospective*:

  In questo periodo abbiamo capito meglio come rendicontare le ore del responsabile, infatti il tempo speso durante le riunioni sincrone nel fare la retrospective è stato rendicontato a tutti e di conseguenza è risultato maggiore delle aspettative. Avendo iniziato l'analisi dei requisiti ed essendo questo un progetto principalmente di ricerca abbiamo messo in conto molte ore all'analista. Questa previsione si è rivelata corretta anche se le ore si sono spalmate tra i membri in modo diverso dalle aspettative, questo è dovuto alla nostra inesperienza nel valutare a priori la durata delle specifiche issue. Abbiamo deciso di non adottare alcun comportamento migliorativo, dato che la previsione si è rivelata in generale corretta.
  #pagebreak()
  === Quarto periodo 17/12/2024 - 30/12/2024
  *Consuntivo Orario*
  #table-json(consuntivi.at("4"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c4_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c4_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("4")), 3)
  ],
  [
    #table-json(consuntivi.at("tot4"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c4_budget.png",height: 20%)
  *Retrospective*:

  Le previsioni si sono rivelate in generale corrette, infatti avevamo previsto di fare quasi solamente analisi in questo periodo e così è stato. In particolare le due attività sincrone per la discussione dei casi d'uso hanno richiesto molto tempo, ma abbiamo ricevuto conferma dal professore che la modalità che abbiamo scelto è valida. Nello specifico abbiamo stilato il primo caso d'uso sincronicamente come attività di allineamento delle conoscenze, per poi dividerci i casi d'uso da fare in modo asincrono e successivamente unirli in un unico documento coerente, nuovamente in una riunione sincrona.\
  Malgrado le buone premesse i problemi maggiori li abbiamo riscontrati nel redigere i diagrammi UML dei casi d'uso, infatti avevamo finito gli argomenti di discussione a riguardo quando abbiamo presentato l'analisi dei requisiti all'azienda. L'azienda però ci ha spiegato un modo differente di utilizzare la simbologia UML, perciò abbiamo aggiornato l'analisi con i consigli ricevuti e chiesto conferma al professore durante una riunione. Il professore ci ha fatto notare che l'azienda utilizza convenzioni diverse da quelle spiegate in classe e che la soluzione sta nel trovare un accordo su quale usare. Per cui abbiamo riaggiornato l'Analisi dei requisiti utilizzando le convenzioni a noi più familiari discusse in classe e programmato di chiedere all'azienda se fosse d'accordo con la nostra decisione.
  #pagebreak()
  === Quinto periodo 31/12/2024 - 13/01/2025
  *Consuntivo Orario*
  #table-json(consuntivi.at("5"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c5_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c5_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("5")), 3)
  ],
  [
    #table-json(consuntivi.at("tot5"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c5_budget.png",height: 20%)
  *Retrospective*:
  In questo periodo ci siamo concentrati sullo sviluppo del PoC. La principale fonte di problemi è stato il set up del container docker, che oltre alle singole configurazioni per ogni singolo ambiente come frontend, backend e database, è stato necessario configurare e gestire al meglio l'infrastruttura di rete, per rendere possibile la comunicazione tra i container, attraverso una rete interna a docker, ed evitando di passare dalla macchina host. 
#pagebreak()
  === Sesto periodo 14/01/2025 - 27/01/2025
  *Consuntivo Orario*
  #table-json(consuntivi.at("6"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c6_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c6_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("6")), 3)
  ],
  [
    #table-json(consuntivi.at("tot6"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c6_budget.png",height: 20%)
  *Retrospective*:

In questo periodo abbiamo definito con l'azienda quale convenzione utilizzare per la stesura degli UML dei casi d'uso come avevamo deciso nel quarto periodo, la quale ha accettato la nostra proposta. Abbiamo poi presentato l'analisi dei requisiti e il PoC all'azienda che si è dimostrata entusiasta. Dal confronto abbiamo colto che mostrare le valutazioni assegnate da ogni metrica oltre alla valutazione finale aggiunge molto valore al prodotto. La principale difficoltà incontrata durante questo periodo è risultata stimare le ore disponibili che ogni membro avrebbe potuto investire nel progetto, infatti abbiamo avuto gli esami. Oltre a questa difficoltà, colmabile nel tempo con l'esperienza, abbiamo individuato come concausa una generale timidezza nei membri del gruppo nel dichiarare di non essere in grado di completare tutti i compiti presi a carico. Essendo stata una problematica diffusa e riconosciuta da ognuno nel gruppo, abbiamo riconosciuto come utile a fare stime veritiere piuttosto che vergognoso dichiarare i propri impegni e le proprie difficoltà nel portare a termine i compiti.
Per questo il costo del periodo è risultato molto più basso di quello preventivato.


#pagebreak()
=== Settimo periodo 28/01/2025 - 10/02/2025
  *Consuntivo Orario*
  #table-json(consuntivi.at("7"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c7_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c7_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("7")), 3)
  ],
  [
    #table-json(consuntivi.at("tot7"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c7_budget.png",height: 20%)
  *Retrospective*:
  Durante questo periodo abbiamo ultimato i documenti per l' RTB che abbiamo presentato. Abbiamo poi atteso il responso da parte dei professori, che una volta ricevuto ci ha portato a iniziare a correggere l'analisi dei requisiti. I principali problemi che abbiamo avuto infatti riguardano proprio questa correzione, visto che ci avevamo già ragionato a fondo e la ritenevamo corretta. Per ovviare a questi abbiamo prima fatto una riunione sincrona per ragionarci e poi abbiamo deciso di studiare nuovamente in maniera asincrona questi argomenti, per tornare a correggere l'analisi dei requisiti con maggiore consapevolezza. Inoltre abbiamo sbagliato a programmare l'inizio della progettazione, non considerando i tempi di correzione per l'RTB e le eventuali modifiche da apportare in caso di esito negativo.


#pagebreak()

=== Ottavo periodo 11/02/2025 - 24/02/2025
  *Consuntivo Orario*
  #table-json(consuntivi.at("8"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c8_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c8_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("8")), 3)
  ],
  [
    #table-json(consuntivi.at("tot8"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c8_budget.png",height: 20%)
  *Retrospective*:
  Durante questo periodo abbiamo ultimato i preparativi per l'ultimo colloquio dell'RTB e apportato alcune correzioni al PdP e PdQ, come suggerito dalle valutazioni ricevute. A differenza di quanto preventivato per il periodo, non è stato svolto il lavoro di progettazione, in quanto abbiamo nuovamente sottostimato i tempi necessari alla conclusione dell'RTB.\
  Durante questo periodo ci siamo anche resi conto che non avevamo tante ore a disposizione a causa degli impegni dovuti alla sessione di esami. Questo ci ha portato a non poter lavorare come avremmo voluto sul progetto, ma abbiamo comunque cercato di sfruttare al meglio il tempo a disposizione.
#pagebreak()



=== Nono periodo 25/02/2025 - 10/03/2025
  *Consuntivo Orario*
  #table-json(consuntivi.at("9"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/c9_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/c9_dist_ore.png",height: 18%)
  ])
  *Consuntivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(consuntivi.at("9")), 3)
  ],
  [
    #table-json(consuntivi.at("tot9"), 4)
  ]
)
  *Grafico a torta del budget speso e rimanente al termine del periodo.*
  #image("Graphs/c9_budget.png",height: 20%)
  *Retrospective*:
  Durante questo periodo abbiamo iniziato la fase di progettazione, abbiamo definito un prototipo di schema uml che poi abbiamo presentato sia all'azienda per ottenere feedback utili il prima possibile ed implementarli immediatamente. Abbiamo presentato il prototipo anche al professore espoponendogli i nostri principali dubbi. Questo è stato molto utile perche come ci aspettavamo essendo la prima volta che svolgiamo questo compito non ne avevamo compreso alcuni aspetti. I problemi principali li abbiamo riscontrati nella progettazione dei componenti per l'upload di domande e test da file. Discutendone insieme siamo riusciti a tenere in considerazione tutti gli aspetti che singolarmente non si era riusciti a tenere a mente, e a trovare una soluzione adatta.
#pagebreak()