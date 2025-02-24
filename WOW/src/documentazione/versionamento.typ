=== Versionamento dei documenti
Il versionamento dei documenti tiene traccia dei seguenti stati possibili della documentazione: *documento approvato*, *documento verificato* e *documento modificato*.
Per questo motivo la versione dei documenti è del tipo "*a.b.c*" dove "*a*" rappresenta l'#underline[ultima approvazione] del documento, "*b*" ne rappresenta l'#underline[ultima verifica] dopo un'approvazione e "*c*" rappresenta l'#underline[ultima modifica] dopo una verifica o un'approvazione. In questo modo risulta molto semplice riconoscere lo stato di un documento e capire quali sono quelli da considerare validi applicando le seguenti regole:
- *Documento modificato*\
  *c* è un qualsiasi numero diverso da 0
- *Documento Verificato*\
  *b* è un qualsiasi numero diverso da 0 e *c* è 0
- *Documento Approvato*\
  *b* e *c* sono 0 e *a* è un qualsiasi numero diverso da 0
=== Regole cambiamento versione
Un documento può sempre essere *modificato*, a patto di *aggiungere una riga* alla tabella ”versione del documento” aggiornando coerentemente il numero di versione e che tale modifica sia supportata da un relativo ticket. *Per poter procedere con una verifica il documento deve essere stato modificato dopo l’ultima verifica o approvazione. Per poter essere approvato un documento deve essere stato verificato e non aver subito alcun tipo di modifica*.\
In caso di correzioni di semplici errori ortografici o di battitura, questi non necessitano né di un apposito ticket né dell'aggiunta di tali correzioni nella tabella di versione del documento.
