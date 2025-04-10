#import "../../functions.typ": decisioni

== Discussione situazione codifica, test e deployment
Come punto iniziale, Luca si è occupato di esporre le modifiche recenti al codice, che hanno permesso di mostrare la lista dei risultati delle singole domande all'interno di un test, *ordinandole* e *colorandole* in base alla *valutazione* ottenuta, secondo quando richiesto dal proponente.

== Discussione Specifica Tecnica
In secondo luogo, si è discusso dell'attuale stato del documento Specifica Tecnica.
Dopo un momento di discussione, si è deciso di inserire un paragrafo contenente una tabella, che indichi il *soddisfacimento* dei *requisiti* funzionali richiesti dal proponente, associandoli i numeri delle sezioni contenenti le definizioni delle classi che li soddisfano.
#decisioni(
  [
    - Inserire un paragrafo contenente una tabella, che indichi il soddisfacimento dei requisiti funzionali richiesti dal proponente, associando i numeri delle sezioni contenenti le definizioni delle classi che li soddisfano.
  ],
  [
    - Distinguere meglio i requisiti soddisfatti e tracciati, associandoli alle singole classi/sezioni.
  ]
)

== Discussione Piano di Qualifica
Come terzo punto, si è discusso dell'attuale stato del Piano di Qualifica, in particolare della sezione dei *test*, di cui Annalisa ha presentato una prima bozza. Si è deciso di *suddividere* la stesura e la scrittura dei vari test tra i vari componenti del gruppo.
#decisioni(
  [
    - Suddividere la stesura e la scrittura dei vari test tra i vari componenti del gruppo in questo modo:
      - Luca: test di unità del componente frontend
      - Filippo: test di unità del componente backend
      - Annalisa: test di sistema
      - Michele e Luca: test di integrazione
      - Alberto: test di accettazione
  ],
  [
    - Velocizzare il processo di scrittura e revisione dei test, assegnando i vari test da scrivere, ai componenti che se ne sono presi carico anche in fase di codifica.
  ]
)

== Discussione Manuali
Come ultimo punto, si è discusso dell'attuale stato dei manuali di progetto, quali *Manuale Sviluppatore* e *Manuale Utente*. Anche in questo caso, si è deciso di *suddividere* la stesura e la scrittura delle sezioni rimanenti dei vari manuali tra alcuni componenti del gruppo.
#decisioni(
  [
    - Suddividere la stesura e la scrittura delle sezioni rimanenti dei vari manuali tra i seguenti componenti del gruppo in questo modo:
      - Michele:
        - Manuale Sviluppatore: inserimento immagini possibili estensioni
        - Manuale Utente: aggiornamento del glossario associato e delle immagini, scrittura della sezione di installazione
      - Luca: Manuale Utente: scrittura della sezione di installazione
  ],
  [
    - Velocizzare il processo di scrittura e revisione dei manuali, assegnando le varie sezioni da scrivere, ai componenti che se ne sono presi carico anche in fase di codifica.
  ]
)