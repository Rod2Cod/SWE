#import "../../functions.typ": decisioni

== Stesura verbale
Per la stesura di questo verbale è stato designato *Luca Calzetta*


== Glossario


Un membro del gruppo ha proposto una soluzione per marcare automaticamente i vocaboli presenti nel glossario all'interno dei documenti. È stata sviluppata una funzione in Typst che individua automaticamente le parole del glossario e le evidenzia applicando uno stile specifico: aggiunge una "G" maiuscola come pedice alla parola e imposta il font in corsivo per il termine evidenziato.

#decisioni(
  [
    - Ogni volta che nella stesura di documenti si incontra un termine appartenente al glossario, esso deve essere aggiunto alla lista delle parole nel glossario, così che venga automaticamente marcato una volta esportato il documento.
  ],
  [
    - Mantenere il glossario sempre aggiornato da parte di ogni membro del team permette di evitare la revisione manuale di tutti i documenti per individuare termini da inserire. Inoltre, grazie all'automatizzazione, si elimina la necessità di marcare manualmente i termini del glossario.
  ]
)

== Discussione processi da includere nel Piano di Qualifica


Nel piano di Qualifica è essenziale includere processi che garantiscano la qualità sia del prodotto che del processo stesso, con particolare attenzione alla documentazione. Si propone l'utilizzo dell'indice di Gulpis e di metriche specifiche per valutare la qualità della documentazione, integrandoli nella sezione dedicata alla qualità del prodotto. Al riguardo, non è stata ancora presa una decisione definitiva, se non quella di proseguire con la stesura e di affrontare nuovamente l'argomento in un momento successivo.

== Organizzazione sviluppo PoC

E' stato discusso come organizzare lo sviluppo del PoC. 

=== Presentazione pratica metriche

Come primo punto, uno dei membri del gruppo ha presentato un esempio pratico di training di una Random Forest utilizzando due dataset distinti: uno composto da 50 domande e l'altro da 2000. Durante l'esecuzione, è stato mostrato come, dopo aver applicato i diversi modelli per valutare le frasi e aver utilizzato la Random Forest per determinare i pesi, i risultati ottenuti fossero complessivamente accurati. È stato inoltre evidenziato che, nel sistema presentato, la soglia di sufficienza era fissata a 0.7 su una scala da 0 a 1.

=== Organizzazione

È stato effettuato un riepilogo delle tecnologie già analizzate e pronte per essere utilizzate nella realizzazione del Proof of Concept (PoC). Durante la discussione, sono stati definiti gli obiettivi e le funzionalità principali che il PoC dovrà soddisfare. Tuttavia, non è stata presa una decisione definitiva, se non quella di iniziare a integrare le tecnologie selezionate, favorendone la comunicazione reciproca, per avviare lo sviluppo del PoC.

== Stato piano di Progetto

Per quanto riguarda il Piano di Progetto, si è tenuta una breve discussione in cui è stato illustrato lo stato di avanzamento del documento. Durante l'incontro, sono state evidenziate le attività prioritarie ancora da completare, quali la pianificazione, il consuntivo e il preventivo. Non è stata presa alcuna decisione definitiva al riguardo.

== Discussione Analisi dei Requisiti

Dopo l'incontro con il professor Cardin, abbiamo discusso i punti chiariti durante la riunione e preso alcune decisioni in merito ai seguenti aspetti: gestione dell'annullamento e gestione degli errori. Nel corso dell'incontro sono emerse le seguenti considerazioni:

- Annullamento: L'annullamento deve essere considerato parte integrante del sistema solo se viene previsto come opzione esplicita offerta all'utente. In tal caso, è necessario svilupparlo come uno specifico Use Case.
- Errore: Gli errori che devono essere modellati come Use Case sono esclusivamente quelli rilevanti per l'utente finale, ovvero quelli in cui l'utente può eventualmente intervenire.

#decisioni(
  [
    - Abbiamo deciso di integrare gli Use Case relativi all'annullamento per le operazioni non reversibili.
    - Abbiamo deciso di sviluppare i casi per gli errori rilevanti per l'utente finale.
  ],
  [
    - Poiché intendiamo inserire l'annullamento come operazione offerta dal nostro sistema.
    - Perché gli errori che interessano l'utente finale sono quelli che necessitano di essere sviluppati.
  ]
)
