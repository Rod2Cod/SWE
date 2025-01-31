Github Actions è una piattaforma proposta da Github per l'utilizzo di tecnologie quali *Continuous Integration* (CI) e *Continuous Delivery* (CD).
  Funziona tramite l'esecuzione uno o vari *workflows* che andranno ad avviarsi solo al verificarsi di determinate situazioni e/o *eventi*.

  Il tutto funziona tramite l'utilizzo di *file .yml* che permettono di operare tramite il processo di "*Infrastructure as code*".

== Composizione files Jekyll
  Qui di seguito viene proposta una scomposizione dei files utilizzati per la creazione e la successiva impostazione di una pagina web su *Github Pages* tramite il framework *Jekyll*, per andare ad analizzare la sua struttura in caso di eventuali modifiche. \
  I due files (*jekyll_gh-pages.yml* e *jekyll_gh-pages.yml*) sono indentici per la maggior parte del codice e si distinguono solo per il branch sul quale vanno a verificare l'evento. Di seguito la scomposizione:

  - ```yaml 
    name: Deploy Jekyll site to Pages
    ```
    Qui andiamo a dare un *nome* alla Action.
  
  - ```yaml 
    on:
      push:
        branches:
          - master
        paths:
          - 'Verbali/**'
          - 'Candidatura/**'
    ``` 
    per il ramo *master*, e
      ```yaml 
    on:
      push:
        branches:
          - gh-pages
      ```
    per il ramo *gh-pages*. \ \
    Questa è la parte che gestisce l'*evento* che attiverà la Action. \
    Qui stiamo ad indicare che la Action verrà attivata all'avvenire di un processo di *push* sul ramo *gh-pages* , o sul ramo *master* solo però se si vanno a modificare *specifiche cartelle/files*.
    
  - ```yaml 
    workflow_dispatch:
    ```
    Permettiamo al workflow di poter essere avviato anche *manualmente*.
  
  - ```yaml 
    permissions:
      contents: read
      pages: write
      id-token: write
    ``` 
    Questo permette di impostare i *permessi* per il Github *Token* che ci servirà per fare il deploy della pagina web in Github Pages.

  - ```yaml 
    concurrency:
      group: "pages"
      cancel-in-progress: false
    ```
    Questa parte consente solo *un'esecuzione* alla volta, in particolare sul ramo gh-pages, e *previene* la possibilità di *arrestare* un'esecuzione in corso.

  - ```yaml 
    jobs:
    ```
    Questo indica tutti i *processi* che la Action prevede vengano eseguiti.

  - ```yaml 
    build:
      runs-on: ubuntu-latest
  
      steps:
    ```
    Il primo processo che verrà avviato sarà quello di *build*, ovvero costruzione della pagina, o meglio di un *artifact* della pagina.
    Specifichiamo che vogliamo lavorare su una macchina *linux*, e *indichiamo* i vari *steps/sottoprocessi*:

  - ```yaml 
    - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
    ```
    Il primo step del lavoro di *build*, è quello di andare a recuperare e rendere disponibili alla Action il materiale su cui andare a lavorare. In questo caso, andiamo quindi a impostare un'operazione di *Checkout* sul ramo gh-pages(sottinteso in quanto la Action è situata là). Per fare ciò, utilizziamo un'altra *Action* già presente su Github, e indichiamo tra i parametri il fatto che vogliamo che si vadano a *recuperare tutti i files* presenti su quel ramo.
    
  - ```yaml 
    - name: Checkout pdf branch
        run: |
            git fetch origin master
            git checkout origin/master -- Verbali Candidatura
    ```
    Stessa cosa andiamo a fare per il ramo *master*, in quanto contiene i nostri files riguardanti la *documentazione*. Qui però, tramite un processo diverso, andiamo a recuperare solo *determinate cartelle*.
    
  - ```yaml 
    - name: Setup Ruby
      uses: ruby/setup-ruby@8575951200e472d5f2d95c625da0c7bec8217c42 # v1.161.0
      with:
        ruby-version: '3.3' # Not needed with a .ruby-version file
        bundler-cache: true # runs 'bundle install' and caches installed gems automatically
        cache-version: 0 # Increment this number if you need to re-download cached gems
    ```
    Questa parte definisce la *preparazione* dell'*ambiente* di creazione dell'*artifact* della pagina web. Qui andiamo ad *installare* *Ruby* ed i pacchetti da noi utilizzati, in particolare *Jekyll*.

  - ```yaml 
    - name: Setup Pages
        id: pages
        uses: actions/configure-pages@v5
    ```
    Qui andiamo a *prepare* l'*ambiente* per le *Github Pages* ed a *estrarre* vari *metadati* dalla pagina.

  - ```yaml 
    - name: Build with Jekyll
        run: bundle exec jekyll build --baseurl "${{ steps.pages.outputs.base_path }}"
        env:
          JEKYLL_ENV: development
    ```
    Con questo step, usiamo *Jekyll* con i nostri files, per andare a *costruire* l'*artifact* della pagina web all'interno della cartella _./\_site_. La variabile d'ambiente definita all'interno, ci permette di utilizzare *plugins* per metadati, in particolare quelli di Github.

  - ```yaml 
    - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
    ```
    Andiamo infine a *caricare* l'*artifact* del sito così creato, all'interno della nostra *repository*, in particolare nella cartella _./\_site_. \ \
    Con quest'ultima parte termina il processo di build.

  - ```yaml 
    deploy:
      environment:
        name: github-pages
        url: ${{ steps.deployment.outputs.page_url }}
      runs-on: ubuntu-latest
      needs: build
      steps:
    ```
    Iniziamo così il secondo processo, quello di *deploy*, che ci permetterà di *impostare* così l'artifact precedentemente caricato, come *pagina web* tramite Github Pages. \
    Specifichiamo nuovamente che vogliamo lavorare su una macchina *linux*. Andiamo poi a definire *variabili d'ambiente* utili agli *steps/sottoprocessi*, e imponiamo l'*esecuzione* di questo processo *solo* in caso il precedente, ossia quello di *build*, sia terminato con *successo*. \
    *Indichiamo* quindi i vari *steps/sottoprocessi*:

  - ```yaml 
    - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
    ```
    Andiamo a definire la *Action* già presente in Github che utilizzeremo per il *deploy* della *pagina web* su Github Pages.