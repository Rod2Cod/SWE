#import "../../functions.typ": decisioni

== Stesura verbale
La stesura del verbale è stata affidata a Alberto Maggion

== Indice di Gulpease
Avendo scelto di utilizzare tale metrica nel piano di qualifica, è stata discussa la difficoltà nel calcolo della stessa in quanto, per natura dei template utilizzati dei documenti, la sorgente del testo non è unica ma frammentata. Questa frammentazione rende difficile calcolare la metrica a partirfe dai file sorgente dei documenti, in quanto richiede di aggregare il contenuto di diversi file prima di poter procedere con il calcolo.

#decisioni(
  [
    - È stato deciso di ricercare metodi di automazione per il calcolo di tale indice. Tale compito è stato assegnato a Filippo Bellon e Alberto Maggion
  ],
  [
    - Essendo difficoltoso da calcolare a mano a causa della frammentazione dei file sorgente, è stato ritenuto utile ricerccare quantomento un metodo di aggregazione di tutti i file sorgente al fine di rendere più agevole il calcolo della metrica. Se possibile si vorrebbe automatizzare completamente il calcolo della metrica.
  ]
)

== Situazione PdQ
È stato presentato lo stato attuale del Piano di Qualifica, comprese le metriche scelte e le loro motivazioni. Successivamente si è discusso dei possibili test da eseguire sul prodotto al fine di garantire la qualità dello stesso e il rispetto dei vincoli discussi con il proponente. I test individuati non possono essere ancora implementati, mancando ancora una progettazione consolidata del prodotto.
#decisioni(
  [
    - È stato scelto di dividere la ricerca su ulteriori possibili test da integrare tra tutti i membri del gruppo. Tali test andranno poi discussi e aggiunti a quelli già presenti.
  ],
  [
    - La ricerca di tali test da parte di un componente singolo rischia di non essere esaustiva o di richiedere troppe risorse. Dividendo il carico il gruppo pensa di poter essere più efficace e in grado di individuare casi di test maggiori.
  ]
)
