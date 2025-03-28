
== Scopo dell'applicativo
L'applicativo ha l'obbiettivo di fornire uno strumento per facilitare il confronto per ogni domanda tra la risposta attesa con una risposta ricevuta da un LLM. 
== Requisiti minimi di sistema
   - Versione Browser Chrome : 133
   - Sandard API LLM : OpenAPI 3.1

   Qualora questi requisiti non fossero rispettati il completo funzionamento dell'applicativo non è garantito.

== Installazione




== Funzionalità disponibili
=== Navigazione 
La barra di navigazione, premendo sugli appositi link permette di passare da una pagina ad un altra. 

Le pagine disponibili sono: 
 - Home : contiene una panoramica dell'applicativo
 - Domande : permette di visualizzare, modificare, aggiungere ed eliminare gli elementi domanda presenti nel sistema.
 - Test : permette di avviare un test, visualizzarne l'avanzamento durante l'esecuzione e visualizzarne i risultati al termine/* da verificare */
=== Visualizzazione, Inserimento, Modifica e Cancellazione elementi domanda
Le seguenti funzionalità sono disponibili nella pagina "Domande".
==== Visualizzazione
Vengono visualizzati tutti gli elementi domanda. La domanda è in grassetto, la relativa risposta è subito sottostante alla domanda.
==== Inserimento 
Cliccando sul bottone "+" compaiono due box per l'inserimento della domanda e della relativa risposta attesa. Inserendo del testo in entrambi i box e cliccando il bottone "conferma" l'elemento domanda viene inserito nel sistema.
==== Modifica
Cliccando sull icona rappresentante la matita compaiono due box contenenti il testo della domanda e della risposta attesa. Modificando il testo nei box e premendo il bottone "conferma" l'elemnto domanda viene aggiornato.
==== Cancellazione 
Ciccando sul bottone "x" corrispondentemente ad ogni elemento domanda compare una checkbox. Premendo sulla checkbox l'elemento viene selezionato, premendo nuovamente si annulla la selezione dell'elemento domanda. Selezionando gli elementi domanda che si vogliono eliminare e poi premendo il bottone "conferma" verranno eliminati dal sistema tutti gli elementi domanda selezionati.

=== Avvio, Visualizzazione Avanzamento e Risualtato di un test 
Le seguenti funzionalità sono disponibili nella pagina "Test".
==== Avvio di un Test
Per avviare un test bisogna premere sul bottone "avvia"
====  Visualizzazione Avanzamento di un test 
Una volta avviato il test viene visualizzata una barra di avanzazmento che rappresenta lo stato di avanzamento del test. 
==== Visualizzazione risultati Test
Una volta completato il test viene visualizzato il risualtato comprendente :
 - data di esecuzione
 - score generale 
 - LLM utilizzato
 - lista di domande con relativa valutazione ordinate in modo decrescente rispetto alla valutazione

Cliccando su ogni domanda è possibile vederne i risultati per estesto. 
Essi comprendono : 
 - domanda
 - risposta attesa
 - risposta ricevuta dall'LLM
 - Score domanda
 - Score parziale per ogni metrica utilizzata, con relativo nome della metrica
