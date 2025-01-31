*Docker* è una piattaforma di containerizzazione che consente di creare, distribuire e gestire applicazioni in ambienti isolati chiamati container. Ogni container include tutto ciò che serve per eseguire l'applicazione, come il codice, il runtime, le librerie e le configurazioni necessarie. Questo approccio garantisce che l'applicazione si comporti in modo identico su qualsiasi macchina o ambiente di lavoro. 

== Vantaggi principali

- *Portabilità*: I container possono essere eseguiti su qualsiasi sistema che supporti Docker, indipendentemente dall'ambiente sottostante.
- *Isolamento*: Ogni container opera in modo isolato, evitando conflitti tra le dipendenze delle applicazioni.
- *Efficienza*: I container utilizzano meno risorse rispetto alle macchine virtuali poiché condividono lo stesso kernel del sistema operativo.
- *Scalabilità*: Docker consente di scalare facilmente applicazioni distribuite, garantendo un uso efficiente delle risorse.

== Metodi di Installazione di Docker

=== Installazione su Linux

1. Aggiorna il sistema:
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Installa Docker:
   ```bash
   sudo apt install docker.io
   ```

3. Installa Docker Compose:
   ```bash
   sudo apt install docker-compose
   ```

4. Verifica l'installazione:
   ```bash
   docker --version
   docker-compose --version
   ```

=== Installazione su macOS

1. Scarica Docker Desktop: 
   - Visita il sito ufficiale: [Docker Desktop](https://www.docker.com/products/docker-desktop).

2. Installa Docker:
   - Apri il file `.dmg` scaricato e segui le istruzioni a schermo.

3. Avvia Docker Desktop:
   - Trova Docker nelle Applicazioni e avvialo.

4. Verifica l'installazione:
   ```bash
   docker --version
   ```

=== Installazione su Windows

1. Scarica Docker Desktop:
   - Vai sul sito di Docker Desktop (https://www.docker.com/products/docker-desktop) e scarica la versione per Windows.

2. Installa Docker:
   - Esegui il file `.exe` scaricato e segui il processo guidato di installazione.

3. Abilita WSL 2 (Windows Subsystem for Linux):
   - Durante l'installazione, assicurati di abilitare WSL 2, necessario per eseguire Docker su Windows.

4. Verifica l'installazione eseguendo sul terminale il seguente comando:
   ```cmd
   docker --version
   ```
