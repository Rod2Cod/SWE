
# Avvio dell'Applicazione e Test con Docker e Node.js

Guida su come avviare l'applicazione, eseguire test e visualizzare i report di coverage del codice utilizzando Docker o Node.js.

---

## Requisiti

- **Docker**: Assicurati che Docker sia installato e configurato correttamente.
- **Node.js**: Verifica di avere installato Node.js e npm (Node Package Manager).


---

## Con Docker

> **Nota**: Assicurati che i comandi di questa sezione docker eseguiti nella directory del progetto `docker-react`.


### Avvio dell'applicazione
1. Costruzione e avvio in modalità detached:
   ```bash
   docker-compose up --build -d
   ```

2. L'applicazione sarà disponibile all'indirizzo:
   [http://localhost:5173](http://localhost:5173)

### Esecuzione dei test
1. Avvia i test unitari:
   ```bash
   docker exec -it frontend-react npm run test
   ```

2. Genera il report di coverage del codice:
   ```bash
   docker exec -it frontend-react npm run test:coverage
   ```

### Arresto dell'applicazione
1. Per fermare i container Docker:
   ```bash
   docker-compose down
   ```
### Visualizzazione dei log
1. Per visualizzare i log di un container:
   ```bash
   docker logs frontend-react

2. Per visualizzare i log in tempo reale:
   ```bash
   docker logs -f frontend-react
   ```

---

## Con Node.js

> **Nota**: Assicurati che i comandi di questa sezione docker eseguiti nella directory del progetto `react_app`.


### Avvio dell'applicazione
1. Avvio in locale:
   ```bash
   npm run dev
   ```

2. Avvio con esposizione su tutti gli indirizzi IP della macchina:
   ```bash
   npm run host
   ```

3. L'applicazione sarà disponibile all'indirizzo:
   [http://localhost:5173](http://localhost:5173)


### Esecuzione dei test
1. Avvia i test unitari:
   ```bash
   npm run test
   ```

2. Genera il report di coverage del codice:
   ```bash
   npm run test:coverage
   ```

### Arresto dell'applicazione
1. Per fermare il processo Node.js, utilizza la combinazione di tasti:
   ```
   CTRL + C
   ```
### Visualizzazione dei log
I log di Node.js sono visibili direttamente nella console quando avvii il processo utilizzando `npm run dev` o `npm run host`.

---

## Visualizzazione del report di coverage

Il report di coverage è disponibile in formato HTML e può essere visualizzato aprendo il file `index.html` nella cartella `coverage`. I comandi per aprire il file su diversi sistemi operativi sono indicati di seguito:

> **Nota**: Assicurati che i comandi di questa sezione docker eseguiti nella directory del progetto `react_app`.

### Linux
```bash
xdg-open coverage/index.html
```

### Windows
```cmd
start coverage\index.html
```

### MacOS
```bash
open coverage/index.html
```

---

## Struttura dei comandi



### Comandi per Docker

| **Comando**                                       | **Descrizione**                                   | **Directory**                                                                 |
|---------------------------------------------------|-------------------------------------------------|-------------------------------------------------------------------------------|
| `docker-compose up --build -d`                   | Costruisce e avvia l'app in modalità detached.  | [`docker-react`](./docker-react)                                             |
| `docker exec -it frontend-react npm run test`    | Esegue i test unitari.                         | [`docker-react`](./docker-react)                                             |
| `docker exec -it frontend-react npm run test:coverage` | Genera il report di test coverage.            | [`docker-react`](./docker-react)                                             |
| `docker-compose down`                            | Ferma i container e rimuove le reti.           | [`docker-react`](./docker-react)                                             |
| `docker logs frontend-react`                     | Mostra i log del container Docker.             | [`docker-react`](./docker-react)                                             |
| `docker logs -f frontend-react`                  | Mostra i log in tempo reale del container Docker. | [`docker-react`](./docker-react)                                           |

---

### Comandi per Node.js

| **Comando**                                       | **Descrizione**                                   | **Directory**                                                                 |
|---------------------------------------------------|-------------------------------------------------|-------------------------------------------------------------------------------|
| `npm run dev`                                    | Avvia l'applicazione in modalità locale.        | [`react_app`](./react_app)                                                   |
| `npm run host`                                   | Avvia l'app con esposizione su tutti gli IP.   | [`react_app`](./react_app)                                                   |
| `npm run test`                                   | Esegue i test unitari.                         | [`react_app`](./react_app)                                                   |
| `npm run test:coverage`                          | Genera il report di test coverage.            | [`react_app`](./react_app)                                                   |
| `CTRL + C`                                       | Ferma il processo Node.js in esecuzione.       | [`react_app`](./react_app)                                                   |

---

### Comandi per visualizzare il report di coverage

| **Sistema Operativo** | **Comando**                     | **Descrizione**                                   | **Directory**                                                                 |
|------------------------|---------------------------------|-------------------------------------------------|-------------------------------------------------------------------------------|
| Linux                 | `xdg-open coverage/index.html` | Apre il report di coverage.                     | [`react_app/coverage/index.html`](./react_app/coverage/index.html)            |
| Windows               | `start coverage\\index.html`   | Apre il report di coverage.                     | [`react_app/coverage/index.html`](./react_app/coverage/index.html)            |
| MacOS                 | `open coverage/index.html`     | Apre il report di coverage.                     | [`react_app/coverage/index.html`](./react_app/coverage/index.html)            |
