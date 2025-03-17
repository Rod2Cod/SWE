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
  [Utilizzo di italiano e inglese per i nomi delle classi, eventualmente modificando a posteriori],
  [Sono già state scritte la parte di Persistence e Servizi con i nomi in italiano e ingelse]
  )
  === Discussione Dati API/Controller
  Il gruppo si è aggiornato sugli sviluppi, non sono state prese decisioni se non di continuare i lavori.
  === Discussione operazioni Servizi
 Il gruppo ha discusso sulle operazioni da implementare nei servizi e sulla struttura delle classi.
 E' stato deciso di presentare una prima bozza prima della riunione successiva.
  === Discussione operazione Persistence
  Il gruppo ha discusso sul tema senza prendere decisioni ma solo per chiarire i dubbi
    ==== Discussione progettazione e implementazione updateElementiDomandaSet
    #decisioni(
    [
      1. una richiesta per ogni lista
    ],
    [
      1. efficienza con la prospettiva una grande mole di dati
    ]
    )
== Discussione test e automazioni
  === pytest
Il gruppo si è aggiornato riguardo le possibilità di automazione dei test. 
on sono state prese decisioni.
  === docker e web
Il gruppo si è aggiornato sulle metodologie di test.
Non sono state prese decisioni.