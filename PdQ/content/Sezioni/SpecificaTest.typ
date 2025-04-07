#let tabelle = "../tabelle.json"
#import "../../../functions.typ": table-json-rev

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

- *Applicativo*: indica l'applicativo a cui il test è associato
  - *B*: back-end
  - *F*: front-end

== Test di Unità
Servono a verificare il corretto funzionamento di una singola parte autonoma del progetto.
#table-json-rev(json(tabelle).at("Test").at("TestUnita"),4)

== Test di Integrazione
Servono a verificare che le singole componenti interagiscano correttamente tra loro.
#table-json-rev(json(tabelle).at("Test").at("TestIntegrazione"),4)

== Test di Sistema
Servono a verificare che il comportamento del sistema sia conforme a quanto stabilito con il proponente.
#table-json-rev(json(tabelle).at("Test").at("TestSistema"),5)

== Test di Accettazione
Servono a verificare, insieme al committente, che il prodotto finale soddisfi tutti i requisiti.
#table-json-rev(json(tabelle).at("Test").at("TestAccettazione"),4)