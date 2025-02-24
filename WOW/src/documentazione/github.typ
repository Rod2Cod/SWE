=== Github repository
  Qui di seguito vengono raccolte varie informazioni riguardanti l'utilizzo e l'attuale configurazione della repository di Github, in particolare per il caricamento e l'organizzazione della documentazione.

==== Struttura
  Il repository si compone di tre rami("branch"):
  + *master*: ramo che contiene tutti i *file* riguardanti il progetto ed è composto nel seguente modo:
    - *Assets*: contenente file aggiuntivi, quali immagini e loghi riguardanti il gruppo Rod2Cod ed il progetto
    - *Documentazione*: contenente tutti file riguardanti la documentazione del progetto
      - *Candidatura*: contenente i vari file riguardanti le candidature presentate e da presentare per il progetto in essere
      - *Verbali*: contente i file redatti in seguito a riunioni del gruppo. Al suo interno due cartelle distinguono fra verbali *interni* ed *esterni*.
      - Una *cartella* per ogni tipo di *documento* presentato (es. WoW, PdP, AdR,...) con al suo interno il documento in formato *pdf*, con un nome il quale presenti alla fine un *underscore*(\_) seguito dal numero di *versione* (es. PdQ_v1.0.0.pdf). In aggiunta a ciò, è presente una sottocartella *Deprecated* che conterrà i file con versioni deprecate del documento.
  
  + *gh-pages*: ramo che contiene tutti file di configurazione necessari a *Jekyll* e alle Github Actions per poter impostare la Webpage della repository.
  
  + *docs_source_file*: ramo contenente i file *sorgente* di Typst dei documenti presenti nella repository.

==== Utilizzo

===== Caricamento documenti
  Per il caricamento di documenti e/o modifiche a questi ultimi, come prima cosa, si effettua la *copia* della repository in *locale*(`git clone <nome_repo>`) e ci si sposta dentro la cartella così creata.
  
  Successivamente ci sposta nel ramo *master*(`git checkout master`). Qui si effettuano le modifiche/aggiunte che servono, stando attenti a rispettare il *pattern* per l'inserimento di nuovi documenti (_nome_documento/nome_documento_versione.pdf_) e lo spostamento di quelli deprecati nella rispettiva cartella. Successivamente si vanno a *modificare* anche i file di configurazione di *Jekyll* e delle *Github Actions* per includere eventuali nuove cartelle e pdf all'interno della Webpage.

  *IMPORTANTE*: i documenti devono essere #underline[verificati] e #underline[approvati] prima di essere caricati all'interno della repository di Github.
  
  Infine, dopo aver *aggiunto* le modifiche effettuate(`git add .`) e aver fatto il *commit* di queste ultime(`git commit -m <messaggio_commit>`), si effettua un'operazione di *push*(`git push <destinazione> <master>`) in modo da caricarle anche nella *repository* presente su *Github*.

===== Caricare modifiche alla Webpage
  Per il caricamento di modifiche e/o aggiunte alla Webpage, anche qui, come prima cosa, si effettua la *copia* della repository in *locale*(`git clone <nome_repo>`), ci si sposta dentro la cartella così creata e nel ramo di interesse. Successivamente ci sposta nel ramo *gh-pages*(`git checkout gh-pages`) e si effettuano le modifiche/aggiunte che servono.
  Infine, dopo aver *aggiunto* le modifiche effettuate(`git add .`) e aver fatto il *commit* di queste ultime(`git commit -m <messaggio_commit>`), si effettua un'operazione di *push*(`git push <destinazione> <gh-pages>`) in modo da caricarle anche nella repo presente su Github.

==== Sistema di ticketing

Il sistema di ticketing utilizzato per la gestione del progetto è quello integrato in GitHub, una soluzione flessibile ed efficiente che consente di monitorare le attività, segnalare problemi e pianificare il lavoro in maniera collaborativa. Questo strumento, fortemente integrato con il repository, permette al team di organizzare e tracciare ogni aspetto dello sviluppo in modo strutturato. Alla base del sistema di ticketing di GitHub ci sono le Issues, che rappresentano il cuore della gestione delle attività. Ogni issue è caratterizzata da un titolo sintetico che descrive il problema o la richiesta, una descrizione dettagliata per fornire il contesto e le istruzioni necessarie, e un insieme di etichette che aiutano a categorizzare e identificare la tipologia dell'attività. Le issues possono essere assegnate a uno o più membri del team, identificando così i responsabili della gestione e risoluzione del compito. Inoltre, è possibile associare ogni issue a obiettivi più ampi, le milestone, che consentono di raggruppare attività correlate e monitorare i progressi generali del progetto.

===== Creazione del ticket

Il processo di utilizzo del sistema prevede la creazione di una nuova issue accedendo alla relativa sezione del repository, dove viene compilato il titolo e fornita una descrizione chiara e dettagliata dell'attività. Durante questa fase, è possibile aggiungere etichette per indicare la categoria o la priorità e assegnare la issue ai membri del team più adatti. Una volta creata, l'issue diventa il riferimento centrale per tutte le attività correlate. I progressi vengono monitorati attraverso aggiornamenti nei commenti, eventuali modifiche alla descrizione o aggiunte di nuove etichette, in modo da riflettere lo stato più recente del lavoro. Una volta creata la issue, si passa sulla project board, dove in automatico verrà visualizzato il ticket con tutti i dettagli spiegati precedentemente.

===== Project board

Le Project Board di Github sono uno strumento visivo potente e versatile, progettato per gestire e organizzare il lavoro all'interno di un progetto. Ispirate al metodo Kanban, queste bacheche offrono una rappresentazione chiara e immediata del flusso di lavoro, consentendo al team di monitorare lo stato di avanzamento delle attività, identificare eventuali ostacoli e garantire un'efficace collaborazione. Nelle sezioni successive vedremo come è stato deciso di suddividere le board per la gestione dei ticket.

====== Project board per i documenti

La project board per i documenti viene suddivisa nelle seguenti colonne: 

- *Non Assegnato*: Questa colonna raccoglie i ticket che non sono stati ancora assegnati a nessun membro del team. Questi elementi rappresentano attività o problemi che devono essere valutati o presi in carico.

- *Assegnato*: I ticket in questa colonna sono stati affidati a uno o più membri del team, ma il lavoro su di essi non è ancora iniziato. Questo indica che l'attività è stata identificata e attende di essere avviata.

- *In Corso*: Qui vengono spostati i ticket sui quali si sta attivamente lavorando. È una colonna fondamentale per monitorare le attività in corso e tenere traccia dei progressi del team.

- *In Revisione*: Questa colonna contiene i ticket per i quali il lavoro è stato completato, ma che devono ancora essere revisionati. Include quindi la verifica della correttezza delle modifiche inserite, sia da un punto di vista semantico che sintattico.

- *In Approvazione*: I ticket in questa colonna sono in fase di approvazione finale. È un passaggio che coinvolge il responsabile che deve accettare o rifiutare il lavoro svolto.

- *In Attesa di Approvazione Esterna*: Questa colonna rappresenta attività che richiedono l'approvazione di soggetti esterni al team, ovvero l'azienda proponente. Indica che il lavoro è in attesa di feedback o validazione esterna.

- *Completato*: I ticket in questa colonna sono stati completati con successo. Indica che l'attività è stata svolta, revisionata e approvata, ed è ora considerata chiusa.


