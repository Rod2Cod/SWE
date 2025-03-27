= Riferimenti normativi 
- Regolamento progetto didattico (https://www.math.unipd.it/~tullio/IS-1/2024/Dispense/PD1.pdf)
= Riferimenti informativi
- Analisi dei requisiti v2.0
- Piano di Progetto v1.0
- Piano di Qualifica v1.0
- Candidatura v1.0
- Specifica Tecnica v1.0


= Processi primari

/* == Acquisizione  (compito dell'azienda) */

== Fornuitura
Il processo di fornitura viene avviato dopo aver ricevuto la le proposte dai proponenti (prsentazione dei capitolati), serve ad analizzare le proposte per poi decidere quale accettare ed eventualmente proporre modifiche. Sucessivamente vengono definite le procedure e le risorse necessarie per completare e assicurare il progetto, stilando il piano di progetto.
Si compone delle seguenti attività: 
=== Inizializzazione
+ Si analizzano i capitolati valutando pro e contro di ognuno, focalizzandosi sull'identificare possibili criticità. 
+ Per i capitolati di maggiore interesse si organizzano degli incontri con gli acquirenti per approfondire le proposte ed eventualmente discutere di possibili modifiche. 
+ I risultati delle analisi e degli incontri vengono documentati nel documento "Resoconto_Capitolati"
=== Preparazione risposta e Contratto
Viene scelto il capitolato per cui ci si vuole candidare sulla base delle considerazioni contenute nel documento "Resoconto_Capitolati" e viene preparato il documento "Candidatura" contenente i preventivi preliminari riguardanti monte ore necessario a l completamento, cosi di realizzazione, data di consegna. Il documento conterrà anche le motivazioni della scelta del capitolato.
Il documento viene inviato al committente e viene attesa la risposta. Se negativa l'attività viene ripetuta in toto se il capitolato è ancora disponibile, altrimenti viene selezionato un capitolato differente.
=== Pianificazione
/* DA INSERIRE NEL PdP
+ Il modello di ciclo di vita che abbiamo scelto è un modello Agile. Sono definiti dei periodi di tempo generalmente della durata di 2 settimane circa. All'inizio di ogni periodo durante una riunione vengono definite le attività da svolgere durante il periodo e assegnate a chi se ne occuperà. Alla fine del periodo ognuno riporta agli altri membri del team i progressi ottenuti e le difficoltà incontrate. Idealmente ogni periodo è incrementale, ma sono consentite iterazioni. Abbiamo previsto anche una riunione di aggiornamento nel mezzo del periodo in modo da riportare le problematiche il prima possibile e riuscire a risolverle tempestivamente, vista l'inesperienza che ci caratterizza. Uno specifico caso di iterazione è lo sviluppo di un PoC, un protoipo con funzionalità base per testare la fattibilità del progetto e le tecnologie che si vogliono utilizzare. Questo non ha la finalità di diventare parte del prodotto finale ma solo di scoprire presto e con il minore sforzo possibile eventuali problemi, perciò il codice che lo compone non rispetta gli standard di qualità prefissati e perciò è bene riscriverlo da capo una volta che esso ha finito di svolgere la sua funzione.
Ogni membro del team ricopre tutti i ruoli, che ruotano in base alle necessità momentanee del team, qurante la programmazione del periodo viene fatta attenzione a far si che tutti i membri del team si occupino delle mansioni assegnate ai diversi ruoli in modo equo sulla base delle ore impiegate nel corso del progetto. */
+ viene definito o selezionato un modello di ciclo di vita del software appropriato alla portata, alla grandezza e alla complessità del progetto. Esso viene documentato all'interno del documento "Piano di Progetto".
+ I requisiti dell'acquirente vengono analizzati in dettaglio e documentati nel documento "Analisi dei requisiti", che funge da base per la progettazione e lo sviluppo del software, come definito dal processo di documentazione.
+ Viene elaborato e documentato il "Piano di progetto", che definisce gli obiettivi, le scadenze, le risorse, i rischi e le strategie di gestione del progetto, come definito dal processo documentazione.
+ Viene sviluppato e documentato il "Piano di qualifica", che stabilisce le procedure di test, le metriche di qualità e i criteri di accettazione per garantire la conformità ai requisiti.
+ Vengono definite le norme di progetto e documentate nel documento "Way of Working", al momento del bisogno, ovvero poco prima che i relativi processi vengano istanziati. Vengono poi aggiornate e migliorate durante tutta la durata del progetto in modo incrementale. 
=== Esecuzione e Controllo 
+ Viene aggiornato all'inizio e alla fine di ogni periodo il Piano di progetto riportando pianificazione, preventivo, consuntivo e retrospective.
+ Viene sviluppato il Software in accordo con il processo di Sviluppo.
+ Viene Monitorato alla fine di ogni periodo i prograssi raggiunti, i costi e le difficoltà incontrate, operando tempestivamente azioni correttive quando necessarie.
+ Vengono Identificati, documentati, analizzati e elaborate modalità di risoluzione per i problemi incontrati durante l'attività di retrospective nella riunione di fine periodo.
+ Viene Comunicato lo stato di avanzamento al proponente durante le riunioni periodiche.
=== Revisione e Valutazione 
+ Vengono svolte riunioni settimanali informali tra i membri del team, qualora necessario vengono pianificate altre riunioni. Queste servono ad aggiornarsi sullo stato di avanzamento, a pianificare e assegnare i prossimi compiti da svolgere. Nelle riunioni che coincidono con la fine di un periodo vengono presentati i cruscotti e si esegue l'attività di retrospective come definito nell'attività verifica documentazione del processo di verifica, poi si pianifica e si stila il preventivo riguardante il periodo sucessivo.  
+ Ogni mese viene organizzata una riunione con il proponente per esporre lo stato di avanzamento, discutere eventuali problematiche e modifiche da apportare.
Qualora si presentasse la necessità vengono organizzate insieme al proponente delle riunioni aggiuntive.
+ Vengono sostenute le revisioni di avanzamento RTB e PB come definito nel documento "Regolamento del Progetto Didattico".
+ I cruscotti e tutti i documenti di interesse vengono esposti al proponente tramite GitHub-pages.
+ Ad ogni modifica del prodotto viene eseguito il processo di verifica, prima delle revisioni di avanzamento viene eseguito il processo di validazione.
=== Consegna e completamento
Alla fine del progetto il prodotto software viene installato nella macchina del proponente, e viene fornita la relativa documentazione.
Esso viene anche eseguito e testato in presenza del proponente in modo da dimostrarne il funzionamento. 
Se durante la consegna il proponente pone delle domande gli deve essere fornita una risposta, sul momento o in differita se necessario. 
== Sviluppo
 Il processo di sviluppo definisce le attività per l'analisi dei requisiti, la progettazione, la codifica, l'integrazione, il test, l'installazione e l'accettazione relative ai prodotti software. Si compone delle seguenti attività: 
=== Implementazione Processi
 + Tutti i risultati del processo vengono documentati in conformità al processo di documentazione.
 + Viene eseguito il controllo delle modifiche sui risultati del processo di sviluppo in conformità con il processo gestione della configurazione. /*da impelentare --> pull request per il codice*/
 + Vengono documentati e risolti i problemi nel software in conformità con il processo di risoluzione dei problemi. /* da implementare, si tratta di documentare i problemi e poi documentare il modo in cui li si è risolti scrivendo il perchè */ 
 + Vengono selezionati gli standard, modelli, strumenti e linguaggi di programmazione che sono documentati e appropriati per l'esecuzione delle attività del Processo di Sviluppo e dei processi di supporto.
 + Tutto ciò che è necessario alla manutenibilità del software viene consegnato con il prodotto.
=== Analisi dei requisiti di sistema
 I requisiti di sistema vengono definiti e documentati nel documento "Analisi dei requisiti". Ogni requisito viene classificato in base alla tipologia (Funzionale, di qualità o di Vincolo) e all'importanza (Obbligatorio,desiderabile, opzionale), gli viene assegnato un codice univoco e viengono tracciate le fonti da cui deriva. 
=== Progettazione Architettura di sistema
+ Viene Progettata l' architettura del sistema (HW SW), tracciando tutti i requisiti di sistema agli elementi individuati (HW SW) nel documento "Specifica Tecnica"
+ L'architettura e gli elementi individuati vengono valutati nel documento "Specifica Tecnica"  documentando Tracciabilità ai requisiti del sistema e Fattibilità degli elementi software che soddisfano i requisiti assegnati.
=== Analisi dei Requisiti Software
+ I requisiti di sistema vengono definiti e documentati nel documento "Analisi dei requisiti". Ogni requisito viene classificato in base alla tipologia (Funzionale, di qualità o di Vincolo) e all'importanza (Obbligatorio,desiderabile, opzionale), gli viene assegnato un codice univoco e viengono tracciate le fonti da cui deriva. 
+ Vengono fatte una o piu riunioni con il proponente per revisionare l'analisi dei requisiti e per stabilire l'importanza di ognuno.
=== Progettazione Architettura del Software
+ Viene progettata l'architettura del Software, che comprende le interfacce esterne e interne tra componenti, design del Database.
+ Ogni requisito viene associato ad un componente SW e documentato nel documento "Specifica Tecnica".
+ Viene redatta una versione preliminare della documentazione per gli utenti (Manuale utente e relativo glossario)
+ vengono definiti i requisiti di test 
+ Vengono fatte una o piu riunioni con il proponente per revisionare la progettazione architetturale svolta. 
=== Progettazione di dettaglio 
+ i requisiti che sono stati assegnati ai componenti nella progettazione architetturale devono essere asseganti alle unità che li compongono. 
+ viene fatta la progettazione dettagliata delle interfacce (interne e verso l'esterno) che ne consente la codifica senza altre info.
+ viene fatta la progettazione dettagliata del database che ne consente la codifica senza altre info.
+ viene aggiornata la documentazione utente
+ vengono definiti i requisiti di test e documentati nel documento "Specifica Tecnica" 
+ vengono programmati test che stressino i componenti
+ viene definito come tracciare i requisiti dei componenti
+ vengono fatte una o più riunioni con il proponente per revisionare la progettazione di dettaglio svolta. 
=== Codifica e test del software
+ viene redatto il documento "Specifica Tecnica" documentando tutto il codice prodotto, i test effettuati e i dati utilizzati per i test. 
+ viene ultimanta la documentazione utente
+ vengono aggiornati i requisiti di test se necessario 
+ viene pianificata l'integrazione del Software
=== Integrazione software
+ viene sviluppato un piano di integrazione per integrare le unità software e i componenti software nell'elemento software. Il piano deve includere i requisiti di prova, le procedure, i dati, le responsabilità e il programma. Il piano deve essere documentato nel documento "Specifica Tecnica".
+ i risultati dell'integrazione vengono documentati nel documento "Specifica Tecnica"
+ bisogna garantire che l'elemento software integrato sia pronto per il test di qualificazione del software.
+ vengono fatte una o più riunioni con il proponente per mostrare i risultati dell'integrazione software svolta. 
=== Test di qualificazione del software 
+ viene verificato che tutti i requisiti siano rispettati 
+ nel documento "Specifica Tecnica" viene inserita la valutazione di Progettazione, codice, test, risultati dei test considerando : Test di copertura dei requisiti dell'elemento software; b) Conformità ai risultati attesi; c) Fattibilità dell'integrazione del sistema e del collaudo, se condotto d) Fattibilità dell'esercizio e della manutenzione
+ Vengono sostenute le revisioni di avanzamento RTB e PB come definito nel documento "Regolamento del Progetto Didattico".
=== Integrazione di sistema
Per ciascun requisito di qualificazione del sistema, deve essere elaborata e documentata una serie di prove, casi di prova (input, output, criteri di prova) e procedure di prova per l'esecuzione di prove di qualificazione del sistema. Il committente deve garantire che il sistema integrato sia pronto per le prove di qualificazione del sistema 
che provano il rispetto dei requisiti
il sistema deve essere valutato in base a : Testare la copertura dei requisiti di sistema; b) adeguatezza dei metodi di prova e degli standard utilizzati; c) Conformità ai risultati attesi; d) Fattibilità delle prove di qualificazione del sistema; e) Fattibilità del funzionamento e della manutenzione. /* rivedere questa attività insieme */
=== Test di qualificazione del sistema
+ durante una riunione viene presentato l'MVP al proponente che valuta il prodotto e decide se approvarlo
=== Installazione del software
+ viene documentata la procedura di installazione del Software


/*== Processo operativo*/
/*== Manutenzione*/


= Processi di supporto 
== Documentazione 
#include "documentazione/struttura.typ"
#include "documentazione/versionamento.typ"
#include "documentazione/nomenclatura.typ"
#include "documentazione/processi.typ"
#include "documentazione/verbali.typ"
#include "documentazione/utilizzoTemplate.typ"
#include "documentazione/glossario.typ"
#include "documentazione/pianoDiProgetto.typ"
#include "documentazione/analisiDeiRequisiti.typ"


== gestione della configurazione
+ nel branch master devono comparire solo documenti validati e codice verificato
+ Prima di ogni release del codice sul branch master viene eseguito il test statico del codice come è definito nel processo di verifica attraverso una pull-request che ne causa la notifica agli altri membri del team.
#include "documentazione/github.typ"

== assicurazione della qualità
+ il piano di qualifica deve includere : Standard di qualità, metodologie, procedure e strumenti per lo svolgimento delle attività di assicurazione della qualità (o i loro riferimenti nella documentazione ufficiale dell'organizzazione); b) le procedure di revisione e coordinamento dei contratti; c) Procedure per l'identificazione, la raccolta, l'archiviazione, il mantenimento e lo smaltimento dei registri di qualità;Risorse, calendario e responsabilità per lo svolgimento delle attività di assicurazione della qualità; e) Attività e compiti selezionati dai processi di supporto, come la verifica (6.4), la convalida (6.5), la revisione congiunta (6.6), l'audit (6.7) e la risoluzione dei problemi (6.8). /* da verificare che li contenga*/
#include "documentazione/pianoDiQualifica.typ"
=== assicurazione prodotti
+ le tempistiche verranno rispettate, documentate e coerenti con il regolamento del progetto didattico come anche il SW. 
=== assicurazione Processi 
+ i processi necessari al completamento del progetto vengono identificati, definiti e documentati nel documento Way of Working prima di essere istanziati
+ viene adottato il framework standard iso/iec 12207
+ durante l'attività di retrospective vengono identificate le inefficienze e i problemi nei processi e poi proposti miglioramenti.
+ Per ogni processo identificato come automatizzabile, viene valutata la convenienza dell'automazione in base alla dimensione e alla complessità del progetto. Se ritenuto vantaggioso, il processo viene implementato tramite una GitHub Action o altri strumenti appropriati.
/* aggiungere automazioni varie*/


== verifica
+ tutti i documenti vengono verificati dopo ogni modifica da un componente del gruppo diverso dall'autore
+ tutto il software prodotto deve essere verificato ad ogni modifica
=== retrospective
+ durante l'azione di retrospective vengono identificati, documentati, analizzati i problemi incontrati ed elaborate modalità di risoluzione. Ciò avviene per verificare l'efficacia dei processi adottati e al contempo per renderli flessibili abbastanza da poterli adattare ai cambiamenti possibili. 
=== verifica documentazione
+ La verifica della documentazione consiste nella lettura del testo prodotto e nell’eventuale *correzione di errori* ortografici rilevati nonché nella modifica della struttura del documento al fine di rendere l’argomento trattato di *facile consultazione*.\
  Nel caso in cui certi punti dovesse risultare poco chiari, si procederà ad una o più modifiche successive al fine di esprimere tali concetti in modo migliore. \
  Nella tabella delle versioni, la persona assegnata a questo compito viene indicata all'interno della colonna *Verificatore*.
=== verifica codice
+ Test statici : 
  - prima di ogni release tutto il codice che ha subito modifiche viene verificata da due componenti del gruppo leggendo il codice e comprendendone il funzionamento, ricercando eventuali errori. 
  - code coverage : 
  - ciclomatic complexity : 
+ Test dinamici : 
    - il ogni test dinamico con esito negativo va documentato nel documento "Specifica tecnica"
    - il codice viene testato tramite test di unità nella misura definita nel documento piano di Qualifica. Ogni test di unità deve stressare il componente testando il suo fuinzionamento in condizioni normali, limite e in cui ci si aspetta che non funzioni. 
    - viene testata l'integrazione dei vari componenti come previsto dall'attività Integrazione Software del processo di sviluppo.

== validazione 
=== Validazione documentazione 
+ consiste nella *lettura* del documento prodotto e nella *verifica della
  conformità* con i punti che questo dovrebbe trattare.\
  In caso vengano rilevati errori nei concetti espressi/mancanti, il documento tornerà alla fase di modifica. \
  Nella tabella delle versioni, la persona assegnata a questo compito viene indicata all'interno della colonna *Validatore*.
=== Validazione Prodotto
+ durante una riunione viene presentato l'MVP al proponente che valuta il prodotto e decide se approvarlo
=== revisione congiunta
+ le revisioni congiunte con il proponente sono programmate periodicamente ogni mese, l'odg è definito in precedenza e approvato dal proponente
=== audit
+ come definito nel "Regolamento del progetto didattico" il committente valuta il prodotto e i processi durante gli incontri per la presentazione dell'RTB e PB.
=== risoluzione dei problemi
+ I problemi rilevati e le relative azioni di mitigazione vengono documentati nella sezione retrospective del documento Piano di Progetto, essi vengono anche tracciati ai rischi identificati nell'analisi dei rischi. 


= Processi organizzativi
#include "documentazione/riunioni.typ"
#include "documentazione/tracciamentoOre.typ"
== infrastrutturale 
+ viene utilizzato git come strumento di versionamento e github come repository, inoltre viene ulilizzato github-pages per esprre la documentazione e github-action per l'automatizzazione dei processi.
== formazione
+ Ogni membro del team è responsabile della propria formazione sugli strumenti e sulle tecnologie utilizzate nel progetto.  
+ In caso di difficoltà o dubbi, è incentivata la condivisione delle conoscenze all'interno del team.  
+ I progressi nell'apprendimento possono essere discussi durante gli incontri periodici per favorire l'allineamento delle competenze.













