/*************************************************+**
per utilizzare il template, è necessario utilizzare il file meta.typ che contiene i collegamenti alle parti variabili del template, Questo file non deve essere toccato 
*************************************************+**/

#import "meta.typ": title, date, tabelle
#import "../functions.typ": decisioni
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
#show regex( "r(?i)\b" + glossario-therms.join("\b|")+ "\b"): inDict
//TITOLO
#align(center, text(17pt)[*#title*])

#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
  
  //ABSTRACT
  #set par(justify: true)
  *Abstract* \
  
]

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
  #table(
    align: center,
    fill: (_,y) =>
    if y == 0 {gray.lighten(50%)},
    columns: (auto, auto),
    table.header(table.cell(colspan: 2)[Riferimenti]),
    [S], [Studente],
    [A], [Azienda]
  )
]

= Ordine del Giorno
//ELENCHI NUMERATI
 + Abbandono di un componente del gruppo e riduzione dei requisiti
 + Discussione sull'analisi dei requisiti
 + Presentazione PoC e feedbak a riguardo

= Discussione
== Abbandono di un componente del gruppo e riduzione dei requisiti
  Il gruppo ha informato l'azienda della perdita di un membro e della derivante necessità di ridiscutere i requisiti negoziando al ribasso con l'azienda. 
  Il rappresentante aziendale ha confermato che la rinuncia di un membro non compromette la fattibilità del progetto.
  #decisioni(
  [
    - È stato deciso di mantenere tutti i requisiti obbligatori e di ridurre a opzionali la soglia di accettabilità per quelli desiderabili.
  ],
  [
    - Il gruppo si sente in grado di soddisfare i requisiti obbligatori anche con un membro in meno. 
    - Il contributo più grande da parte del membro ritirato è consistito nella ricerca delle tecnologie e siccome si sono dimostrate soddisfacenti nel PoC probabilmente rimarranno invariate, quindi il gruppo non soffrirà di possibili mancanze di competenze.
  ]
)
== Presentazione dell'analisi dei requisiti aggiornata e feedbak
È stato discusso l’uso delle primitive Extend e Include. Il parere del docente suggerisce che Extend debba essere usato per rappresentare gli errori in quanto modificano il flusso di esecuzione, mentre Include è più adatto per operazioni ricorrenti. È stato concordato di uniformare il modello secondo queste linee guida.
L'analisi dei requisiti presentata, tenendo conto della decisione nel punto precedente, è stata approvata dall'azienda. 
#pagebreak()
== Presentazione PoC e feedbak a riguardo
Un membro del gruppo ha presentato il PoC, sucessivamente il rappresentante aziendale ha provato a porre altre domande più sfidanti all'LLM per testare le valutazioni ottenute. I valori ottenuti si sono dimostrati molto vicini alla aspettative infatti i rappresentanti aziendali si sono mostrati molto soddisfatti del risultato. 
Dalla discussione è emerso che sarebbe utile mostrare oltre alla valutazione finale anche le valutazioni intermedie elaborate poi per ottenere la valutazione finale. 
= Argomenti da discutere in futuro
 Non sono emersi argomenti rimandati.

#align(bottom + right, [
  Referente Aziendale \ \ \ \
  #line(length: 30%)
  ]
)