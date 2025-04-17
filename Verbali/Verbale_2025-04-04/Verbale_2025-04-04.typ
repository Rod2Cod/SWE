/*************************************************+**
per utilizzare il template, è necessario utilizzare il file meta.typ che contiene i collegamenti alle parti variabili del template, Questo file non deve essere toccato 
*************************************************+**/

#import "meta.typ": title, date, abstract, discussione, tabelle, segretario

// Funzioni da includere
#import "../functions.typ": table-json
#import "../../Glossario/Glossario.typ": glossario-therms
#import "../functions.typ": inDict 
// Inizio template
#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod  #h(1fr) Data: #date.display() #h(1fr) #title],
)
#set heading(numbering: "1.1")
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}

#set list(indent: 1em)
#set enum(indent: 1em)

//TITOLO
#align(center, text(17pt)[*#title*])

#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
  
  //ABSTRACT
  #set par(justify: true)
  *Abstract* \
  #abstract
]
#show regex( "(?i)\b" + glossario-therms.join("\b|\b")+ "\b"): inDict
//TABLE OF CONTENTS
#outline(indent: 1em)
#pagebreak()

= Presenze
#columns(2)[
  #table-json(json(tabelle).at("presenze"),4)
  #colbreak()
  #table(
    align: center,
    fill: (_,y) =>
    if y == 0 {gray.lighten(50%)},
    columns: (auto, auto),
    table.header(table.cell(colspan: 2)[Presenze]),
    [P], [Presente],
    [A], [Assente]
  )
]


= Ordine del Giorno
  + Presentazione MVP

= Discussione
#discussione

#align(bottom + right, [
  Referente Aziendale \ \ \ \
  #line(length: 30%)
  ]
)