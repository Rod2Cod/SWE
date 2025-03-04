#import "../../functions.typ": decisioni
== Ruoli verbale
#decisioni(
  [
    - Stesura : Michele Nesler
    - Verifica : Annalisa Egidi
    - Validazione : Luca Calzetta
  ],
  [
    
  ]
)
== Discussione sulla correzione dell'analisi dei requisiti in seguito al feedback del professor Cardin
Discutendo delle modifiche necessarie da apportare all'analisi dei requisiti ci si è accorti che il concetto di "set" e quello di etichetta si sovrapponevano nella loro funzione.
#decisioni(
  [
    - mantenere i set
    - eliminare le etichette
  ],
  [
    - Le etichette assolvono anche alla funzione dei set, quindi tenerli entrambi sarebbe ridondante
    - La funzionalità di maggiore valore aggiunto è quella rappresentata dei set
    - le etichette sarebbero dovute servire a specificare ulteriormente la domanda all'LLM ma poi non erano utilizzate in questo modo in nessun use case
  ]
)
== Esito validazione del documento Way of Working
A seguito della validazione del Way of Working non andata a buon fine è stato fatto notare come mancassero nel documento le sezioni riguardanti la retrospective, pianificazione e preventivo del documento Piano di Progetto e che non è specificato quali metriche vengono utilizzate nel PdQ e come eseguire queste valutazioni. Questo malgrado i processi fossero svolti gia da tempo.
#decisioni(
  [
    - due membri del gruppo hanno preso in carico le issue per aggiungere questi processi
  ],
  [
    
  ]
)