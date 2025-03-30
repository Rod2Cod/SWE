#import "../../functions.typ": table-json-api
== Elemento Domanda
=== POST Add Elemento Domanda
*Descrizione:* Questo endpoint consente di aggiungere un nuovo elemento domanda inviando all'interno del body della richiesta, una domanda e la sua relativa risposta.
- *endpoint:* `/domande`
- *Metodo:* `POST`
- *Body:* formato `application/json` = `{"domanda": "stringa", "risposta": "stringa"}`
#table-json-api(json("tabelle.json").at("api").at("elemento_domanda").at("add"), 4)
=== GET Get Elemento Domanda
*Descrizione:* Questo endpoint consente di ottenere un elemento domanda specifico avente un determinato id.
- *endpoint:* `/domande/{id}`
- *Metodo:* `GET`
- *Parametri:* 
  - `id` = id dell'elemento domanda da ottenere
#table-json-api(json("tabelle.json").at("api").at("elemento_domanda").at("get"), 4)
=== GET Get All Elementi Domnada
*Descrizione:* Questo endpoint consente di ottenere tutti gli elementi domanda presenti nel sistema.
- *endpoint:* `/domande`
- *Metodo:* `GET`
#table-json-api(json("tabelle.json").at("api").at("elemento_domanda").at("get_all"), 4)
=== POST Delete Elementi Domanda
*Descrizione:* Questo endpoint consente di eliminare una lista di elementi domanda specificando i rispettivi id.
- *endpoint:* `/domande/delete`
- *Metodo:* `POST`
- *Body:* formato `application/json` = `{"ids": [1, 2, 3]}`
#table-json-api(json("tabelle.json").at("api").at("elemento_domanda").at("delete"), 4)
=== POST Update Elemento Domanda
*Descrizione:* Questo endpoint consente di aggiornare un elemento domanda specificando il suo id e i nuovi valori per domanda e risposta.
- *endpoint:* `/domande/{id}`
- *Metodo:* `PUT`
- *Body:* formato `application/json` = `{"domanda": "stringa", "risposta": "stringa"}`
- *Parametri:* 
  - `id` = id dell'elemento domanda da aggiornare
#table-json-api(json("tabelle.json").at("api").at("elemento_domanda").at("update"), 4)
== Esecuzione Test
=== POST Execute Test
*Descrizione:* Questo endpoint consente di eseguire un test su tutte le domande presenti nel sistema.
- *endpoint:* `/executeTest`
- *Metodo:* `POST`
== Risultato Test
=== GET Get Risultato Test
*Descrizione:* Questo endpoint consente di ottenere il risultato del test eseguito, dato il suo id.
- *endpoint:* `/risultati/{id}`
- *Metodo:* `GET`
- *Parametri:* 
  - `id` = id del risultato del test da ottenere

=== GET Get All Risultati Test
*Descrizione:* Questo endpoint consente di ottenere tutti i risultati dei test eseguiti.
- *endpoint:* `/risultati`
- *Metodo:* `GET`

=== GET Get Risultato Singola Domanda
*Descrizione:* Questo endpoint consente di ottenere il risultato di una singola domanda di un test, dato il suo id.
- *endpoint:* `/risultati/domande/{id}`
- *Metodo:* `GET`
- *Parametri:* 
  - `id` = id del risultato della singola domanda da ottenere