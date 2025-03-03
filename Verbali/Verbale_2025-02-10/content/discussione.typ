#import "../../functions.typ": decisioni
== Ruoli Verbale
#decisioni(
  [
    - *Autore*: Filippo Bellon
    - *Verificatore*: Annalisa Egidi
    - *Validatore*: Alberto Maggion
  ], []
)


== Discussione tecnologie progetto
Durante la riunione con il prof. Cardin è stato fatto notare al gruppo l'utilizzo di alcune tecnologie piuttosto che altre.
Un primo punto di discussione è stato la possibilità di utilizzo di *Typescript* in sostituzione di *Javascript*. Come sottolineato dal prof. Cardin, Typescript è un linguaggio più robusto e che permette di evitare errori comuni che si possono verificare in Javascript, in particolare sull'utilizzo dei *tipi*. Dopo una discussione interna al gruppo seguita da un'analisi delle esigenze, si è deciso di mantenere l'utilizzo di *Javascript* per lo sviluppo del progetto.
Il secondo punto riguarda l'utilizzo nel progetto delle librerie messe a disposizione dall'applicativo *React*. Il prof. Cardin ha fatto notare come React, essendo appunto una composizione di librerie, *non possiede* un preciso *pattern architetturale*, cosa ritenuta necessaria per fare in modo che il progetto rispetti i requisiti dell'Ingegneria del Software.
Come *alternativa* è stato proposto il framework *VueJS*, che possiede un pattern architetturale ben definito di tipo *MVVM*(Model View ViewModel) e che permette di sviluppare in modo più ordinato e strutturato.\
Dopo una discussione interna al gruppo si è optato per l'utilizzo di VueJS per lo sviluppo del progetto essendo inoltre molto simile a React.
#decisioni(
  [
    - Mantenuto l'utilizzo di *Javascript* per lo sviluppo del progetto
    - Utilizzo di *VueJS* per lo sviluppo del progetto in sostituzione di React
  ],
  [
    - Javascript risulta sufficiente per le esigenze del progetto
    - VueJS risulta più adatto per lo sviluppo del progetto rispetto a React in quanto possiede un pattern architetturale ben definito
    - Alcuni membri del gruppo hanno già esperienza con VueJS
  ]
)


== Definizione nuove revisioni PB e CA
Il gruppo ha discusso la necessità di definire nuove *date* per le *revisioni* rispettivamente di *PB*(Product Baseline) e *CA*(Customer Acceptance). Dopo una discussione è stato deciso di *rimandare* queste decisioni alla fine dell'RTB.
#decisioni(
  [
    - Attendere la *fine* del *RTB* per definire le nuove date delle revisioni PB e CA
  ],
  [
    - Per evitare di dover modificare anche successivamente le date delle revisioni
  ]
)


== Github Issues
Il gruppo si è poi confrontato sulle varie Issues *aperte* e su quelle *da chiudere*. Inoltre ne sono state create delle *nuove* per le attività da svolgere.
*Non sono state prese decisioni*.


== Discussione esito RTB e nuove attività
Come ultimo punto, se è discusso l'esito del primo colloquio RTB svolto con il prof. Cardin. Il gruppo ha ricevuto un *feedback* positivo sul Proof of Concept presentato, tuttavia il documento di Analisi dei Requisiti è stato giudicato *non sufficiente*. Il gruppo si è quindi impegnato a migliorare il documento e a presentare una *versione aggiornata* al prof. Cardin entro il giorno *20 febbraio*.


Durante la riunione sono state inoltre inviate mail al prof. R. Cardin per delucidazioni in merito a commenti ricevuti sul documento di Analisi dei requisiti e al prof. T. Vardanega per richiedere la possibilità di effettuare il colloquio per la seconda parte dell'RTB.
#decisioni(
  [
    - Migliorare il documento di *Analisi dei Requisiti* e presentare una versione aggiornata entro il giorno *20 febbraio*
  ],
  [
    - Il documento è risultato insufficiente
  ]
)



