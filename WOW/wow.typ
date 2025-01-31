//Sezioni da includere del file meta.typ
#import "meta.typ": title, abstract, tabelle, contenuto
#import "../Glossario/Glossario.typ": glossario-therms 
#import "../functions.typ": inDict 

// Funzioni da includere
#import "../functions.typ": table-json

#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod  #h(1fr) #title],
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
#show link: underline.with(offset: 2pt)


#show regex( "r(?i)\b" + glossario-therms.join("\b|")+ "\b"): inDict


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

//TABLE OF CONTENTS
#outline(indent: 1em)
#pagebreak()

#contenuto