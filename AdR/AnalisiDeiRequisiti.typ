#import "meta.typ": title, tabelle, keywords, introduzione, casi_uso, descrizione, requisiti, tracciamento, data

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

#set heading(numbering: "1.1")

//Per mostrare i capitoli dell'outline in grassetto
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}
#show regex( "r(?i)\b" + glossario-therms.join("\b|")+ "\b"): inDict

//FRONTESPIZIO
#let riassunto = "Il documento definirà sia i *casi d'uso*, sia i *requisiti funzionali*, di *qualità* e di *vincolo* delle applicazioni che andranno sviluppate nel corso del progetto riguardante il capitolato scelto: Artificial QI."
#import "../frontespizio.typ": show_content
#show_content(title, data, "1.0", riassunto)

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