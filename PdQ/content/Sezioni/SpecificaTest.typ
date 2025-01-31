#let tabelle = "../tabelle.json"
#import "../../../functions.typ": table-json-req

I test svolgono un ruolo fondamentale nel dimostrare che il prodotto rispetta i requisiti indicati nel documento di *Analisi dei Requisiti*.\
Lo *stato* di ciascun test è categorizzato come segue:\
- *I* : Implementato;
- *NI* : Non Implementato.\

== Formato Codice dei Test
Il codice identificativo di ciascun test segue la struttura: \

#align(center)[*T [ Tipologia ] - [ Numero del test ]*]

Dove:

- *T*: acronimo di “Test”;
- *Tipologia*: indica il tipo di test
  - *U*: unità;
  - *I*: integrazione;
  - *S*: sistema;
  - *A*: accettazione;
  - *R*: non regressione.

== Test di Sistema
#table-json-req(json(tabelle).at("Test").at("TestSistema"),4)

== Test di Accettazione
#table-json-req(json(tabelle).at("Test").at("TestAccettazione"),3)
