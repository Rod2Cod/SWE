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
    #text(25pt)[*Candidatura per la revisione Requirements and Technology Baseline*]
  ]

  #block(above: 1.5cm)[
    #text(size: 15pt)[Annalisa Egidi \ Alberto Maggion \ Filippo Bellon \ Michele Nesler \ Luca Calzetta]
  ]

  #block(above: 1cm)[
    #text(size: 15pt, )[rod2cod\@gmail.com]
  ]

  #block(above: 1cm)[
    #text(size: 15pt)[24 Febbraio 2025]
  ]

]

#block(above: 3cm)[

  = Candidatura
  Con la presente, il gruppo _Rod2Cod_ intende candidarsi per la seconda parte della revisione _Requirements and Technology Baseline_.

  = Risorse
  La documentazione e il materiale prodotto è disponibile al seguente indirizzo: \ #underline(offset: 0.15cm)[https://rod2cod.github.io/SWE/]

  = Aggiornamento revisioni
  #align(center)[
    #table(
      columns: 2,
      fill: (_,y) => if y == 0 {gray.lighten(50%)},
      table.header(
        [*Revisione*], [*Data*]
      ),
      [_Product Baseline_],[04/04/2025],
      [_Customer Acceptance_],[07/04/2025]
    )
  ]
]

#align(right)[
  #block(above: 2.5cm)[
    Annalisa Egidi \
    _Responsabile di Progetto_ \
    _24 Febbraio 2025_
  ]
]
