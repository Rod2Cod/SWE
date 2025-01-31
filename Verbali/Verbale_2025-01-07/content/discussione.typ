#import "../../functions.typ": decisioni
== Stesura verbale
Per la stesura di questo verbale è stato designato *Michele Nesler*
== Stato PoC
I membri del gruppo che si stanno occupando del PoC hanno presentato gli avanzamenti fatti finora. In particolare ad oggi esiste un'interfaccia in cui l'utente può scegliere il modello da interrogare, immettere una domanda e relativa risposta attesa, mandare la domanda al LLM e ottenere la risposta. I principali passi successivi saranno implementare il DB e la valutazione della risposta ottenuta.
Abbiamo discusso riguardo all'integrazione di Bleurt e RAG nel sistema, poi per allineare la nostra comprensione riguardo al PoC abbiamo stilato una lista delle funzionalità richieste nel PoC.

#decisioni(
  [
    - Non integrare Bleurt nel sistema
    - Non utilizzare le RAG
    - Non inserire le Random Forest nel PoC
    - Rimandare la riunione aggiuntiva alla settimana successiva e sostituirla con un breve SAL sul PoC
  ],
  [
    - Abbiamo incontrato difficoltà nell'implementazione di Bleurt
    - Per implementare le RAG serve un dataset ulteriore con cui verificare le risposte in aggiunta alle risposte attese. Noi non disponiamo di questo dataset.
    - L'utilizzo che abbiamo fatto finora delle random forest è embrionale, abbiamo bisogno di maggiore esperienza nel loro utilizzo.
    - Abbiamo gia discusso di ciò di cui potevamo discutere riguardo al PoC in questa riunione. Per cui aspettiamo maggiori informazioni da parte del professor Cardin prima di fare una riunione aggiuntiva a riguardo.
    
  ]
)
== Dubbi Piano di Qualifica
Abbiamo applicato la decisione presa in precedenza riguardante l'inserimento del processo di documentazione nella qualità di prodotto.
Si è discusso se inserire il PdQ nel WoW.
#decisioni(
  [
    - Applicazione delle metriche (in particolare l' Indice di gulpease) in locale fino al RtB per poi implementarli tramite github action.
    - documentarsi riguardo la necessità di inserire il PdQ nel Wow e decidere successivamente
  ],
  [
    - Creare una github action per applicare le metriche potrebbe essere difficile e lungo, quindi c'è il rischio che questo rimandi la consegna del RtB. Per il futuro però è importante automatizzarlo per non appesantire i processi.
  ]
)
== Aggiornamenti Analisi dei Requisiti
Sono state esposte le modifiche apportate all'analisi dei requisiti da parte di un membro del gruppo. In particolare sono stati inseriti i casi d'uso che riguardano l'annullamento delle operazioni ed è stato eliminato il caso d'uso "errore struttura file"
== Chi fa il prossimo Diario di Bordo
Per la stesura del prossimo Diario di Bordo è stata designata *Annalisa Egidi*


