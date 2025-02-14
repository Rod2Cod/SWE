== Introduzione
  La seguente sezione contiene la *descrizione* dei casi d'uso relativi all'applicativo sviluppato. Sono classificati come '*UC*' e seguiti da uno o più numeri separati da un punto. Questo punto indica la *successione gerarchica* dei casi d'uso se questo è esplicitamente espresso dal punto 'Generalizzazioni' del caso d'uso padre, altrimenti indica un *sottocaso d'uso*, ovvero un caso d'uso che aggiunge *dettagli* al caso d'uso principale.
  
  Nei casi d'uso che rimangono generali, senza specificare in modo dettagliato alcuni aspetti della funzionalità l'azienda ha espresso la volontà di lasiciare al team di sviluppo totale libertà di decisione sui dettagli, in quanto non portatori di grande valore aggiunto.

== Attori
  Il sistema comunica con due attori diversi: 
  - l'*utente*, come attore principale che interagisce direttamente con esso.
  - un *LLM*, come attore secondario che viene richiamato indirettamente. 
  Non viene richiesta l'autenticazione dell'utente.

== Elenco dei casi d'uso

#set heading(numbering: none)

  === UC1: Visualizzazione lista elementi domanda
    #align(center)[
      #image("UML/UC1.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter visualizzare una lista con gli elementi domanda presenti
  - *Scenario*:
    - L'utente seleziona l'opzione di visualizzazione della lista degli elementi domanda
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Viene visualizzata una lista con gli elementi domanda presenti o una lista vuota
  
  ==== UC1.1: Visualizzazione elemento domanda
    - *Descrizione*: L'utente vuole poter visualizzare un elemento domanda composto da una domanda e una risposta associata
    - *Scenario*:
      - L'utente visualizza una domanda
      - L'utente visualizza la relativa risposta asssociata
    - *Precondizioni*:
      - È presente almeno una elemento domanda nel sistema
    - *Postcondizioni*:
      - Viene visualizzato l'elemento domanda

  ===== UC1.1.1: Visualizzazione domanda
    - *Descrizione*: L'utente vuole poter visualizzare il testo di una domanda
    - *Scenario*:
      - L'utente visualizza il testo di uan domanda
    - *Precondizioni*:
      - È presente almeno una domanda nel sistema
    - *Postcondizioni*:
      - Viene visualizzato il testo della domanda

  ===== UC1.1.2: Visualizzazione risposta attesa
    - *Descrizione*: L'utente vuole poter visualizzare il testo della risposta attesa associata ad una domanda
    - *Scenario*:
      - L'utente visualizza il testo della risposta attesa associata ad una domanda
    - *Precondizioni*:
      - È presente almeno una elemento domanda nel sistema
    - *Postcondizioni*:
      - Viene visualizzato il testo della risposta attesa

  === UC2: Modifica domanda
  #align(center)[
      #image("UML/UC2.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter modificare una domanda da porre nel test
  - *Scenario*:
    - L'utente seleziona l'opzione di modifica domanda
    - L'utente seleziona una domanda da modificare
    - L'utente modifica la domanda
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno una elemento domanda nel sistema
  - *Postcondizioni*:
    - La domanda modificata viene salvata correttamente
  - *Scenari alternativi*:
    - Annullamento modifica domanda (UC24)

  === UC3: Modifica risposta attesa
  #align(center)[
      #image("UML/UC3.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter modificare una risposta associata ad una delle domande da porre nel test
  - *Scenario*:
    - L'utente seleziona l'opzione di modifica domanda
    - L'utente seleziona una domanda da modificare
    - L'utente modifica la risposta associata alla domanda
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - La risposta alla domanda selezionata viene salvata correttamente
  - *Scenari alternativi*:
    - Annullamento modifica risposta attesa (UC25)

  === UC4: Eliminazione elemento domanda
  #align(center)[
      #image("UML/UC4.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter eliminare un elemento domanda presente nel sistema
  - *Scenario*:
    - L'utente seleziona l'opzione di eliminazione di un elemento domanda
    - L'utente seleziona uno o più elementi domanda da eliminare
    - L'utente conferma l'eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*: 
    - L'elemento domanda viene eliminato dal sistema
  - *Scenari alternativi*:
    - Annullamento eliminazione elemento domanda (UC26)

  === UC5: Aggiunta di elementi domanda
  #align(center)[
      #image("UML/UC5.png", height: 23%)
    ]
  - *Descrizione*: L'utente vuole poter aggiungere almeno un elemento domanda
  - *Scenario*:
    - L'utente seleziona l'opzione per aggiungere una domanda
    - L'utente aggiunge una o più domande
    - L'utente conferma l'aggiunta
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Almeno un elemento domanda vengono inserite nel sistema
  - *Generalizzazioni*:
    - Aggiunta manuale di elementi domanda (UC5.1)
    - Aggiunta di domande da file strutturato (UC5.2)

  ==== UC5.1: Aggiunta manuale di elementi domanda
  #align(center)[
      #image("UML/UC5.1.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter aggiungere manualmente un elemento domanda
  - *Scenario*:
    - L'utente seleziona l'opzione per aggiungere un elemento domanda
    - L'utente aggiunge manualmente una domanda
    - L'utente aggiunge manualmente la relativa risposta attesa
    - L'utente conferma l'aggiunta
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Un elemento domanda viene inserito nel sistema

  ===== UC5.1.1: Aggiunta manuale domanda
  - *Descrizione*: L'utente vuole poter aggiungere manualmente una domanda
  - *Scenario*:
    - L'utente aggiunge manualmente una domanda
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Il sistema riceve la domanda inserita dall'utente

  ===== UC5.1.2: Aggiunta manuale risposta attesa
  - *Descrizione*: L'utente vuole poter aggiungere manualmente la risposta attesa associata ad una domanda
  - *Scenario*:
    - L'utente aggiunge manualmente la risposta attesa associata ad una domanda
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Il sistema riceve la risposta attesa inserita dall'utente

  ==== UC5.2: Aggiunta elementi domanda da file strutturato
  #align(center)[
      #image("UML/UC5.2.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter inserire nel sistema degli elementi domanda presenti in un file strutturato
  - *Scenario*:
    - L'utente seleziona l'opzione per caricare un file di elementi domanda
    - L'utente carica il file strutturato
    - L'utente conferma il caricamento
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Gli elementi domanda vengono inserite nel sistema
  - *Scenari alternativi*:
    - Errore dati file (UC21.1)

  === UC6: Suddivisione domande in set
  #align(center)[
      #image("UML/UC6.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter suddividere gli elementi domanda in set
  - *Scenario*:
    - L'utente seleziona l'opzione per creare un nuovo set di domande
    - L'utente seleziona gli elementi domanda da inserire nel set
    - L'utente inserisce il nome del set
    - L'utente conferma la creazione del set
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza gli elementi domanda presenti nel sistema
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - Viene creato un nuovo set di elementi domanda

  === UC7: Visualizzazione dei vari set di domande
      #align(center)[
      #image("UML/UC7.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter visualizzare i vari set di domande presenti nel sistema
  - *Scenario*:
    - L'utente seleziona l'opzione per visualizzare i vari set di domande
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Viene visualizzato l'elenco dei set di domande presenti nel sistema o una lista vuota

  === UC8: Visualizzazione elementi domanda appartenenti ad un set
      #align(center)[
      #image("UML/UC8.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter visualizzare gli elementi domanda appartenenti ad un determinato set
  - *Scenario*:
    - L'utente seleziona un set
    - L'utente entra nella visualizzazione degli elementi domanda del set
    - L'utente visualizza gli elementi domanda appartenenti al set
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene visualizzata la lista dei set
  - *Postcondizioni*:
    - Vengono visualizzati gli elementi domanda appartenenti al set

  === UC9: Modifica nome del set di domande
      #align(center)[
      #image("UML/UC9.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter modificare il nome assengato al set di elementi domanda
  - *Scenario*:
    - L'utente seleziona l'opzione per modificare il nome del set
    - L'utene modifica il nome del set
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza i vari set presenti nel sistema
    - Deve essere presente almeno un set di domande nel sistema
  - *Postcondizioni*:
    - Viene modificato il nome del set di domande

  === UC10: Eliminazione set di domande
      #align(center)[
      #image("UML/UC10.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter eliminare un set di domande
  - *Scenario*:
    - L'utente seleziona l'opzione per eliminare un set di domande
    - L'utente seleziona il set da eliminare
    - L'utente conferma l'eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza i vari set presenti nel sistema
    - Deve essere presente almeno un set di domande nel sistema
  - *Postcondizioni*:
    - Il set di domande viene eliminato
    - Le domande contenute nel set non vengono eliminate
  - *Scenario alternativo*:
    - Annullamento eliminazione di un set (UC23)

  === UC11: Modifica elementi domanda appartenenti ad un set
  #align(center)[
      #image("UML/UC11.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter modificare quali elementi domanda appartengono ad un set
  - *Scenario*:
    - L'utente seleziona l'opzione di modifica di un set
    - L'utente modifica quali elementi domanda sono associati
    - L'utente conferma la modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene visualizzata la lista di elementi domanda presenti nel set
  - *Postcondizioni*:
    - L'associazione tra gli elementi domanda e il set viene modificata

  === UC12: Esecuzione test
  #align(center)[
      #image("UML/UC12.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter eseguire il test utilizzando gli elementi domanda presenti
  - *Scenario*:
    - L'utente avvia il test di confronto tra le risposte generate da un LLM e le risposte presenti
    - Il sistema invia le domande all'LLM e ne registra le risposte
    - Il sistema confronta le risposte ottenute con quelle attese
  - *Attore principale*: utente
  - *Attori secondari*: LLM
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - Viene visualizzato il risultato del test
    - Viene aggiunto allo storico il risultato del test
  - *Generalizzazioni*:
    - Esecuzione test su un set di domande (UC12.1)

  ==== UC12.1: Esecuzione test su un set di domande
      #align(center)[
      #image("UML/UC12.1.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter eseguire il test su un determinato set di domande
  - *Scenario*:
    - L'utente seleziona il set di domande su cui eseguire il test
    - L'utente avvia il test di confronto tra le risposte generate da un LLM e le risposte presenti
    - Il sistema invia le domande all'LLM e ne registra le risposte
    - Il sistema confronta le risposte ottenute con quelle attese
  - *Attore principale*: utente
  - *Attori secondari*: LLM
  - *Precondizioni*:
    - È presente almeno un set di domande nel sistema
  - *Postcondizioni*:
    - Viene visualizzato il risultato del test
    - Viene aggiunto allo storico il risultato del test

  === UC13: Visualizzazione del risultato del test
  #align(center)[
      #image("UML/UC13.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare il risultato di un test, ordinato in modo crescente rispetto alla valutazione assegnata ad ogni singolo elemento domanda. \ L'ordinamento permette di evidenziare i risultati peggiori del test.
  - *Scenario*:
    - L'utente entra nella schermata di visualizzazione del risultato del test
    - L'utente visualizza la valutazione generale del test (media dei voti)
    - L'utente visualizza la lista di domande ordinate in modo crescente rispetto alla valutazione assegnata ad ogni singola domanda
    - L'utente visualizza per ogni domanda la relativa valutazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Viene visualizzato il risultato del test

  === UC14: Visualizzazione dei risultati del test per singola domanda
  #align(center)[
      #image("UML/UC14.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare i risultati del test relativi ad una singola domanda
  - *Scenario*:
    - L'utente entra nella schermata di visualizzazione del risultato del test
    - L'utente seleziona l'opzione di visualizzazione per un singolo elemento domanda
    - (UC1.1) L'utente visualizza l'elemento domanda
    - L'utente visualizza la risposta data dall'LLM
    - L'utente visualizza la valutazione assegnata alla singola domanda
    - L'utente visualizza il nome e la rispettiva valutazione di tutte le metriche impiegate nel test
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Vengono visualizzati i risultati del test relativi ad una singola domanda  

  === UC15: Scaricare i risultati del test eseguito
  #align(center)[
      #image("UML/UC15.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter scaricare i risultati del test appena eseguito in un file strutturato
  - *Scenario*:
    - L'utente seleziona l'opzione per scaricare i risultati del test
    - L'utente sceglie nome e percorso del file da scaricare
    - L'utente seleziona il test di cui vuole scaricare i risultati
    - L'utente conferma il salvataggio
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Un file strutturato che contiene gli elementi domanda utilizzati, le risposte ricevute dall'LLM, la valutazione di ogni elemento domanda, la valutazione e i nomi delle varie metriche utilizzate, la valutazione generale del test e l'eventuale nome del set di appartenenza degli elementi domanda viene salvato nel pc con nome e percorso scelti dall'utente
  
  === UC16: Caricamento file risultato test
      #align(center)[
      #image("UML/UC16.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter caricare un file contenente i risultati di un test, nello stesso formato in cui vengono salvati
  - *Scenario*:
      - L'utente seleziona l'opzione di caricamento file relativo al risultato di un test
      - L'utente seleziona il file da caricare
      - Il sistema carica i risultati del test
  - *Attore principale*: utente
  - *Precondizioni*:
      - L'utente visualizza lo storico dei test effettuati
      - L'utente ha a disposizione un file contenente i risultati di un test
  - *Postcondizioni*:
      - L'utente visualizza il risultato del test appena caricato
      - Il risultato del test viene aggiunto allo storico dei test eseguiti
  - *Scenari alternativi*:
      - Errore su caricamento file (UC21.1)

  === UC17: Visualizzazione storico dei test
  #align(center)[
      #image("UML/UC17.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare lo storico dei test eseguiti ordinati in ordine decrescente rispetto all'ordine di esecuzione
  - *Scenario*:
    - L'utente seleziona l'opzione di visualizzazione dello storico dei test eseguiti
    - L'utente visualizza la lista degli elementi riguardanti i testi eseguiti
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Viene visualizzato l'elenco dei test eseguiti o una lista vuota

  ==== UC17.1: Visualizzazione elemento esecuzione test
  - *Descrizione*: L'utente vuole poter visualizzare un elemento riguardante l'esecuzione di un test
  - *Scenario*:
    - L'utente visualizza il set di domande su cui è stato eseguito il test
    - L'utente visualizza la data di esecuzione del test
    - L'utente visualizza lo score generale del test
    - L'utente visualizza LLM utilizzato
    - L'utente visualizza il set di domande su cui è stato eseguito il test
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test
    - È stato eseguito almeno un test
  - *Postcondizioni*:
    - Viene visualizzato l'elemento relativo all'esecuzione del test

  === UC18: Applicazione filtri storico dei test
      #align(center)[
      #image("UML/UC18.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter filtrare gli elementi esecuzione del test in base determinati parametri
  - *Scenario*:
    - L'utente sceglie di filtrare gli elementi per determinati parametri
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test
  - *Postcondizioni*:
    - Viene visualizzato lo storico dei test filtrato secondo i parametri selezionati

  ==== UC18.1: Filtro storico dei test per nome del set
  - *Descrizione*: L'utente vuole poter filtrare gli elementi esecuzione del test in base al nome del set di domande
  - *Scenario*:
    - L'utente seleziona l'opzione di filtro per nome del set di domande utilizzato
    - L'utente seleziona il nome del set di domande
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test
  - *Postcondizioni*:
    - Viene visualizzato lo storico dei test eseguiti sul set selezionato

  ==== UC18.2: Filtro storico dei test per LLM
  - *Descrizione*: L'utente vuole poter filtrare gli elementi esecuzione del test in base all'LLM utilizzato
  - *Scenario*:
    - L'utente seleziona l'opzione di filtro per LLM
    - L'utente seleziona l'LLM
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test
  - *Postcondizioni*:
    - Viene visualizzato lo storico dei test eseguiti con l'LLM selezionato

  === UC19: Confronto tra esecuzioni diverse di test
  #align(center)[
      #image("UML/UC19.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter visualizzare e confrontare i risultati di due esecuzioni di test
  - *Scenario*:
    - L'utente seleziona l'opzione di confronto tra due esecuzioni di test differenti
    - L'utente seleziona quali test confrontare
    - L'utente confronta i test
  - *Attore principale*: utente
  - *Precondizioni*:
    - L'utente visualizza lo storico dei test effettuati
    - Sono stati eseguiti almeno due test
  - *Postcondizioni*:
    - Viene visualizzato il risultato del confronto

  ==== UC20: Visualizza risultato confronto esecuzioni
  - *Descrizione*: L'utente vuole poter visualizzare il risultato del confronto tra due esecuzioni di test
  - *Scenario*:
    - L'utente entra nella schermata di visualizzazione del risultato del confronto
    - L'utente visualizza entrambe le valutazioni generali dei test confrontati (media dei voti)
    - L'utente visualizza entrambi i nomi dei set di domande su cui sono stati eseguiti i test
    - L'utente visualizza entrambi i nomi degli LLM utilizzati per i test 
    - L'utente visualizza gli elementi confronto esecuzione ordinati per distanza tra le valutazioni
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito il confronto tra due esecuzioni diverse
  - *Postcondizioni*:
    - Viene visualizzato il risultato del confronto

  ==== UC20.1: Visualizzazione elemento confronto esecuzione
  - *Descrizione*: L'utente vuole poter visualizzare un elemento riguardante il confronto tra due esecuzioni di test
  - *Scenario*:
    - L'utente visualizza la domanda
    - L'utente visualizza entrambe le valutazioni delle diverse esecuzioni relative alla domanda
  - *Attore principale*: utente
  - *Precondizioni*:
    - Lo stesso identico elemento domanda è presente in entrambe le esecuzioni
  - *Postcondizioni*:
    - Viene visualizzato l'elemento relativo al confronto

  === UC21: Visualizzazione singolo elemento domanda confronto esecuzione
      #align(center)[
      #image("UML/UC20.png", height: 13%)
    ] 
  - *Descrizione*: L'utente vuole poter visualizzare nel dettaglio il risultato del confronto dello stesso elemento domanda in due esecuzioni diverse
  - *Scenario*:
    - L'utente entra nella schermata di visualizzazione in dettaglio del singolo elemento confronto esecuzione
    - (UC1.1) L'utente visualizza l'elemento domanda
    - L'utente visualizza la risposta data dall'LLM per entrambe le esecuzioni
    - L'utente visualizza l'LLM utilizzato per entrambe le esecuzioni
    - L'utente visualizza la valutazione assegnata alla singola domanda per entrambe le esecuzioni
  - *Attore principale*: utente
  - *Precondizioni*:
    - È stato eseguito il confronto tra due esecuzioni diverse
  - *Postcondizioni*:
    - Vengono visualizzati i risultati dettagliati del confronto relativi ad un elemento confronto esecuzione

  === UC22: Errore su caricamento file
  #align(center)[
      #image("UML/UC21.png", height: 12%)
    ]
  - *Descrizione*: L'utente viene notificato della presenza di un errore dato dal caricamento di un file impossibile da leggere correttamente
  - *Scenario*:
    - L'utente carica un file con all'interno almeno un errore
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene caricato un file contenente dati da inserire nel sistema
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore
    - Le domande contenute nel file non vengono caricate
    - L'utente può caricare un nuovo file
  - *Generalizzazioni*:
    - Errore dati file (UC20.1)

  ==== UC22.1 Errore dati file
    #align(center)[
      #image("UML/UC21.1.png", height: 13%)
    ] 
  - *Descrizione*: L'utente viene notificato della presenza di un errore dato da un errato formato di alcuni dati contenuti nel file
  - *Scenario*:
    - L'utente carica un file che contiene dei dati in formato errato
  - *Attore principale*: utente
  - *Precondizioni*:
    - Viene caricato un file contenente dati da inserire nel sistema
  - *Postcondizioni*:
    - L'utente visualizza un messaggio di errore relativo ad un errato formato dei dati contenuti nel file

  === UC23: Errore su creazione di un set
  #align(center)[
      #image("UML/UC22.png", height: 13%)
    ]
  - *Descrizione*: L'utente viene notificato della presenza di un errore dato dalla creazione di un set non andata a buon fine
  - *Scenario*:
    - L'utente ha creato un set generando uno o più errori
  - *Attore principale*: utente
  - *Precondizioni*: nessuna
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore
    - Il nuovo set non viene creato
    - L'utente può aggiungere un nuovo set
  - *Generalizzazioni*:
    - Errore aggiunta di un set già presente (UC21.1)

  ==== UC23.1: Errore aggiunta di un set già presente
  #align(center)[
      #image("UML/UC22.1.png", height: 13%)
    ]
  - *Descrizione*: L'utente viene notificato della presenza di un errore dato dalla creazione di un set con un nome già presente nel sistema
  - *Scenario*:
    - L'utente ha aggiunto un set con un nome già presente nel sistema
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un set è definito nel sistema
    - Nel sistema è già presente un set con lo stesso nome
  - *Postcondizioni*:
    - Viene visualizzato un messaggio di errore relativo al nome del set

  === UC24: Annullamento eliminazione di un set
  #align(center)[
      #image("UML/UC23.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter annullare l'operazione di eliminazione di un set
  - *Scenario*:
    - L'utente seleziona l'opzione di visualizzazione dei set
    - L'utente seleziona l'opzione per eliminare un set
    - L'utente viene informato che le domande associate al set non verranno eliminate
    - L'utente annulla l'operazione di eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - Almeno un set è definito nel sistema
  - *Postcondizioni*:
    - Non vengono apportate modifiche al sistema

  === UC25: Annullamento modifica domanda
  #align(center)[
      #image("UML/UC24.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter annullare l'operazione di modifica di una domanda
  - *Scenario*:
    - L'utente seleziona l'opzione di modifica domanda
    - L'utente seleziona una domanda da modificare
    - L'utente modifica la domanda
    - L'utente annulla l'operazione di modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - La domanda non viene modificata
    - Non vengono apportate modifiche al sistema

  === UC26: Annullamento modifica risposta attesa
  #align(center)[
      #image("UML/UC25.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter annullare l'operazione di modifica di una risposta attesa
  - *Scenario*:
    - L'utente seleziona l'opzione di modifica domanda
    - L'utente seleziona una domanda da modificare
    - L'utente modifica la risposta attesa
    - L'utente annulla l'operazione di modifica
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - La risposta attesa non viene modificata
    - Non vengono apportate modifiche al sistema
    
  === UC27: Annullamento eliminazione elemento domanda
  #align(center)[
      #image("UML/UC26.png", height: 13%)
    ]
  - *Descrizione*: L'utente vuole poter annullare l'operazione di eliminazione di un elemento domanda
  - *Scenario*:
    - L'utente seleziona l'opzione di eliminazione di un elemento domanda
    - L'utente seleziona uno o più elementi domanda da eliminare
    - L'utente annulla l'operazione di eliminazione
  - *Attore principale*: utente
  - *Precondizioni*:
    - È presente almeno un elemento domanda nel sistema
  - *Postcondizioni*:
    - Non vengono apportate modifiche al sistema

//#set heading(numbering: "1.1") //non necessario perché la diversa formattazione dell'heading dura solo per il file attuale