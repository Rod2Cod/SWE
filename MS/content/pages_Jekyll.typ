*Gh-Pages* è un servizio offerto da github che permette di hostare un *sito statico* direttamente da Github. *Jekyll* è un framework consigliato da Github che permette di sviluppare molto velocemente un sito dinamico con un template preesistente per poi eventualmente modificarlo secondo le proprie esigenze.
  
== Rilasciare i documenti
  Per il rilascio dei documenti, data la presenza di Actions di Github che vanno a recuperare anche il materiale sul ramo "master" in fase di checkout, non è necessario caricarli nel branch "gh-pages" dedicato alle Github Pages, ma è sufficiente caricarli nel branch "master":
  + spostarsi nel branch *master*
  + caricare i *documenti* dentro le apposite *cartelle*
  
=== Aggiunta cartella documenti 
  + aprire il file "index.md"
  + andare ad aggiungere nel punto desiderato all'interno del file una sezione come quella in foto
    #image("pictures/index.md-verbali interni.png")
  + andare a modificare la sezione subito successiva a "contains" (in questo caso rappresentata da "Verbali/Interni") con le cartelle nella quale si trovano i file da mostrare
  + andare a modificare il codice Liquid secondo le esigenze \
    Esempio:
    La sezione `{% assign data = pdf.name | split: "Verbale" | last | split: "." | first | split: "-" %}` scomposta va a:
    - prendere *pdf.name* e *dividerlo* seguendo un marcatore ( | split: \"Verbale\" | con "Verbale" come marcatore)
    - prendere l'*ultima sezione* risultante ( | last | ) e *dividerla* seguendo un marcatore ( | split: \".\" | con "." come marcatore)
    - prendere la *prima sezione* risultante ( | first | ) e *dividerla* seguendo un marcatore ( | split: \"-\" | con "-" come marcatore)
    Per riferimenti più approfonditi: https://shopify.dev/docs/api/liquid.

#pagebreak()

== Github Pages
  Ci sono 2 modi in cui Github gestisce il rilascio delle Github Pages e si possono trovare sotto la sezione Settings >> Pages assieme al link del sito:
  + da un *branch* e *cartella* (ogni volta che la cartella nel branch viene modificata il sito viene aggiornato)
  + attraverso le *Github Actions* ( l'aggiornamento del sito viene gestito attraverso le actions)

== Jekyll
  Il framework *Jekyll* consente di applicare template ("themes") preesistenti o di propria creazione a dei file di markdown (.md o .markdown) che definiscono i contenuti delle pagine. \
  I template possono anche essere applicati ad altri template per unirli ed utilizzarli assieme.
  La documentazione si può trovare all'indirizzo: https://jekyllrb.com/docs/.
  
=== Info generali
  I template sono definiti in formato *HTML* e *Liquid*. Il secondo è un linguaggio che viene automaticamente compilato da Jekyll e permette di utilizzare costrutti propri della programmazione simili a markdown che poi andranno automaticamente convertiti e inseriti all'interno del file HTML. La documentazione la si può trovare a questo indirizzo: https://shopify.dev/docs/api/liquid.

=== File Markdown
  Ogni pagina Markdown ha un header("*front matter*") che inizia e finisce con "---" (tre trattini consecutivi) in cui, tramite *variabili*, si vanno ad assegnare alla pagina dei parametri come il *layout HTML* da utilizzare ed il *titolo*, ed eventualmente, anche valori ad altre variabili create all'interno del file HTML. \
  Al di sotto del tag "---" di fine invece, andrà messo tutto ciò che si vorrà inserire all'interno del tag "*{{ content }}*" presente nel file layout HTML.
  
=== Cartelle
  - *\_site*: vi sono presenti i file che genera jekyll dopo la compilazione, generalmente non ci si mette mano
  - *\_layouts*: vi sono i templates/layouts
  - *\_assets*: vi sono i file a cui si può accedere tramite le keyword liquid site.assets che identificano un array con tutti i file presenti che non hanno estensione .md o .html
  - *\_drafts*: vi sono le pagine bozze, non vengono visualizzate, servono solo per lo sviluppo
  - *\_post*: vi sono i post di un blog oppure le pagine più in generale che vengono create nel tempo in modo iterativo
  - *\_includes*: contiene file HTML o Markdown riutilizzabili in più pagine, in particolare utilizzato per file header o footer aggiuntivi
  - *\_data*: contiene file dati in formato YAML, JSON o CSV, utilizzabili per popolare contenuti strutturati
  - *\_sass*: conserva file SASS/SCSS per la gestione degli stili, utili per creare un CSS modulare
  
=== File di configurazione 
  - *\_config.yml*: file di configurazione principale di Jekyll, dove vengono definiti *parametri globali* del sito (come *titolo*, *URL*, permalinks, e impostazioni per i *plugin*).
  - *Gemfile*:  specifica le gems (pacchetti) di Ruby necessarie al progetto Jekyll, permettendo la gestione delle *dipendenze* tramite Bundler, come Jekyll stesso e altri plugin.
  
=== Installare Jekyll e Bundler e creare un nuovo sito
  Seguire le istruzioni riportate qui di seguito: https://jekyllrb.com/docs/#instructions
  
==== Lavorare su un sito già esistente
  + eseguire `git clone indirizzo_repo`
  + spostarsi nella cartella della repo
  + eseguire `bundle install`
  + fare le modifiche desiderate
  + eseguire `bundle exec jekyll serve`
  
=== Applicare un template esistente
  + scegliere un template da (https://jekyllrb.com/resources/) oppure cercare il template nel sito https://rubygems.org/ cercando jekyll-theme
  + nel Gemfile:
    + sostituire `gem \"minima\", \"~> 2.5\"` con quella indicata (generalmente) nel readme del template scelto
    + eseguire `bundle install`
    + andare a fare le modifiche desiderate
    + eseguire `bundle exec jekyll serve`
  + nel file \_config.yml:
    - eliminare o eventualmente sostituire `remote_theme: pages-themes/slate\@v0.2.0` con il codice indicato

  Fare attenzione che i templates nella cartella layouts abbiano lo stesso nome oppure modificarli in un secondo momento e aggiungere quelli mancanti, altrimenti tutte le pagine che li usano verranno nascoste dal sito.

=== Hostare il sito su github pages
  Attualmente l'hosting del sito è gestito automaticamente attraverso *Github Actions* che vanno ad automatizzare sia il *recupero* dei file *pdf* da inserire nel sito, sia il *caricamento* del *sito* su Github Pages dal branch gh-pages della repository.
 
=== Comandi utili 
 + `bundle exec jekyll serve` : *compila* il codice e va a creare un sito statico all'interno dell'*ambiente locale*
 + `bundle install` : *installa* i pacchetti necessari, utilizzato quando vi sono cambiamenti nelle configurazioni (templates, file config, Gemfile,...)

