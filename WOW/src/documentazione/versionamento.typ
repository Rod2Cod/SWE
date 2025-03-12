=== Versionamento dei documenti
Il versionamento dei documenti tiene traccia dei seguenti stati possibili della documentazione: *documento approvato* e *documento verificato*.
Per questo motivo la versione dei documenti è del tipo "*a.b*" dove "*a*" rappresenta l'#underline[ultima approvazione] del documento, "*b*" ne rappresenta l'#underline[ultima verifica] . In questo modo risulta molto semplice riconoscere lo stato di un documento e capire quali sono quelli da considerare validi applicando le seguenti regole:
- *Documento Verificato*\
  *b* è un qualsiasi numero diverso da 0
- *Documento Approvato*\
  *b* è 0 e *a* è un qualsiasi numero diverso da 0
=== Regole cambiamento versione
Un documento può sempre essere *modificato*, a patto di *aggiungere una riga* o *modificando quella già prresente* alla tabella ”versione del documento” e che tale modifica sia supportata da un relativo ticket. *Per poter procedere con una verifica il documento deve essere stato modificato dopo l’ultima verifica o approvazione. Per poter essere approvato un documento deve essere stato verificato e non aver subito alcun tipo di modifica*.\
In caso di correzioni di semplici errori ortografici o di battitura, questi non necessitano né di un apposito ticket né dell'aggiunta di tali correzioni nella tabella di versione del documento.\
La modifica di un documento non comporta nessuno scatto di versione, a differenza di una verifica o validazione.\
In caso un documento venga modificato, vanno inserite le modifiche apportate nella colonna descrizione e l'autore di tali modifiche nella colonna autore della tabella versione del documento. La data e il numero di versione vanno aggiornati solo in caso di verifica o approvazione.
