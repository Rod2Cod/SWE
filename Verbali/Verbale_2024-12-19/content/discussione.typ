== Discussione casi d'uso individuati
Nella prima parte dell'incontro il gruppo ha fornito all'azienda la lista dei casi d'uso individuati e si è iniziato a discuterli. Sono poi emersi dei dubbi per quanto riguarda l'utilizzo delle primitive "Extend" e "Include"; per questo motivo l'approvazione definitiva degli Use Case è stata rimandata dopo aver svolto un incontro con il professore per la risoluzione dei possibili errori.\
Il documento contenente i casi d'uso individuati è stato comunque lasciato all'azienda.

== Possibili metriche individuate
#table(
  columns: (1fr,1fr),
  stroke: none,
  [
    *Proposti dal gruppo*
    + Confronto parola per parola, con penalizzazione per risposte troppo lunghe o troppo corte
    + Aggregazione di differenti metriche con pesi derivati da random forest
  ],
  [
    *Commenti dell'azienda*
    + Semplicistico, si rischia di avere delle valutazioni non coerenti con una possibile metrica "umana". Potrebbe generare risultati più pertinenti confrontando le due frasi dopo aver eliminato tutti gli elementi sintattici e aver eseguito lo stemming delle parole rimaste
    + Può essere una soluzione valida, però non precisa. In alternativa può essere utile per capire quali metriche hanno maggiore influenza nel confronto delle risposte
    + Cross encoding può essere un valido modo di aggregare differenti metriche?
  ]
)
== Domande generali
#table(
  columns: (1fr,1fr),
  stroke: none,
  [
    *Proposti dal gruppo*
    + È possibile comprendere differenti metriche per poi produrre una valutazione sintetica?
    + Quanto deve influire la differente lunghezza delle risposte nella valutazione? La presenza di informazioni accessorie deve essere considerata come un errore?
  ],
  [
    *Commenti dell'azienda*
    + È possibile, la soluzione a questo problema rappresenta il punto principale del capitolato.
    + Può essere utilizzato, ma a differenza della distanza coseno non produce un risultato direttamente confrontabile e richiede una normalizzazione per ottenere un risultato compreso tra 0 e 1. Un'ulteriore metrica potrebbe utilizzare un LLM esterno, di dimensioni maggiori, di valutare la similarità delle risposte.
    + La lunghezza della risposta ricevuta non incide sul livello di similitudine, occorre però fare attenzione alla  correttezza delle informazioni accessorie. Nel caso di informazioni presenti nella risposta attesa ma non in quella ricevuta, la mancanza di tali informazioni deve essere penalizzata. L'algoritmo di confronto può utilizzare sia il punteggio di confronto semantico che la differenza sulla quantità di termini o di lunghezza per capire se la risposta ricevuta, per quanto lunga, sia rimasta pertinente al contesto analizzato. In alternativa può essere diviso il ranking delle risposte per criterio di valutazione.
  ]
)