== Introduzione
  La seguente sezione contiene la *descrizione* dei casi d’uso relativi all’applicativo sviluppato. Sono classificati come '*UC*' e seguiti da uno o più numeri separati da un punto. Questo punto indica la *successione gerarchica* dei casi d’uso se questo è esplicitamente espresso dal punto 'Generalizzazioni' del caso d’uso padre, altrimenti indica un *sottocaso d’uso*, ovvero un caso d’uso che aggiunge *dettagli* al caso d’uso principale.
  
  Nei casi d'uso che rimangono generali, senza specificare in modo dettagliato alcuni aspetti della funzionalità l'azienda ha espresso la volontà di lasiciare al team di sviluppo totale libertà di decisione sui dettagli, in quanto non portatori di grande valore aggiunto.

== Attori
  Il sistema comunica con due attori diversi: 
  - l'*utente*, come attore principale che interagisce direttamente con esso.
  - un *LLM*, come attore secondario che viene richiamato indirettamente. 
  Non viene richiesta l'autenticazione dell'utente.

== Elenco dei casi d'uso

#set heading(numbering: none)

  === UC1: Visualizzazione domande e risposte
    #align(center)[
      #image("UML/UC1.png", height: 13%)
    ]
    
  - *Descrizione*: L’utente vuole poter visualizzare le domande e le risposte presenti
  - *Scenario*:
    - L’utente seleziona l’opzione di visualizzazione delle domande e delle relative risposte;
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Vengono visualizzate le domande presenti o una lista vuota
  #pagebreak()

  === UC2: Modifica domanda
#align(center)[
      #image("UML/UC2.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter modificare una domanda da porre nel test
  - *Scenario*:
    - L’utente seleziona l’opzione di modifica domanda
    - L’utente seleziona una domanda da modificare
    - L’utente modifica la domanda
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La domanda modificata viene salvata correttamente
  - *Scenari alternativi*:
    - Annullamento modifica domanda (UC23)

  === UC3: Modifica risposta attesa
  #align(center)[
      #image("UML/UC3.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter modificare una risposta associata ad una delle domande da porre nel test
  - *Scenario*:
    - L’utente seleziona l’opzione di modifica domanda
    - L’utente seleziona una domanda da modificare
    - L’utente modifica la risposta associata alla domanda
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La risposta alla domanda selezionata viene salvata correttamente
  - *Scenari alternativi*:
    - Annullamento modifica risposta attesa (UC24)

  === UC4: Eliminazione domanda e risposta attesa
  #align(center)[
      #image("UML/UC4.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter eliminare una domanda da porre nel test
  - *Scenario*:
    - L’utente seleziona l’opzione di eliminazione domanda
    - L'utente seleziona una o più domande
    - L'utente conferma l'eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*: 
    - La domanda viene eliminata correttamente
  - *Scenari alternativi*:
    - Annullamento eliminazione domanda e risposta attesa (UC25)

  === UC5: Aggiunta di domanda e risposta
  #align(center)[
      #image("UML/UC5.png", height: 23%)
    ]
  - *Descrizione*: L’utente vuole poter aggiungere almeno una domanda e relativa risposta attesa
  - *Scenario*:
    - L'utente seleziona l'opzione per aggiungere una domanda
    - L'utente aggiunge una o più domande
    - L'utente conferma l'aggiunta
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Almeno una domanda e la relativa risposta vengono inserite nel sistema
  - *Generalizzazioni*:
    - Aggiunta manuale di domanda e risposta (UC5.1)
    - Aggiunta di domande da file strutturato (UC5.2)

  ==== UC5.1: Aggiunta manuale di domanda e risposta
  #align(center)[
      #image("UML/UC5.1.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter aggiungere manualmente una domanda e relativa risposta attesa
  - *Scenario*:
    - L'utente seleziona l'opzione per aggiungere una domanda
    - L'utente aggiunge manualmente una domanda e relativa risposta attesa
    - L'utente conferma l'aggiunta
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Una domanda e la relativa risposta vengono inserite nel sistema

  ==== UC5.2: Aggiunta domande da file strutturato
  #align(center)[
      #image("UML/UC5.2.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter inserire nel sistema delle domande e relative risposte presenti in un file strutturato
  - *Scenario*:
    - L’utente seleziona l’opzione per caricare un file di domande e relative risposte
    - L’utente carica il file strutturato
    - L'utente conferma il caricamento
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Le domande e relative risposte vengono inserite nel sistema
  - *Scenari alternativi*:
    - Errore su aggiunta domande da file (UC20)
 #pagebreak()
  === UC6: Suddivisione domande in set
  #align(center)[
      #image("UML/UC6.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter suddividere le domande e relative risposte in set
  - *Scenario*:
    - L’utente seleziona l’opzione per creare un nuovo set di domande
    - L’utente seleziona le domande e relative risposte che vuole inserire
    - L’utente inserisce i dati relativi all’intero set di domante
    - L'utente conferma la creazione del set
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza le domande e risposte nel sistema
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - Viene creato un nuovo set di domande
  - *UC Conseguenti (da definire prima dell'eventuale implementazione)*:
    - Esecuzione test con set di domande
    - Visualizzazione risultati set di domande
    - Modifica dati generali set di domande
    - Confronto differenti esecuzioni di test per set 

  === UC7: Esecuzione test
  #align(center)[
      #image("UML/UC7.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter eseguire il test utilizzando le domande e risposte presenti
  - *Scenario*:
    - L’utente avvia il test di confronto tra le risposte generate da un LLM e le risposte inserite da lui
    - Il sistema invia le domande all’LLM e ne registra le risposte
    - Il sistema confronta le risposte ottenute con quelle attese
  - *Attore principale*: utente
  - *Attori secondari*: LLM
  - *Precondizioni*: 
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - Viene visualizzato il risultato del test
    - (opzionale) Viene aggiunto allo storico il risultato del test

  === UC8: Visualizzazione dei risultati del test per singola domanda
  #align(center)[
      #image("UML/UC8.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter visualizzare i risultati del test relativi ad una singola domanda
  - *Scenario*:
    - L’utente entra nella schermata di visualizzazione del risultato del test
    - L'utente seleziona l'opzione di visualizzazione per una singola domanda, dei campi domanda, risposta attesa, risposta ottenuta, valutazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Vengono visualizzati i risultati del test relativi ad una singola domanda

  === UC9: Visualizzazione del risultato del test relativo all’intero insieme di domande
  #align(center)[
      #image("UML/UC9.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter visualizzare al termine del test, il suo risultato,relativo all’intero insieme di domande
  - *Scenario*: 
    - L’utente entra nella schermata di visualizzazione del risultato del test
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Viene visualizzato il risultato del test relativo all’intero set di domande
 #pagebreak()
  === UC10: Visualizzazione dei risultati peggiori di un test
  #align(center)[
      #image("UML/UC10.png", height: 13%)
    ]
  - *Descrizione*: L’utente deve essere in grado di visualizzare solo i risultati peggiori di un test
  - *Scenario*:
    - L’utente entra nella schermata di visualizzazione del risultato del test
    - L’utente seleziona l’opzione per visualizzare solo i risultati peggiori del test
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Vengono visualizzati solo i risultati peggiori del test

  === UC11: Visualizzazione di tutte le domande eseguite nel test
  #align(center)[
      #image("UML/UC11.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter visualizzare tutte le domande eseguite nel test
  - *Scenario*:
    - L’utente seleziona l’opzione per visualizzare le domande eseguite nel test
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Vengono visualizzate tutte le domande eseguite nel test
  #pagebreak()
  === UC12: Scaricare i risultati del test eseguito
  #align(center)[
      #image("UML/UC12.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter scaricare i risultati del test appena eseguito in un file strutturato
  - *Scenario*:
    - L’utente seleziona l’opzione per scaricare i risultati del test
    - L’utente sceglie nome e percorso del file da scaricare
    - L’utente seleziona il test di cui vuole scaricare i risultati
    - L’utente conferma il salvataggio
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Un file strutturato che contiene domande, risposte attese, risposte ricevute, valutazione risposta e valutazione generale test viene salvato nel pc con nome e percorso scelti dall’utente
  - *UC Conseguenti (da definire prima dell'eventuale implementazione)*:
    - Caricamento file risultato test

  === UC13: Visualizzazione Storico dei test
  #align(center)[
      #image("UML/UC13.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare lo storico dei test eseguiti
  - *Scenario*:
    - L'utente seleziona l’opzione di visualizzazione dello storico dei test eseguiti
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    -  Viene visualizzato l'elenco dei test eseguiti o una lista vuota
 #pagebreak()
  === UC14: Confronto tra esecuzioni diverse
  #align(center)[
      #image("UML/UC14.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare e confrontare i risultati di diverse esecuzioni dei test
  - *Scenario*:
    - L’utente seleziona l’opzione di confronto tra test differenti
    - L’utente seleziona quali test confrontare
    - L'utente confronta i test
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test effettuati
    - Sono stati eseguiti almeno due test
  - *Postcondizioni*:
    - Vengono visualizzati i risultati di diverse esecuzioni, messi a confronto
    - Vengono visualizzati eventuali miglioramenti/peggioramenti

  === UC15: Definizione delle etichette per domande
  #align(center)[
      #image("UML/UC15.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter definire etichette che descrivano il contesto delle domande da porre come supporto al programma di valutazione
  - *Scenario*:
    - L’utente seleziona l’opzione di visualizzazione delle etichette
    - L’utente seleziona l’opzione per definire una nuova etichetta
    - L’utente inserisce il nome e la descrizione dell’etichetta
    - L’utente conferma l'aggiunta
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Una nuova etichetta è disponibile nel sistema
  - *Scenari alternativi*:
    - Errore su aggiunta di un'etichetta (UC21)

  === UC16: Eliminazione delle etichette per domande
  #align(center)[
      #image("UML/UC16.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter eliminare un'etichetta che descriva il contesto della domanda
  - *Scenario*:
    - L’utente seleziona l’opzione di visualizzazione delle etichette
    - L’utente seleziona l’opzione per eliminare un'etichetta
    - L'utente viene informato che l'etichetta eliminata sarà rimossa anche dalle domande a cui è attualmente assegnata
    - L’utente conferma l'eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un etichetta è definita nel sistema
  - *Postcondizioni*:
    - L'etichetta viene rimossa dalle domande a cui è attualmente assegnata
    - L'etichetta viene eliminata correttamente dal sistema
  - *Scenari alternativi*:
    - Annullamento eliminazione di un'etichetta (UC22)

  === UC17: Assegnazione delle etichette
  #align(center)[
      #image("UML/UC17.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole assegnare ad una domanda una o più etichette, tra quelle disponibili.
  - *Scenario*:
    - L'utente seleziona una domanda
    - L’utente seleziona l’opzione per assegnare le etichette alla domanda
    - L’utente seleziona le etichette da assegnare
    - L’utente conferma l’assegnazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un'etichetta è definita nel sistema
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La domanda selezionata ha l'/le etichetta/e assegnata/e

  === UC18: Rimozione delle etichette
  #align(center)[
      #image("UML/UC18.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole rimuovere l'assegnazione di un'etichetta da una domanda
  - *Scenario*:
    - L’utente sceglie una domanda
    - L’utente seleziona l’opzione per rimuovere un’etichetta
    - L’utente seleziona l’etichetta da rimuovere
    - L’utente conferma la rimozione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda nel sistema con almeno un'etichetta assegnata
  - *Postcondizioni*:
    - L'etichetta viene rimossa dalla domanda selezionata

  === UC19: Modifica assegnazione domande a etichetta
  #align(center)[
      #image("UML/UC19.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter modificare quali domande sono associate all’etichetta desiderata
  - *Scenario*:
    - L’utente seleziona l'opzione di gestione delle etichette
    - L’utente seleziona l’etichetta a cui vuole modificare le domande associate
    - L’utente modifica quali sono le domande associate
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - É presente almeno un’etichetta nel sistema
  - *Postcondizioni*:
    - L'associazione tra le domande e l'etichetta vengono modificate correttamente
  #pagebreak()
  === UC20: Errore su aggiunta domande da file
  #align(center)[
      #image("UML/UC20.png", height: 12%)
    ]
  - *Descrizione*: L’utente viene notificato della presenza di un errore dato dal caricamento di un file impossibile da leggere correttamente
  - *Scenario*:
    - L'utente carica un file con all'interno almeno un errore
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene caricato un file contente domande e risposte
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore
    - Le domande contenute nel file non vengono caricate
    - L’utente può caricare un nuovo file
  - *Generalizzazioni*:
    - Errore dati file (UC20.1)

  ==== UC20.1: Errore dati file
  #align(center)[
      #image("UML/UC20.1.png", height: 13%)
    ]
  - *Descrizione*: L’utente viene notificato della presenza di un errore dato da un errato formato di alcuni dati contenuti nel file
  - *Scenario*:
    - L'utente carica un file che contiene dei dati in formato errato
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene caricato un file contente domande e risposte
  - *Postcondizioni*:
    - L'utente visualizza un messaggio di errore relativo ad un errato formato dei dati contenuti nel file
#pagebreak()
  === UC21: Errore su aggiunta di un'etichetta
  #align(center)[
      #image("UML/UC21.png", height: 13%)
    ]
  - *Descrizione*: L’utente viene notificato della presenza di un errore dato dall'aggiunta di un etichetta non andata a buon fine
  - *Scenario*:
    - L'utente ha aggiunto un'etichetta generando uno o più errori
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore
    - La nuova etichetta non viene aggiunta
    - L'utente può aggiungere una nuova etichetta
  - *Generalizzazioni*:
    - Errore aggiunta di un'etichetta già presente (UC21.1)

  ==== UC21.1: Errore aggiunta di un'etichetta già presente
  #align(center)[
      #image("UML/UC21.1.png", height: 13%)
    ]
  - *Descrizione*: L’utente viene notificato della presenza di un errore dato dall'aggiunta di un etichetta con un nome già presente nel sistema
  - *Scenario*:
    - L'utente ha aggiunto un'etichetta con un nome già presente nel sistema
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un'etichetta è definita nel sistema
    - Nel sistema è già presente un'etichetta con lo stesso nome
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore relativo al nome dell'etichetta
#pagebreak()
  === UC22: Annullamento eliminazione di un'etichetta
  #align(center)[
      #image("UML/UC22.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter annullare l'operazione di eliminazione di un'etichetta
  - *Scenario*:
    - L’utente seleziona l’opzione di visualizzazione delle etichette
    - L’utente seleziona l’opzione per eliminare un'etichetta
    - L'utente viene informato che l'etichetta eliminata sarà rimossa anche dalle domande a cui è attualmente assegnata
    - L'utente annulla l'operazione di eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un'etichetta è definita nel sistema
  - *Postcondizioni*:
    - L'etichetta non viene eliminata
    - Non vengono apportate modifiche al sistema

  === UC23: Annullamento modifica domanda
  #align(center)[
      #image("UML/UC23.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter annullare l'operazione di modifica di una domanda
  - *Scenario*:
    - L’utente seleziona l’opzione di modifica domanda
    - L’utente seleziona una domanda da modificare
    - L’utente modifica la domanda
    - L'utente annulla l'operazione di modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La domanda non viene modificata
    - Non vengono apportate modifiche al sistema

  === UC24: Annullamento modifica risposta attesa
  #align(center)[
      #image("UML/UC24.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter annullare l'operazione di modifica di una risposta attesa
  - *Scenario*:
    - L’utente seleziona l’opzione di modifica domanda
    - L’utente seleziona una domanda da modificare
    - L’utente modifica la risposta attesa
    - L'utente annulla l'operazione di modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La risposta attesa non viene modificata
    - Non vengono apportate modifiche al sistema
    
  === UC25: Annullamento eliminazione domanda e risposta attesa
  #align(center)[
      #image("UML/UC25.png", height: 13%)
    ]
  - *Descrizione*: L’utente vuole poter annullare l'operazione di eliminazione di un'etichetta
  - *Scenario*:
    - L’utente seleziona l’opzione di eliminazione domanda
    - L'utente seleziona una o più domande
    - L'utente annulla l'operazione di eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una domanda con relativa risposta nel sistema
  - *Postcondizioni*:
    - La domanda e relativa risposta attesa non viene eliminata
    - Non vengono apportate modifiche al sistema
#pagebreak()
//#set heading(numbering: "1.1") //non necessario perché la diversa formattazione dell'heading dura solo per il file attuale