#let show_content(title, date, version, riassunto) = [

  #set page(paper: "a4",
    columns: 1,
    numbering: "1",
    margin: 1cm
  )

  #show image: it => block(
    radius: 50%, clip: true
  )[#it]

  #align(center)[
    #figure(
      image("assets/Rod2Cod_Logo.jpg", width: 30%)
    )
    #text(size: 20pt)[*Rod2Cod*]

    #text(25pt)[*#title*]

    #text(size: 11pt)[#riassunto]

    #text(size: 17pt, style: "italic")[Progetto di Ingegneria del Software \ A.A. 2024/2025]

    #show table.cell.where(x: 0): strong

    #text(size: 12pt)[

      #table(
        columns: 2,
        stroke: (x, y) => (
          if y > 0 {
            if x == 0 {
              (right: 1pt + black) 
            }
          } else if x == 0 {
            (bottom: 1pt + black)
          }
        ),
        align: (x, y) => (
          if y > 0 {
            if x == 0 { right } 
            else if x == 1 { left }
          } else { center }
        ),
        table.header(
          table.cell(colspan: 2)[#text(size: 14pt)[*Informazioni*]]
        ),
        [Versione], [#version],
        [Uso], [Esterno],
        [Data], [#date],
        [Destinatari], [Gruppo Rod2Cod],
        [], [Zucchetti],
        [], [Tullio Vardanega],
        [], [Riccardo Cardin],
        [Responsabile], [Alberto Maggion],
        [Amministratore], [Annalisa Egidi],
        [Verificatori], [Alberto Maggion],
        [], [Annalisa Egidi],
        [], [Filippo Bellon],
        [], [Luca Calzetta],
        [], [Michele Nesler],
        [Autori], [Alberto Maggion],
        [], [Annalisa Egidi],
        [], [Filippo Bellon],
        [], [Luca Calzetta],
        [], [Michele Nesler]
      )
    ]

  ]
]