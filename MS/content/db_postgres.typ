*PostgreSQL* è un sistema di gestione di database relazionale avanzato e open source. Viene spesso utilizzato per applicazioni che richiedono robustezza, scalabilità e conformità agli standard SQL. *pgAdmin* è uno strumento grafico per la gestione dei database PostgreSQL.

== Requisiti

- Docker e Docker Compose installati sul sistema (vedi punto 4.2).
- Permessi di amministratore per configurare directory locali e impostare volumi.

== Avvio del Sistema

1. Posizionati nella directory del progetto contenente il file `docker-compose.yml`.
2. Esegui il comando per avviare i container in background:
   ```bash
   docker compose up -d
   ```
3. Il database PostgreSQL esporrà delle API alla porta `5432`.
4. pgAdmin sarà accessibile all'indirizzo: http://localhost:5050.

== Configurazione di pgAdmin

1. Accedi a pgAdmin tramite il browser (http://localhost:5050).
2. Usa le credenziali predefinite configurate nel file `docker-compose.yml` (email `admin@admin.com` e password `admin`).

3. Una volta entrato dovrebbe esserci già il database impostato e visibile. In caso contrario configura un nuovo server per connetterti al database PostgreSQL:
   - Nome PostgreSQL
   - Host `postgres`
   - Porta `5432`
   - Utente quello configurato (`admin`)
   - Password quella configurata nel file `docker-compose.yml`.

== Gestione del Database

- Per accedere alla shell interattiva del database:
  ```bash
  docker exec -it <nome_container_postgres> psql -U <utente>
  ```

== Arresto del Sistema

- Per arrestare e rimuovere i container:
  ```bash
  docker-compose down
  ```

== Note Finali

- Assicurati che le directory `db_data` e `pgadmin_data` siano correttamente configurate per garantire la persistenza dei dati.
- Se riscontri problemi, controlla i log dei container con:
  ```bash
  docker logs <nome_container>
  ```