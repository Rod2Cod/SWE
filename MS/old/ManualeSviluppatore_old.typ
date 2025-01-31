//INFO DOCUMENTO, appaiono come descrizione del file
#set document(
  title: [Manuale Sviluppatori],
  author: "Michele",
  keywords: ("guida", "tecnologie"),
  date: auto
)
#set text(
  lang: "it"
)

//DEFINIZIO TITOLO E DATA
#let title = [Manuale Sviluppatore]
#let date = datetime(
  day: 11,
  month: 11,
  year: 2024
)

//SET DELLA PAGINA AUTOMATIZZATO, guardare documentazione per ulteriori customizzazioni
#set page(paper: "a4",
  columns: 1,
  numbering: "1",
  header: [Gruppo 2 - Rod2Cod  #h(1fr) Data: #date.display() #h(1fr) #title],
)
#set heading(numbering: "1.1")
#show outline.entry.where(
  level: 1
): it => {
  v(1em, weak: true)
  strong(it)
}

// funzione per ottenere un elenco puntato con sottoargomenti numerati
#let hierarchical_numbering(..nums) = nums.pos().map(str).join(".")

//TITOLO
#align(center, text(17pt)[*#title*])

#align(center)[
  //VERSIONE DOCUMENTO
  #show table.cell.where(y: 0): strong
  #set table(
    fill: (x, y) =>
    if y == 0 {
      gray.lighten(50%)
    }
  )
  #table(
    align: center, 
    columns: 6, 
    table.header([Versione],[Data], [Sez. modificate], [Autore], [Verifica],[Approvazione]),
    [0.0.1], [11-11-2024],[], [Michele Nesler], [...], [...]
  )
  
  //ABSTRACT
  #set par(justify: true)
  *Abstract* \
  Il presente documento vuole essere una guida per aiutare i membri del gruppo nel primo approccio alle tecnologie utilizzate nel progetto e non appartenenti alle conoscenze di base di tutti i membri.
]

//TABLE OF CONTENTS
#outline(indent: 1em)
#pagebreak()


= Github Pages e Jekyll
  Github Pages è un servizio offerto da github che permette di hostare un sito statico direttamente da Github. Jekyll è un framework consigliato da Github che permette di sviluppare molto velocemente un sito dinamico con un template preesistente per poi eventualmente modificarlo secondo le proprie esigenze.
  
== Rilasciare i documenti
  Dopo il setup iniziale per rilasciare i documenti basta:
  + spostarsi nel branch gh-pages "git checkout gh-pages"
  + mettere il documento nella apposita cartella dentro alla cartella documentazione
  
=== Aggiungere una cartella documenti 
  + dentro la cartella "documentazione" aggiungere la cartella desiderata 
  + aprire il file "index.html" nella cartella "\_layouts" 
  + aggiungere questo pezzo di codice modificando il testo h2 e il percorso della cartella \"documentazione/verbali_interni\": 
  #image("aggiungere_una_cartella_documenti.png")
  in questo caso  | replace 'Verbale', ' ' | sostituisce nel testo del link cul sito la parola Verbale presente nel nome del file con uno spazio.

== Github Pages
  Ci sono 2 modi in cui github gestisce il sito hostato, si possono trovare sotto Settings>Pages insieme al link del sito:
  + Da un Branch e cartella (ogni volta che la cartella nel branch viene modificata il sito viene aggiornato)
  + Attraverso le github actions ( l'aggiornamento del sito viene gestito attraverso le actions)

== Jekyll
  Il framework consente di applicare template (chiamati temi) preesistenti o di propria creazione a dei file di markdown (.md o .markdown) che definiscono i contenuti delle pagine. I template possono anche essere applicati ad altri template per innestarli uno nell'altro.
  
=== info generali
  I template sono definiti il HTML + liquid. Il secondo viene compilato da Jekyll e permette di utilizzare costrutti propri della programmazione nell Html. La documentazione si trova qua https://shopify.dev/docs/api/liquid

  Ogni pagina (e template) ha un header che inizia e finisce con "---" in cui le si assegna un template e si da un valore ad ogni variabile utilizzata nel template, se questi non sono specificati assumono valori di default se presenti.
  
=== Cartelle
  - \_site: vi sono presenti i file che genera jekyll dopo la compilazione, generalmente non ci si mette mano
  - \_layouts: vi sono i template.
  - \_assets: vi sono i file a cui si può accedere tramite le keyword liquid site.assets che identificano un array con tutti i file presenti che non hanno estensione .md o .html
  - \_drafts: vi sono le pagine bozze, non vengono visualizzate, servono solo per lo sviluppo
  - \_post: vi sono i post di un blog oppure le pagine più in generale che vengono create nel tempo in modo iterativo.
  - \_includes: contiene file HTML o Markdown riutilizzabili in più pagine, come header o footer.
  - \_data: contiene file dati in formato YAML, JSON o CSV, utilizzabili per popolare contenuti strutturati.
  - \_sass: conserva file SASS/SCSS per la gestione degli stili, utili per creare un CSS modulare.
  
=== File di configurazione 
  - \_config.yml: file di configurazione principale di Jekyll, dove vengono definiti parametri globali del sito (come titolo, URL, permalinks, e impostazioni per i plugin).
  - Gemfile:  specifica le gemme Ruby necessarie al progetto Jekyll, permettendo la gestione delle dipendenze tramite Bundler, come Jekyll stesso e altri plugin.
  
=== Come installare Jekyll in locale
  + scaricare e installare Ruby (con devkit se windows) da qua https://www.ruby-lang.org/it/documentation/installation/
  + da terminale: esegui "gem install jekyll bundler"
  
==== Creare un nuovo sito
  Dopo aver installato Jekyll:
  + nella cartella della repo eseguire il comando "jekyll new nome_sito"
  + spostarsi dentro la cartella "nome_sito"
  + eseguire "bundle exec jekyll serve"
  
==== Lavorare su un sito gia esistente
  + eseguire "gem install jekyll bundler"
  + eseguire "git clone indirizzo_repo"
  + spostarsi nella cartella della repo
  + eseguire "bundle install"
  + fare le modifiche desiderate 
  + eseguire "bundle exec jekyll serve"
  
=== Applicare un template esistente
  + cercare il template nel sito https://rubygems.org/ cercando jekyll-theme
  + nel Gemfile:
    + sostituire "gem  \"minima\", \"~> 2.5\"" con quella indicata (generalmente) nel readme del temeplate scelto
    + eseguire "bundle install"
    + eseguire "bundle exec jekyll serve"
  + nel file \_config.yml eliminare o sostituire "remote_theme: pages-themes/slate\@v0.2.0"

  Fare attenzione che i temeplates nella cartella layouts abbiano lo stesso nome oppure modificarli in un secondo momento e aggiungere quelli mancanti, altrimenti tutte le pagine che li usano verranno nascoste dal sito.

=== Hostare il sito su github pages
 + nel gemfile: sostituire "gem \"jekyll\", \"~> 4.3.4\"" con "gem \"github-pages\", group: :jekyll_plugins"
 + nel \_config.yml file: sostituire "baseurl:\"\"" con "baseurl:\"/nome_sito\""
 + su github: in un repo PUBBLICO settings>>Pages>>publish from a branch e impostare il branch gh-pages per hostarlo da un branch
 + in git: eliminare la cartella \_site nel gitignore, creare un branch nominato gh-pages "git checkout -b gh-pages"aggiungere i file del sito nella cartella "git add ." , "git commit -m \"messaggio commit\" e "git push".
 
=== comandi utili 
 + bundle exec jekyll serve : compila il codice e crea il sito html statico
 + bundle istall : installa i pacchetti necessari, serve quando si cambia template


