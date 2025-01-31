#import "functions_mod.typ": table-json

== Introduzione
  Qui di seguito verranno analizzati i rischi che si possono verificare durante lo svolgimento del progetto e si descrivono le possibili azioni volte a mitigarli. Ad ogni rischio è assegnato un codice che lo identifica univocamente, in modo da poterlo facilmente riconoscere nelle altre sezioni del documento. Dopo averli elencati, si analizzerà l’occorrenza effettiva di tali rischi e si valuterà se la mitigazione proposta sarà stata efficace.

== Rischi interni
  #table-json(json("tabelle.json").at("rischi").at("interni"), 4)

== Rischi tecnologici
  #table-json(json("tabelle.json").at("rischi").at("tecnologici"), 4)

== Rischi organizzativi
  #table-json(json("tabelle.json").at("rischi").at("organizzativi"), 4)

== Rischi riguardanti il capitolato
  #table-json(json("tabelle.json").at("rischi").at("capitolato"), 4)

== Tabella riassuntiva
  Nella tabella seguente vengono valutati l’*occorrenza*, l’*impatto* e l’*efficacia* della mitigazione per
  ogni rischio individuato nelle tabelle soprastanti.

  Per quanto riguarda l'*occorrenza*, si prevedono tre livelli di probabilità:
    - Alta
    - Media
    - Bassa

  Per quanto riguarda l'*impatto*, si prevedono tre livelli di probabilità:
    - Alto
    - Medio
    - Basso

  Per quanto riguarda l'*efficacia della mitigazione*, si prevedono tre livelli di probabilità:
    - Alta
    - Media
    - Bassa
  Nel caso in cui non si fosse *mai verificato* il rischio, verrà mostrato nella tabella il simbolo
  "\/\/".
    
  #table-json(json("tabelle.json").at("rischi").at("riassunto"), 4)