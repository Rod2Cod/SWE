/*************************************************+**
per utilizzare il template, è necessario utilizzare il file meta.typ che contiene i collegamenti alle parti variabili del template, Questo file non deve essere toccato 
*************************************************+**/

// Funzioni da includere
#import "../functions.typ": table-json

#set page(paper: "a4",
    columns: 1,
    numbering: "1",
    margin: (top: 2cm, right: 2cm, bottom: 2cm, left: 2cm),
)

#set text(
    lang: "it",
    size: 13.5pt
)

#show heading: set block(below: 0.5cm, above: 1cm)

#show image: it => block(
  radius: 50%, clip: true
)[#it]

#align(center)[

  #figure(
    image("../assets/Rod2Cod_Logo.jpg", width: 30%)
  )
  #text(size: 30pt)[*Rod2Cod*]

  #block(above: 1.5cm)[
    #text(25pt)[*Candidatura per la revisione \ Product Baseline*]
  ]

  #block(above: 1.5cm)[
    #text(size: 15pt)[Annalisa Egidi \ Alberto Maggion \ Filippo Bellon \ Michele Nesler \ Luca Calzetta]
  ]

  #block(above: 1cm)[
    #text(size: 15pt, )[rod2cod\@gmail.com]
  ]

  #block(above: 1cm)[
    #text(size: 15pt)[10 Aprile 2025]
  ]

]

#block(above: 3cm)[

  = Candidatura
  Con la presente, il gruppo _Rod2Cod_ intende candidarsi per la seconda parte della revisione _Product Baseline_.

  = Risorse
  La documentazione e il materiale prodotto è disponibile al seguente indirizzo: \ #underline(offset: 0.15cm)[https://rod2cod.github.io/SWE/]

  La documentazione da sottoporre a valutazione comprende:
  - Analisi dei Reqisiti alla versione ;
  - Glossario alla versione ;
  - Manuale Sviluppatore alla versione ;
  - Manuale Utente alla versione ;
  - Piano di Progetto alla versione ;
  - Piano di Qualifica alla versione ;
  - Specifica Tecnica alla versione ;
  - Way of Working alla versione ;
  - Verbali interni;
  - Verbali esterni.


  = Aggiornamento impegni
  Il gruppo _Rod2Cod_, in seguito alla riunione interna del 07/04/2025, ha deciso di
  terminare lo sviluppo del progetto con la suddetta revisione, rinunciando
  alla possibilità di prendere parte alla revisione _Customer Acceptance_.
 = Aggiornamento costi
  Rispetto al budget iniziale preventivato di 11495€, il gruppo è riuscito a
  rispettare gli accordi presi con una spesa finale di € (rimanendo sotto
  il tetto massimo di spesa di €).
  Per quanto riguarda le ore di attività, ogni membro del gruppo, a inizio
  progetto, aveva preventivato di rimanere entro un tetto massimo di 90 ore
  (per un totale collettivo di 540 ore). In seguito all'abbandono del gruppo da parte di Alessandro Rossi il gruppo ha deciso di sopperire alla sua mancanza aumentando di 5 ore l'impengo previsto dei restanti membri considerando di riuscire a soddisfare in questo modo tutti i requisiti obbligatori. Sono stati invece negoziati i requisiti desiderabili, tramutandoli in facoltativi. 
  Di seguito, una tabella riassuntiva in merito alle ore impiegate dai singoli
  membri del gruppo.

  #align(center)[
    #table(
      columns: 2,
      fill: (_,y) => if y == 0 or y >= 7  {gray.lighten(50%)},
      table.header(
        [*Membro*], [*Ore Impiegate*]
      ),
      [Filippo Bellon],[95],
      [Annalisa Egidi],[95],
      [Michele Nesler], [95],
      [Luca Calzetta], [95],
      [Alberto Maggion], [95],
      [Alessandro Rossi], [28,5],
      [Totale],[503,5],
      [Rimanenti],[36,5]
    )
  ]
]

#align(right)[
  #block(above: 2.5cm)[
    Michele Nesler \
    _Responsabile di Progetto_ \
    _10 Aprile 2025_
  ]
]
