== Analisi dei Requisiti

L'analisi dei requisiti è il processo di *raccolta*, *interpretazione* e *definizione* delle *necessità* e aspettative degli utenti per un progetto o sistema. Serve a identificare i requisiti richiesti dal Proponente, attraverso lo studio approfondito del capitolato. Di seguito i passi svolti per individuare i requisiti e redigerne l'analisi:

- *Analisi del capitolato*: Inizialmente, tutti i membri del gruppo analizzano con attenzione il capitolato, annotando eventuali casi d'uso e requisiti individuati.
- *Riunione con il proponente*: Un confronto iniziale con il proponente per comprendere al meglio le funzionalità richieste al sistema, chiarendo eventuali dubbi sul funzionamento.
- *Scrittura dei casi d'uso*: Ogni membro del gruppo si è occupato di una parte dei casi d'uso sviluppati durante l'incontro precedente con l'azienda, lavorando in modo indipendente.
- *Prima stesura*: Dopo aver sviluppato individualmente i casi d'uso (UC), si procede con l'unione del lavoro svolto e si realizza una prima stesura del documento che include tutti gli UC e i requisiti.
- *Confronto con il proponente*: Infine, si verifica con il proponente che i casi d'uso e i requisiti soddisfino le loro richieste, garantendo la conformità con quanto richiesto nel capitolato.

=== Casi d'uso (UC)

I casi d'uso servono a definire uno scenario in cui uno o più attori interagiscono con il sistema. Nel documento di analisi dei requisiti, i casi d'uso saranno identificati nel seguente modo:

- UC: acronimo di "Use Case".
- N°: un numero progressivo che facilita l'identificazione di un singolo caso d'uso.
Un esempio è: UC[Numero caso d'uso].[Sottocaso]. \ Per sviluppare un singolo caso d'uso è necessario che siano presenti i seguenti punti:

- *Descrizione*: Una breve spiegazione del caso d'uso.
- *Scenario*: Il contesto specifico in cui si svolge l'interazione.
- *Attore principale*: L'utente o il sistema che avvia l'interazione.
- *Precondizioni*: Le condizioni che devono essere soddisfatte prima dell'inizio del caso d'uso.
- *Postcondizioni*: Lo stato del sistema dopo che il caso d'uso è stato completato con successo.
- *Scenari alternativi*: Eventuali variazioni o eccezioni rispetto al flusso principale del caso d'uso.


=== Requisiti

I requisiti rappresentano le specifiche necessità, funzionalità e vincoli che il sistema deve soddisfare per rispondere alle esigenze degli utenti o, nel caso del progetto, del proponente. I requisiti verranno definiti e identificati in questo modo:

#set align(center)
*R[Tipologia]-[Importanza].[Codice]*
#set align(left)
Di cui:
- *R*: acronimmo di "Requisito".
- *Tipologia*: tipologia di requisito
 - *F*: Funzionale.
 - *Q*: Qualità.
 - *V*: Vincolo.
- *Classificazione*: identifica l’importanza del requisito:
 - 1: Obbligatorio.
 - 2: Opzionale.
 - 3: Desiderabile.
-  *Codice*: codice univoco del requisito il quale presenta, in alcuni casi, dei sottocasi identificati  con un punto seguito dal rispettivo codice del sottocaso.
