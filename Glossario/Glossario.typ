#import "meta.typ": title, abstract, tabelle, author, keywords

#import "../functions.typ": printDict

// Funzioni da includere
#import "../functions.typ": table-json

//INFO DOCUMENTO, appaiono come descrizione del file
#set document(
  title: (title),
  author: (author),
  keywords: (keywords)
)
#set text(
  lang: "it"
)

#set list(indent: 1em)
#set enum(indent: 1em)
#show link: underline
  
//SET DELLA PAGINA AUTOMATIZZATO, guardare documentazione per ulteriori customizzazioni
#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod  #h(1fr) #h(1fr) #title],
)
#set heading(numbering: none)
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}

//TITOLO
#align(center, text(17pt)[*#title*])


#align(center)[
  //VERSIONE DOCUMENTO
  #table-json(json(tabelle).at("versione"),6)
  
  //ABSTRACT
  #set par(justify: true)
  *Abstract* \
  #abstract
]

//TABLE OF CONTENTS
#outline(indent: 1em)
#pagebreak()

#let glossario = (
  "AC|Actual Cost":"Metrica che misura i costi effettivi sostenuti fino a un determinato momento nel progetto.",
  "BAC|Budget at Completion":"Budget complessivo stimato per il completamento del progetto.",
  "BV|Budget Variance":"Metrica che misura la differenza percentuale di budget tra quanto previsto nella pianificazione di un periodo e il costo effettivo. Viene definita come: BV = EV - AC.",
  "CPI|Cost Performance Index":"Metrica che misura il rapporto tra il valore del lavoro effettivamente svolto ed il costo reale del lavoro fino al periodo di riferimento. Viene definita come: CPI = EV / AC.",
  "DOM|Document Object Model":"interfaccia di programmazione che rappresenta la struttura di un documento HTML o XML come una gerarchia di nodi.",
  "EV|Earned Value":"Valore del lavoro effettivamente svolto fino a quel periodo.",
  "EAC|Estimate at Completion": "metrica che misura il costo realizzativo stimato per terminare il progetto. Viene definita come: (BAC / CPI).",
  "ETC|Estimate to Complete":"Metrica che stima i costi realizzativi fino alla fine del progetto. Viene definita come: ETC = EAC - AC.",
  "GitHub":"Piattaforma online che consente agli sviluppatori di creare, salvare, gestire e condividere il proprio codice sorgente, facilitando la collaborazione e il controllo delle versioni.",
  "GH-Pages|GitHub Pages":"Sistema proposto da Github per l'impostazione di una pagina web relativa alla repository/organizzazione in questione.",
  "infrastructure as code":"Metodo di lavoro, riguardante l'infrastruttura IT, che utilizza file di configurazione scritti spesso in formato YAML o JSON, per definire e automatizzare la creazione, configurazione e gestione di risorse hardware e software.",
  "Jekyll":"Software utilizzabile e installabile tramite Ruby per la creazione e la modifica di pagine web con l'utilizzo di codice di tipo HTML, Markdown, Javascript e CSS.",
  "LLM|Large Language Model":"Modello linguistico preaddestrato su grandi quantità di dati, in grado di comprendere e generare testo in linguaggio naturale in ambito generale.",
  "LTS|Long Term Support":"versione software supportata a lungo termine con aggiornamenti di sicurezza e stabilità.",
  "NLP|Natural Language Processing":"Insieme di processi che permettono di estrarre informazioni dal testo al fine di facilitare l'elaborazione e/o la comprensione. Tali processi possono essere svolti tramite algoritmi o grazie a intelligenze artificiali specializzate.",
  "norma":"Documento o parte di esso che stabilisce specifiche di comportamento dei membri del gruppo oppure specifiche tecniche di entità, oggetti e concetti.",
  "npm|Node Package Manager":"Gestore di pacchetti per Node.js che consente agli sviluppatori di installare, condividere e gestire librerie JavaScript.",
  "ODG|Ordine del Giorno":"Elenco puntuale e strutturato dei temi e degli argomenti da affrontare durante una riunione. L’ODG serve come guida per il moderatore e i partecipanti, assicurando un confronto organizzato e il rispetto delle priorità stabilite, così da favorire il raggiungimento degli obiettivi dell’incontro.",
  "pgAdmin":"Strumento grafico per la gestione e l'interrogazione dei database PostgreSQL.",
  "PV|Planned Value":"Metrica che stima la somma dei costi realizzativi delle attività da svolgere periodo per periodo.",
  "Pip|Python Package Installer":"il gestore di pacchetti ufficiale per Python. Permette di installare, aggiornare e gestire pacchetti e librerie Python",
  "QMS|Quality Metrics Satisfied":"Metrica che misura la percentuale delle metriche di qualità rispettate dal prodotto.",
  "RAG|Retrieval Augmented Generation":"Processo/metodologia di ottimizzazione dell'output di un LLM, in modo che faccia riferimento a fonti di base esterne rispetto alle sue fonti di dati prima di generare una risposta.",
  "Repository|Repo":"Archivio digitale centralizzato che gli sviluppatori utilizzano per apportare e gestire le modifiche al codice sorgente o ad altre componenti di un'applicazione.",
  "Ruby":"Linguaggio di programmazione interpretato, dinamico e general-purpose, orientato agli oggetti.",
  "SV|Schedule Variance":"Metrica che indica in percentuale quanto si è in anticipo o in ritardo con le attività pianificate. Viene definita come: (EV - PV).",
  "SPA|Single Page Application":"Applicazione web che carica una singola pagina HTML e aggiorna dinamicamente il contenuto senza ricaricare l'intera pagina.",
  "SQL|Structured Query Language":"Linguaggio standard per la gestione e l'interrogazione di database relazionali.",
  "stemming":"Parte del NLP che consiste nell'estrarre la radice di un termine.",
  "task":"Compito specifico, procedura o sequenza di istruzioni da svolgere.",
  "UC|Use Case":"Un caso d’uso definisce uno scenario in cui ci sono interazioni con il sistema da parte di uno o più u attori.",
  "Virtual DOM|Virtual Document Object Model":"Rappresentazione leggera e virtuale del DOM reale, utilizzata da librerie come React per ottimizzare l'aggiornamento delle interfacce utente.",
  "WSL|Windows Subsystem for Linux":"Funzionalità di Windows che consente di eseguire un ambiente Linux direttamente su Windows senza necessità di una macchina virtuale.",
  "SOR|Satisfied Obligatory Requirements":"Percentuale dei requisiti obbligatori soddisfatti rispetto al totale definito.",
  "Elemento domanda":"Elemento composto dalla coppia domanda testuale e risposta associata testuale.",
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

#printDict(glossario)