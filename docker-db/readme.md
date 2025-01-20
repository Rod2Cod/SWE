
# Guida al Sistema PostgreSQL e pgAdmin

Questa guida fornisce istruzioni dettagliate per configurare un ambiente Docker che include un database PostgreSQL e uno strumento di gestione pgAdmin per l'accesso e la gestione tramite interfaccia grafica.


## Requisiti

- **Docker** e **Docker Compose** installati sul tuo sistema.
- Permessi di amministratore per creare e gestire directory locali.


## Avvio, Utilizzo e Spegnimento del Sistema

### Avvio del Sistema
1. Esegui il seguente comando per avviare i container in background:
   ```bash
   docker compose up -d
   ```

### Utilizzo di pgAdmin
1. Accedi a pgAdmin tramite browser all'indirizzo: [http://localhost:5050](http://localhost:5050).
2. Usa le credenziali configurate (`admin@admin.com` e `admin`).
3. All'interno verrà visualizzata l'interfaccia di pgAdmin, con già il database collegato e configurato

### Spegnimento del Sistema
Per spegnere i container e rilasciare le risorse:
```bash
docker compose down
```

## Tabelle Riassuntive di Tutti i Comandi

| **Comando**                     | **Descrizione**                                                                 |
|---------------------------------|---------------------------------------------------------------------------------|
| `docker compose up -d`          | Avvia tutti i container definiti nel file `docker-compose.yml`.                 |
| `docker compose down`           | Arresta e rimuove tutti i container, mantenendo i volumi.                       |
| `docker ps`                     | Mostra tutti i container in esecuzione.                                         |
| `docker logs <container_name>`  | Mostra i log del container specificato.                                         |
| `docker exec -it <container> bash` | Apre una shell interattiva nel container specificato.                          |
| `sudo chown -R 5050:5050 <dir>` | Imposta i permessi corretti per pgAdmin (directory configurata).                 |
| `rm -rf <dir>`                  | Elimina una directory, utile per reimpostare i volumi locali (usare con cautela).|

---

## Note Finali

- Per garantire la persistenza dei dati, assicurati che le directory `db_data` e `pgadmin_data` siano configurate correttamente con i permessi necessari.
- Se riscontri problemi, consulta i log dei container per diagnosticare eventuali errori.
