
*Vue.js* è un framework JavaScript progressivo sviluppato per creare interfacce utente dinamiche e interattive. È particolarmente adatto allo sviluppo di applicazioni web a pagina singola (SPA).

== Vantaggi principali

- *Component-Based Architecture*: Vue utilizza componenti modulari e riutilizzabili per costruire interfacce utente.
- *Virtual DOM*: Aggiorna solo le parti necessarie del DOM reale, migliorando le prestazioni.
- *Ecosistema*: Offre un vasto ecosistema di librerie e strumenti per semplificare lo sviluppo.

== Installazione e Avvio del Frontend

*Requisiti:*
- Assicurati che *Docker* sia installato e configurato correttamente (vedi punto 4.2).
- Installa *Node.js* e npm seguendo questo link:   https://nodejs.org/en/download/package-manager

== Utilizzo con Docker

=== Avvio dell'applicazione

1. Posizionati nella directory `docker-vue`.
2. Esegui:
```bash
docker-compose up --build -d
```
3. L'applicazione sarà disponibile all'indirizzo: http://localhost:5173

=== Esecuzione dei Test

1. Avvia i test unitari:
```bash
docker exec -it frontend-vue npm run test
```
2. Genera il report di coverage:
```bash
docker exec -it frontend-vue npm run test:coverage
```

=== Arresto dell'applicazione

- Ferma i container:
```bash
docker-compose down
```

== Utilizzo con Node.js

=== Avvio dell'applicazione

1. Posizionati nella directory `vue_app`.
2. Esegui:
```bash
npm run dev
```
3. L'app sarà disponibile all'indirizzo: http://localhost:5173

=== Esecuzione dei Test

1. Esegui i test unitari:
```bash
npm run test
```
2. Genera il report di coverage:
```bash
npm run test:coverage
```

=== Arresto dell'applicazione

- Interrompi il processo:
```bash
CTRL + C
```

=== Risoluzione dei Problemi

- Se l'applicazione non si avvia:
  - Controlla che tutte le _dipendenze_ siano installate correttamente.
  - Verifica la _versione_ di Node.js (consigliata: LTS).
- Se ci sono errori durante la fase di build:
  - Controlla la _configurazione_ del file `docker-compose.yml` o verifica eventuali moduli mancanti in Node.js.
- Se ci sono errori di rete:
  - Assicurati che nessun altro servizio stia utilizzando la _porta_ `5173`.

== Bootstrap

Bootstrap è una libreria CSS progettata per semplificare lo sviluppo di interfacce utente responsive e moderne. Offre un'ampia gamma di componenti predefiniti, stili CSS e JavaScript per creare layout uniformi e compatibili con diversi dispositivi.

La versione più recente di Bootstrap si basa su Flexbox e CSS Grid, offrendo una maggiore flessibilità nel design dei layout.

Abbiamo deciso di integrarla nello sviluppo della nostra applicazione Vue per accelerare lo sviluppo front-end senza la necessità di scrivere CSS complessi da zero. Utilizzando Node come gestore dei pacchetti, l'installazione avviene tramite npm.

== Axios

Axios è una libreria JavaScript per fare richieste HTTP, basata su Promises. È utilizzata per comunicare con API, recuperare dati da server remoti e inviare informazioni.

Axios supporta tutte le principali operazioni HTTP, come GET, POST, PUT, DELETE, e fornisce funzionalità avanzate come intercettori, configurazioni globali e gestione automatica delle intestazioni.

Abbiamo scelto questa libreria in quanto offre molta più flessibilità per la comunicazione con le API rispetto al semplice `fetch` fornito da JavaScript base.
