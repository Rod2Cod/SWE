#import "../../functions.typ": decisioni

== Verbale
    - autore: Annalisa Egidi
    - verificatore: Alberto Maggion
    - validatore: Luca Calzetta
== Discussione incontro con Cardin
#decisioni(
  [
    1. Lasciare ViewModel evidenziando la presenza
    2. Ulteriore divisione delle singole interfaccie 
  ],
  [Le decisioni sono state prese a seguito dei feedback ricevuto dal professor Cardin in colloquio avuto in data 17/03/2025
  1. è possibile togliere la classe o lasciarla evidenziandola
  2. divisione interfacce per il single responsibility principle]
)
== Correzione documenti (WoW, PdQ,..)
#decisioni(
  [],
  []
)
== Discussione versionamento (WoW)
#decisioni(
  [],
  []
)
== Discussione progettazione
  #decisioni(
  [
    1. cosa caricare con i file (una delle opzioni in modo esclusivo): 
      - al massimo un set
      - elementi domanda disgregati
      - un risultato di un test
    2. All'aggiornamneto di un elemento domanda, se è all'interno di un risultato test, la versione vecchia viene duplicata -> la versione vecchia viene mantenuta con un id diverso, la versione nuova mantiene l'Id originale
  ],
  [
    1. La decisione è stata presa per evitare che il caricamento di un file possa portare a errori di coerenza dei dati
    2. La decisione è stata presa per evitare che le modifiche ad un elemento domanda sia incoerente con i risultati dei test già fatti su quel elemento domanda
  ]
  )
  === Discussione nome classi
  #decisioni(
  [],
  []
  )
  === Discussione Dati API/Controller
  #decisioni(
  [],
  []
  )
  === Discussione operazioni Servizi
  #decisioni(
  [],
  []
  )
  === Discussione operazione Persistence
    ==== Discussione progettazione e implementazione updateElementiDomandaSet
