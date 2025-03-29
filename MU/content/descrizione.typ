
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
#align(center)[
      #image("IMG/navbar.png", height: 4%)
    ]
Le pagine disponibili sono: 
 - Home : contiene una panoramica dell'applicativo
 - Domande : permette di visualizzare, modificare, aggiungere ed eliminare gli elementi domanda presenti nel sistema.
 - Test : permette di avviare un test, visualizzarne l'avanzamento durante l'esecuzione e passare alla pagina di visualizzazione dei risultati al termine
 - Storico : permette di visualizzare la sintetica di tutti i test effettuati in precedenza.

=== Visualizzazione, Inserimento, Modifica e Cancellazione elementi domanda
Le seguenti funzionalità sono disponibili nella pagina "Domande".
==== Visualizzazione
Vengono visualizzati tutti gli elementi domanda. La domanda è in grassetto, la relativa risposta è subito sottostante alla domanda.
#align(center)[
      #image("IMG/domande.png", height: 20%)
    ]
==== Inserimento 
Cliccando sul bottone #box(image("IMG/+.png", height: 2%)) compaiono due box per l'inserimento della domanda e della relativa risposta attesa. Inserendo del testo in entrambi i box e cliccando il bottone #box(image("IMG/invia.png", height: 2%)) l'elemento domanda viene inserito nel sistema.
#align(center)[
      #image("IMG/aggiungiDomanda.png", height: 20%)
    ]
==== Modifica

Cliccando sull icona #box(image("IMG/matita.png", height: 2%)) compaiono due box contenenti il testo della domanda e della risposta attesa. Modificando il testo nei box e premendo il bottone #box(image("IMG/salvaM.png", height: 2%)) l'elemnto domanda viene aggiornato. Premendo il bottone #box(image("IMG/annulla.png", height: 2%)) la modifica non viene effettuata.
#align(center)[
      #image("IMG/modificaDomanda.png", height: 20%)
    ]
==== Cancellazione 
Ciccando sul bottone #box(image("IMG/elimina.png", height: 2%)) compare una checkbox corrispondentemente ad ogni elemento domanda. Premendo sulla checkbox l'elemento viene selezionato, premendo nuovamente si annulla la selezione dell'elemento domanda. Selezionando gli elementi domanda che si vogliono eliminare e poi premendo il bottone #box(image("IMG/confermaEliminaD.png", height: 2%)) verranno eliminati dal sistema tutti gli elementi domanda selezionati, altrimenti premendo il bottone #box(image("IMG/annullaEliminaD.png", height: 2%)) l'operazione di cancellazione verrà annullata.
#align(center)[
      #image("IMG/checkboxEliminaD.png", height: 20%)
    ]

=== Avvio, Visualizzazione Avanzamento, fine test e visualizzazione Risualtati di un test 
Le seguenti funzionalità sono disponibili nella pagina "Test".
#align(center)[
      #image("IMG/test.png", height: 20%)
    ]
==== Avvio di un Test
Ciccando sul bottone #box(image("IMG/iniziaTest.png", height: 2%)) il test viene avviato.
====  Visualizzazione Avanzamento di un test 
Una volta avviato il test viene visualizzata una barra di avanzazmento che rappresenta lo stato di avanzamento del test. 
#align(center)[
      #image("IMG/testBar.png", height: 5%)
    ]
==== Fine del Test
Una volta completato il test viene visualizzata la seguente schermata:
#align(center)[
      #image("IMG/fineTest.png", height: 20%)
    ]
Cliccando sul bottone #box(image("IMG/vaiRisultato.png", height: 2%)) si entra nella scermata di visualizzazione dei risultati del test.
==== Visualizzazione risultati test
Viene visualizzata la seguente schermata:
#align(center)[
      #image("IMG/risultatoTest.png", height: 35%)
    ]
 il risualtato comprendente :
 - data di esecuzione
 - punteggio generale 
 - LLM utilizzato
 - lista di domande con relativa valutazione ordinate in modo decrescente rispetto alla valutazione. Ogni domanda comprende :
      - domanda
      - risposta attesa
      - risposta ricevuta dall'LLM
      - punteggio domanda
      - nome delle metriche utilizzate con relativo Score parziale 
=== Storico Test
In questa pagina è possibile visualizzare sinteticamente tutti i test effettuati. 
Ogni riquadro si riferisce ad un test.
#align(center)[
      #image("IMG/storico.png", height: 20%)
    ]