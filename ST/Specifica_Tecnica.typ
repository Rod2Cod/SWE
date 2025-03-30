#import "meta.typ": title, abstract, tabelle, keywords, data, introduzione, tecnologie, struttura, api

// Funzioni da includere
#import "../functions.typ": table-json, inDict, getLastDocVersion
#import "../Glossario/Glossario.typ": glossario-therms

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
#show link: underline.with(offset: 2pt)

#show regex( "(?i)\b" + glossario-therms.join("\b|\b")+ "\b"): inDict

//FRONTESPIZIO
#import "../frontespizio.typ": show_content
#let versione = getLastDocVersion(tabelle, "ST")
#show_content(title, data, versione, abstract)

#pagebreak()

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

// funzione per ottenere un elenco puntato con sottoargomenti numerati
#let hierarchical_numbering(..nums) = nums.pos().map(str).join(".")

//TITOLO
#align(center, text(17pt)[*#title*])


#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
]

//TABLE OF CONTENTS
#outline(indent: 1em)

#pagebreak()

= Introduzione
  #introduzione

= Tecnologie
  #tecnologie

= API
  #api

= Struttura
  #struttura