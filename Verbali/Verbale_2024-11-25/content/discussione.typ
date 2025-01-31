#import "../../functions.typ": decisioni

== Presentazioni
Nella fase iniziale della riunione, i vari membri del team hanno illustrato le tecnologie approfondite durante la settimana precedente. L’obiettivo era comprenderne meglio il funzionamento e valutarne l’utilità per il progetto.

=== React
Il primo argomento trattato è stato React, utilizzato insieme al framework Node.js per lo sviluppo del componente frontend del progetto.\
I vantaggi di tale strumento sono:
- Facilità di utilizzo
- Possibilità di creare pagine dinamiche
- Stile delle differenti viste applicabile con strumenti noti alla maggior parte del gruppo
- Possibilità di deployment tramite container che permette l'esecuzione su qualsiasi dispositivo
*Decisione:* Il gruppo non ha ancora deciso quale framework adottare, ma React sembra una tecnologia promettente.

=== Docker
È stato presentato anche Docker come alternativa all'installazione del package manager npm per il deployment dell'applicativo. Questa soluzione consente di eseguire l'applicativo in modo semplice su dispositivi diversi senza preoccuparsi delle differenze dovute ai sistemi operativi.

=== Dashboard GitHub
Sono state illustrate le funzionalità delle dashboard di GitHub per la gestione dei ticket tramite issue. Durante la discussione sono emersi alcuni punti da approfondire, come il cambiamento di stato di un’issue legata alla documentazione e la gestione delle notifiche durante le transizioni di stato (da scrittura a verifica, fino all'approvazione).

#decisioni(
  [
    - Utilizzare GitHub per la gestione dei ticket, pur mantenendo aperta la possibilità di valutare sistemi alternativi come Jira o YouTrack nelle prossime settimane. Si chiederà inoltre all’azienda proponente un parere sui vantaggi e svantaggi di questi prodotti.
    - Modifica della dashboard per l'integrazione dei campi modifica e approvazione per tenere traccia dei componenti addetti alla verifica e approvazione dei documenti.
  ],
  [
    - È stato scelto GitHub in quanto alternativa più familiare al team, anche se presenta dei limiti risulta comunque migliore di una semplice lista di todo.
    - È stato deciso di inserire tali campi al fine di comprendere chi è incaricato di eseguire tali operazioni su un documento al fine di evitare di avere documenti fermi in stati intermedi.
  ]
  )

== Utilizzo LLM
La scorsa settimana è stato sperimentato l’utilizzo di LLM (Large Language Model) tramite container Docker. L’obiettivo era semplificare il passaggio da un modello all’altro, evitando di installare diversi software in locale, come Ollama o LM Studio. Sono stati discussi vari modelli di LLM potenzialmente utilizzabili.
#decisioni(
  [
    - L'utilizzo di container per LLM non è stato approvato, in attesa di ulteriori investigazioni.
    - Richiesta eventuali chiavi API all'azienda.
    - Utilizzo di LLM di piccole dimensioni.
  ],
  [
    - Risultano delle criticità nell'esecuzione di LLM di medie dimensioni a causa della limitata RAM, anche nel caso in cui il nodo contenente tale container sia in grado di eseguire tale LLM localmente.
    - In questo modo non sarebbe necessario utilizzare LLM localmente, ma sarebbe sufficiente connettersi in remoto.
    - Al fine di evidenziare meglio i limiti di tali sistemi per il perfezionamento del componente di valutazione delle risposte, con la possibilità di utilizzare modelli più complessi nelle fasi finali dello svolgimento del progetto.
  ]
)

== File ODG condiviso
Nella precendente riunione è stato introdotto un file condiviso da aggiornare settimanalmente per l'aggiunta degli argomenti da discutere.
#decisioni(
  [
    - Aggiunta argomenti degli argomenti direttamente su verbale successivo.
    - Eliminazione file condiviso.
  ],
  [
    - Modificare un file per poi copiarne il contenuto in un documento causa perdite di tempo, è più veloce aggiungere tali domande direttamente nel verbale successivo. La creazione del documento per il verbale successivo verrà fatta da colui che scrive il verbale precedente. I vari membri dovranno semplicemente aggiungere gli argomenti nella posizione corretta.
    - Non più necessario data la decisione precedente.
  ]
)

== Versionamento sorgente documentazione
È stato discusso se fosse necessario versionare anche la sorgente della documentazione e automatizzare la creazione dei documenti tramite pull request.

#decisioni(
  [
    - Non versionare il codice sorgente della documentazione.
    - Il responsabile provvederà al caricamento del PDF nel repository una volta approvato.
  ],
  [
    - L'operazione di versionamento del codice sorgente della documentazione non sembra portare benefici significativi al gruppo, a fronte di un'onerosa automazione da implementare.
    - Non essendo più versionato il codice sorgente, non è necessario implementare il sistema di pull request per l'accettazione della documentazione.
  ]
)


