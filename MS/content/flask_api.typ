Flask è un framework leggero e super flessibile per Python, utile per creare applicazioni web e API. È molto usato per progetti piccoli e medi, ma con le giuste estensioni può gestire anche cose più grandi. Le sue API sono perfette per creare sistemi RESTful e far comunicare il backend con frontend o altri servizi. Motivo per cui abbiamo scelto di utilizzarlo nel progetto.

== Requisiti
- Docker e Docker Compose installati sul sistema (vedi punto 4.2).
- Permessi di amministratore per configurare directory locali e impostare volumi.

== Avvio del Sistema

+ Posizionati nella directory del progetto contenente il file docker-compose.yml.
+ Esegui il comando per avviare i container in background:
  ```bash
  docker compose up -d
  ```
  
+ L'API Flask sarà disponibile all'indirizzo: http://localhost:5000.

== Configurazione dell'API
+ Una volta avviato il sistema, l'API Flask sarà accessibile tramite richieste HTTP all'indirizzo: http://localhost:5000.
+ Verifica che l'endpoint di default risponda correttamente:
  ```bash
  curl http://localhost:5000
  ```
  
+ Utilizzeremo questo endpoint anche nel progetto, per cui tutte le richieste verranno effettuate da axios (vedi punto 5.6) verso questo endpoint, utilizzando poi le varie route, per sfruttare servizi diversi.
== Gestione del Progetto
 - Eseguire comandi all'interno del container Flask:
    ```bash
    docker exec -it <nome_container_flask> /bin/sh
    ```
- Controllare i log delle richieste in tempo reale:
  ```bash
  docker logs -f <nome_container_flask>
  ```

== Arresto del Sistema
Per arrestare e rimuovere i container:
  ```bash
  docker-compose down
  ```
== Note Finali
- Per testare endpoint più complessi, utilizza strumenti come Postman o cURL.
- In caso di problemi:
 - Controlla i log del container Flask(vedi punto 7.4)
 - Assicurati che le porte configurate nel file docker-compose.yml siano disponibili.