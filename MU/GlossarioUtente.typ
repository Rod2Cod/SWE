#let glossario = (
  
  "DOM|Document Object Model":"interfaccia di programmazione che rappresenta la struttura di un documento HTML o XML come una gerarchia di nodi.",
  
  "GitHub":"Piattaforma online che consente agli sviluppatori di creare, salvare, gestire e condividere il proprio codice sorgente, facilitando la collaborazione e il controllo delle versioni.",

  "GH-Pages|GitHub Pages":"Sistema proposto da Github per l'impostazione di una pagina web relativa alla repository/organizzazione in questione.",

  "infrastructure as code":"Metodo di lavoro, riguardante l'infrastruttura IT, che utilizza file di configurazione scritti spesso in formato YAML o JSON, per definire e automatizzare la creazione, configurazione e gestione di risorse hardware e software.",

  "LLM|Large Language Model":"Modello linguistico preaddestrato su grandi quantità di dati, in grado di comprendere e generare testo in linguaggio naturale in ambito generale.",
  
  "LTS|Long Term Support":"versione software supportata a lungo termine con aggiornamenti di sicurezza e stabilità.",

  "NLP|Natural Language Processing":"Insieme di processi che permettono di estrarre informazioni dal testo al fine di facilitare l'elaborazione e/o la comprensione. Tali processi possono essere svolti tramite algoritmi o grazie a intelligenze artificiali specializzate.",

  "norma":"Documento o parte di esso che stabilisce specifiche di comportamento dei membri del gruppo oppure specifiche tecniche di entità, oggetti e concetti.",
  
  "npm|Node Package Manager":"Gestore di pacchetti per Node.js che consente agli sviluppatori di installare, condividere e gestire librerie JavaScript.",

  "pgAdmin":"Strumento grafico per la gestione e l'interrogazione dei database PostgreSQL.",

  "Pip|Python Package Installer":"il gestore di pacchetti ufficiale per Python. Permette di installare, aggiornare e gestire pacchetti e librerie Python",

  "Repository|Repo":"Archivio digitale centralizzato che gli sviluppatori utilizzano per apportare e gestire le modifiche al codice sorgente o ad altre componenti di un'applicazione.",

  "Ruby":"Linguaggio di programmazione interpretato, dinamico e general-purpose, orientato agli oggetti.",

  "SV|Schedule Variance":"Metrica che indica in percentuale quanto si è in anticipo o in ritardo con le attività pianificate. Viene definita come: (EV - PV).",

  "SPA|Single Page Application":"Applicazione web che carica una singola pagina HTML e aggiorna dinamicamente il contenuto senza ricaricare l'intera pagina.",

  "SQL|Structured Query Language":"Linguaggio standard per la gestione e l'interrogazione di database relazionali.",

  "stemming":"Parte del NLP che consiste nell'estrarre la radice di un termine.",

  "task":"Compito specifico, procedura o sequenza di istruzioni da svolgere.",

  "Virtual DOM|Virtual Document Object Model":"Rappresentazione leggera e virtuale del DOM reale, utilizzata da librerie come React per ottimizzare l'aggiornamento delle interfacce utente.",

  "WSL|Windows Subsystem for Linux":"Funzionalità di Windows che consente di eseguire un ambiente Linux direttamente su Windows senza necessità di una macchina virtuale.",

  "Elemento domanda":"Elemento composto dalla coppia domanda testuale e risposta attesa associata testuale.",
)
#let glossario-therms = ()

#for (key, value) in glossario {
  if "|" in key{
    glossario-therms.push(key.split("|").join("\b|\b"))
  }
  else {
    glossario-therms.push(key)
  }
}
