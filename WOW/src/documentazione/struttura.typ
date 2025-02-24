=== Strumento per la scrittura dei documenti
Per la redazione dei documenti del progetto, utilizziamo *Typst*, una tecnologia avanzata e versatile per la scrittura e la formattazione di testi. Grazie alla sua sintassi intuitiva e alla capacità di generare documenti di alta qualità, Typst permette di combinare efficienza e personalizzazione. Questo strumento garantisce una gestione semplificata del layout e uno stile professionale, ideale per soddisfare le esigenze di documentazione tecnica e collaborativa.

=== Struttura documento
Per permettere al gruppo di produrre documenti che siano coerenti tra loro a prescindere da quale componente si occupa della stesura, è necessario che abbiamo tutti una stessa struttura.
Inoltre ci sono alcune informazioni che devono essere presenti in tutti i documenti, tra cui titolo del documento e registro delle modifiche. \
Per queste ragioni è stato deciso di mantenere una struttura unica per tutti i documenti, che sarà quindi composta nel seguente modo.
==== Titolo del documento
Breve indicazione del contenuto del documento e della data di riferimento in caso sia utile.
==== Tabella versione del documento
Contiene una *raccolta* storica di tutte le *versioni* del documento, tenendo traccia sia di chi si occupa delle modifiche, dei vari verificatori, del responsabile che approva e delle differenze con la versione precedente.\
Il contenuto della tabella deve essere del tipo *LIFO*, ovvero deve contenere i numeri di versione dal maggiore al minore, rispecchiando le modifiche al documento in ordine cronologico inverso: dalla più recente alla più datata.\
L’unico documento da considerare *valido* in fase di consultazione è quello con numero di *versione maggiore* e che non ha subito nessuna modifica dopo l’approvazione, ovvero in documento con numero di versione del tipo *x.0.0*, in caso fossero presenti diversi documenti che corrispondono a questo tipo di versione, quello da consultare sarà quello con *x* maggiore.