#import "../../functions.typ": table-json-rev

== Introduzione
  Questa sezione permette di individuare e classificare le *funzionalità* dell’applicazione e le *richieste* del proponente per poi avere una lista chiara e completa di tutto ciò che dovrà contenere il prodotto finale da presentare.

== Formato codice dei requisiti
  //prendendo spunto da progetto anno precedente - un modo per classificare tramite codice i requisiti

  Il codice dei requisiti viene definito così: \
  #align(center)[
    *R[Tipologia]-[Importanza].[Codice]*
  ]
  Dove abbiamo:
    - *R*: acronimo di 'Requisito';
    
    - *Tipologia*: tipologia del requisito:
      - *F*: Funzionale;
      - *Q*: Qualità;
      - *V*: Vincolo;
      
    - *Classificazione*: identifica l’importanza del requisito:
      - *1*: Obbligatorio;
      - *2*: Opzionale;
      - *3*: Desiderabile;
      
    - *Codice*: codice univoco del requisito il quale presenta, in alcuni casi, dei sottocasi
      identificati con un punto seguito dal rispettivo codice del sottocaso.

== Requisiti funzionali
  #table-json-rev(json("tabelle.json").at("requisiti_funzionali"), 4)

== Requisiti di qualità
  #table-json-rev(json("tabelle.json").at("requisiti_qualità"), 4)

== Requisiti di vincolo
  #table-json-rev(json("tabelle.json").at("requisiti_vincolo"), 4)
  