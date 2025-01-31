#import "meta.typ": title, abstract, tabelle, keywords, introduzione, casi_uso, descrizione, requisiti, tracciamento

// Funzioni da includere
#import "../functions.typ": table-json
#import "../Glossario/Glossario.typ": glossario-therms 
#import "../functions.typ": inDict 
//INFO DOCUMENTO, appaiono come descrizione del file
#set document(
  title: (title),
  keywords: (keywords)
)
#set text(
  lang: "it"
)

#set list(indent: 1em)
#set enum(indent: 1em)
#show link: underline.with(offset: 3pt)


//SET DELLA PAGINA AUTOMATIZZATO, guardare documentazione per ulteriori customizzazioni
#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod #h(1fr) #title],
)

#set heading(numbering: "1.1")
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}
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

= Introduzione
  #introduzione
  
= Descrizione
  #descrizione

= Casi d'uso
  #casi_uso

= Requisiti
  #requisiti

= Tracciamento
  #tracciamento