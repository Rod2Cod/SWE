Qui di seguito vengono descritti i principali problemi noti presenti all'interno del sistema.

== Backend Flask
Nella prima operazione di esecuzione di un test dopo il deployment dell'applicativo, il sistema potrebbe sembrare in stallo, non restituire un risultato o ritornare un errore. \
Ciò è dovuto al fatto che il sistema non ha ancora caricato i modelli LLM utilizzati dall'Algoritmo di Valutazione. \
Il caricamento dei modelli richiede un tempo variabile a seconda della potenza del server, della velocità di scaricamento dei modelli stessi e dalle loro grandezze. \

Una volta che viene eseguito il test per la prima volta ed il modello viene caricato, il sistema non dovrebbe più presentare questo problema.