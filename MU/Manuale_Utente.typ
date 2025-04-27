#import "meta.typ": title, tabelle, keywords, introduzione, descrizione, data, abstract

// Funzioni da includere
#import "../functions.typ": table-json, inDict, getLastDocVersion, printDict,
#import "GlossarioUtente.typ": glossario-therms, glossario

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

#set heading(numbering: "1.1")

//Per mostrare i capitoli dell'outline in grassetto
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}

//FRONTESPIZIO
#import "../frontespizio.typ": show_content
#let versione = getLastDocVersion(tabelle, "MU")
#show_content(title, data, versione, abstract)

#pagebreak()

//SET DELLA PAGINA AUTOMATIZZATO, guardare documentazione per ulteriori customizzazioni
#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod #h(1fr) #title],
)

#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
]

//TABLE OF CONTENTS
#outline(indent: 1em)

#pagebreak()
#[
#show regex( "(?i)\b" + glossario-therms.join("\b|\b")+ "\b"): inDict
= Introduzione
  #introduzione
  
= ArtificialQI
  #descrizione
]


= Glossario Utente
#[
#set heading(numbering: none)
#printDict(glossario)
]
  

