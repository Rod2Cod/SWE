 //Sezioni da includere del file meta.typ
#import "meta.typ": title, abstract, tabelle, introduzione, calendario_massima, stima_costi, rischi_mitigazioni, pianificazione, preventivo, consuntivo, data

// Funzioni da includere
#import "../functions.typ": table-json, inDict, getLastDocVersion
#import "../Glossario/Glossario.typ": glossario-therms 

#set list(indent: 1em)
#set enum(indent: 1em)
#show regex( "(?i)\b" + glossario-therms.join("\b|\b")+ "\b"): inDict

//FRONTESPIZIO
#import "../frontespizio.typ": show_content
#let versione = getLastDocVersion(tabelle, "PdP")
#show_content(title, data, versione, abstract)

#pagebreak()

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

#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
]

//TABLE OF CONTENTS
#outline(indent: 1em)

#pagebreak()

= Introduzione
  #introduzione

= Calendario di massima del progetto //TODOca
  #calendario_massima

= Stima dei costi di realizzazione 
  #stima_costi

= Rischi attesi e loro mitigazione 
  #rischi_mitigazioni

= Pianificazione
  #pianificazione

= Preventivo
  #preventivo

= Consuntivo
  #consuntivo