#import "../../functions.typ": table-json-ST


== Diagrammi delle classi
=== Backend
==== Domain Model
===== Elemento Domanda
  #align(center)[
      #image("../pictures/uml/ElementoDomanda.png", height: 18%)
    ]

I componenti principali del dominio di elemento domanda sono:

====== Domanda
  - *Attributi*
    - `testo`: stringa che rappresenta testo della domanda

  - *Metodi*
    - `getText()`: restituisce il testo della domanda
    - `setText(text: string)`: imposta il testo della domanda

====== Risposta
  - *Attributi*
    - `testo`: stringa che rappresenta testo della risposta

  - *Metodi*
    - `getText(): str`
      - *Descrizione*:
        - restituisce il testo della risposta
      - *Input*:
        - nessuno
      - *Output*:
        - stringa che rappresenta il testo della risposta
    - `setText(text: str)`
      - *Descrizione*:
        - imposta il testo della risposta
      - *Input*:
        - `text`: stringa che rappresenta il testo della risposta
      - *Output*:
        - nessuno

====== ElementoDomanda
  - *Attributi*
    - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
    - `domanda`: oggetto di tipo `Domanda` che rappresenta la domanda
    - `risposta`: oggetto di tipo `Risposta` che rappresenta la risposta

  - *Metodi*
    - `getId(): int`
      - *Descrizione*:
        - restituisce l'identificativo univoco dell'elemento domanda
      - *Input*:
        - nessuno
      - *Output*:
        - intero che rappresenta l'identificativo univoco dell'elemento domanda
    - `getDomanda(): Domanda`
      - *Descrizione*:
        - restituisce l'oggetto `Domanda` associato all'elemento domanda
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `Domanda` che rappresenta la domanda
    - `getRisposta(): Risposta`
      - *Descrizione*:
        - restituisce l'oggetto `Risposta` associato all'elemento domanda
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `Risposta` che rappresenta la risposta
    - `setDomanda(domanda: str)`
      - *Descrizione*:
        - imposta il testo della domanda
      - *Input*:
        - `domanda`: stringa che rappresenta il testo della domanda
      - *Output*:
        - nessuno
    - `setRisposta(risposta: str)`
      - *Descrizione*:
        - imposta il testo della risposta
      - *Input*:
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - nessuno
    - `serialize(): dict`
      - *Descrizione*:
        - restituisce un `dict` con i dati dell'elemento domanda
      - *Input*:
        - nessuno
      - *Output*:
        - `dict` con i dati dell'elemento domanda

===== Risultato Test
#align(center)[
      #image("../pictures/uml/RisultatoTest.png", height: 20%)
    ]
Il componente principale del dominio di risultato test è:

====== RisultatoSingolaDomanda
  - *Attributi*
    - `id`: intero che rappresenta l'identificativo univoco del risultato della domanda
    - `domanda`: string che rappresenta la domanda
    - `risposta`: stringa che rappresenta la risposta attesa
    - `rispostaLLM`: stringa che rappresenta la risposta fornita dall'LLM
    - `score`: float che rappresenta il punteggio di similitudine tra la risposta attesa e la risposta fornita dall'LLM
    - `metriche`: dizionario contenente le metriche di valutazione della risposta

  - *Metodi*
    - `getId(): int`
      - *Descrizione*:
        - restituisce l'identificativo univoco del risultato della domanda
      - *Input*:
        - nessuno
      - *Output*:
        - intero che rappresenta l'identificativo univoco del risultato della domanda
    - `getDomanda(): str`
      - *Descrizione*:
        - restituisce una stringa contenente la domanda posta all'LLM
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta la domanda
    - `getRisposta(): str`
      - *Descrizione*:
        - restituisce una stringa contenente la risposta attesa
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta la risposta
    - `getRispostaLLM(): str`
      - *Descrizione*:
        - restituisce una stringa contenente la risposta fornita dall'LLM
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta la risposta fornita dall'LLM
    - `getScore(): float`
      - *Descrizione*:
        - restituisce un float contenente il punteggio di similitudine tra la risposta attesa e la risposta fornita dall'LLM
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `float` che rappresenta il punteggio di similitudine tra la risposta attesa e la risposta fornita dall'LLM
    - `getMetriche(): dict`
      - *Descrizione*:
        - restituisce un dizionario contenente le metriche di valutazione della risposta con il relativo punteggio
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` contente le metriche di valutazione della risposta e il relativo punteggio
    - `serialize(): dict`
      - *Descrizione*:
        - restituisce un `dict` con tutti i dati del risultato della domanda
      - *Input*:
        - nessuno
      - *Output*:
        - `dict` con i dati del risultato della domanda
    - `serializeForList(): dict`
      - *Descrizione*:
        - restituisce un `dict` con i dati principali del risultato della domanda, senza le metriche
      - *Input*:
        - nessuno
      - *Output*:
        - `dict` con i dati del risultato della domanda, senza le metriche

====== RisultatoTest
  - *Attributi*
    - `id`: intero che rappresenta l'identificativo univoco del risultato del test
    - `score`: float che rappresenta il punteggio medio del test
    - `LLM`: stringa che rappresenta il nome dell'LLM utilizzato
    - `dataEsecuzione`: oggetto di tipo `datetime` che rappresenta la data di esecuzione del test
    - `nomeSet`: stringa che rappresenta il nome del set di domande utilizzato
    - `risulatiDomande`: set di oggetti di tipo `RisultatoSingolaDomanda` che rappresentano i risultati delle domande del test

  - *Metodi*
    - `getId(): int`
      - *Descrizione*:
        - restituisce l'identificativo univoco del risultato del test
      - *Input*:
        - nessuno
      - *Output*:
        - intero che rappresenta l'identificativo univoco del risultato del test
    - `getScore(): float`
      - *Descrizione*:
        - restituisce il punteggio medio del test
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `float` che rappresenta il punteggio medio del test
    - `getLLM(): str`
      - *Descrizione*:
        - restituisce il nome dell'LLM testato
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta il nome dell'LLM testato
    - `getDataEsecuzione(): datetime`
      - *Descrizione*:
        - restituisce la data di esecuzione del test
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `datetime` che rappresenta la data di esecuzione del test
    - `getNomeSet(): str`
      - *Descrizione*:
        - restituisce il nome del set di domande utilizzato
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta il nome del set di domande utilizzato
    - `getRisultatiDomande(): set[RisultatoSingolaDomanda]`
      - *Descrizione*:
        - restituisce un set di oggetti di tipo `RisultatoSingolaDomanda` che rappresentano i risultati delle domande del test
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `set[RisultatoSingolaDomanda]` che rappresenta i risultati delle domande del test
    - `serialize(): dict`
      - *Descrizione*:
        - restituisce un `dict` con tutti i dati del risultato del test
      - *Input*:
        - nessuno
      - *Output*:
        - `dict` con i tutti i dati del risultato del test
    - `serializeForList(): dict`
      - *Descrizione*:
        - restituisce un `dict` con i dati principali del risultato del test, senza i risultati delle domande
      - *Input*:
        - nessuno
      - *Output*:
        - `dict` con i dati principali del risultato del test, senza i risultati delle domande

==== Application
===== Elemento Domanda
Le dipendenze dei servizi di elemento domanda sono:
  - *ElementoDomanda*: rappresenta il dominio di elemento domanda
  - *ElementoDomandaUseCase*: rappresentano i casi d'uso implementati dai servizi
  - *ElementiDomandaPorts*: rappresentano le porte utilizzate dai servizi

====== AddService
#align(center)[
      #image("../pictures/uml/AddService.png", height: 5%)
    ]

======= AddElementoDomandaService
  - *Attributi*
    - `port`: porta utilizzata per salvare l'elemento domanda

  - *Metodi*
    - `addElementoDomanda(domanda: str, risposta: str): ElementoDomanda`
      - *Descrizione*:
        - aggiunge un elemento domanda a partire da domanda e risposta
      - *Input*:
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena creato
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione della domanda o della risposta

======= AddElementoDomandaUseCase
  - *Metodi*
      - `addElementoDomanda(domanda: str, risposta: str): ElementoDomanda`
        - *Descrizione*:
          - aggiunge un elemento domanda a partire da domanda e risposta
        - *Input*:
          - `domanda`: stringa che rappresenta il testo della domanda
          - `risposta`: stringa che rappresenta il testo della risposta
        - *Output*:
          - oggetto di tipo `ElementoDomanda`

======= SaveElementoDomandaPort
  - *Metodi*
    - `saveElementoDomanda(elementoDomanda: ElementoDomanda): ElementoDomanda`
      - *Descrizione*:
        - salva un elemento domanda nel database
      - *Input*:
        - `elementoDomanda`: oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda da salvare
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena salvato nel database

====== GetService
#align(center)[
      #image("../pictures/uml/GetService.png", height: 6%)
    ]

======= GetElementoDomandaService
  - *Attributi*
    - `port`: porta utilizzata per ottenere l'elemento domanda

  - *Metodi*
    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena ottenuto
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione dell'id

======= GetElementoDomandaUseCase
  - *Metodi*
    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda`

======= GetElementoDomandaPort
  - *Metodi*
    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda dal database, a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena ottenuto dal database

====== GetAllService
#align(center)[
      #image("../pictures/uml/GetAllService.png", height: 7%)
    ]

======= GetAllElementiDomandaService
  - *Attributi*
    - `port`: porta utilizzata per ottenere tutti gli elementi domanda

  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appena ottenuti

======= GetAllElementiDomandaUseCase
  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda`ù

======= GetAllElementiDomandaPort
  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti nel database
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appena ottenuti dal database

====== DeleteService
#align(center)[
      #image("../pictures/uml/DeleteService.png", height: 7%)
    ]

======= DeleteElementiDomandaService
  - *Attributi*
    - `port`: porta utilizzata per eliminare gli elementi domanda

  - *Metodi*
    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina gli elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione degli id

======= DeleteElementiDomandaUseCase
  - *Metodi*
    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina gli elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione

======= DeleteElementiDomandaPort
  - *Metodi*
    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina gli elementi domanda nel datbase, a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione nel database

====== UpdateService
#align(center)[
      #image("../pictures/uml/UpdateService.png", height: 5.5%)
    ]

======= UpdateElementoDomandaService
  - *Attributi*
    - `port`: porta utilizzata per aggiornare gli elementi domanda

  - *Metodi*
    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione dell'id, della domanda o della risposta

======= UpdateElementoDomandaUseCase
  - *Metodi*
    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento

======= UpdateElementoDomandaPort
  - *Metodi*
    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda nel database, a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento nel database

===== Esecuzione Test
Le dipendenze dei servizi di esecuzione test sono:
  - *ExecuteTestUseCase*: rappresentano i casi d'uso per eseguire il test
  - *GetTestStatusUseCase*: rappresenta il caso d'uso per ottenere lo stato del test
  - *LLMPort*: rappresenta la porta per comunicare con l'LLM
  - *SaveRisultatoTestPort*: rappresenta la porta per salvare il risultato del test
  - *GetAllElementiDomandaPort*: rappresenta la porta per ottenere tutti gli elementi domanda presenti nel sistema
  - *AlgoritmoValutazioneRisposte*: rappresenta la classe responsabile della valutazione delle risposte
  - *TestStatusTracker*: rappresenta la classe responsabile del tracciamento dello stato del test
  - *RisultatoTest*: rappresenta il dominio di risultato test
  - *RisultatoSingolaDomanda*: rappresenta il dominio di risultato per singola domanda

====== ExecuteService
#align(center)[
      #image("../pictures/uml/ExecuteService.png", height: 23%)
    ]

======= ExecuteTestService
  - *Attributi*
    - `status_tracker`: oggetto responsabile del tracciamento dello stato del test
    - `llm`: porta utilizzata per comunicare con l'LLM
    - `valutatore`: oggetto responsabile della valutazione delle risposte
    - `saveTestPort`: porta utilizzata per salvare il risultato del test
    - `getElementiDomandaPort`: porta utilizzata per ottenere gli elementi domanda da testare
  - *Metodi*
    - `executeTest(): None`
        - *Descrizione*:
          - esegue il test a partire da tutti gli elementi domanda presenti nel sistema, utilizzando l'LLM per ottenere le risposte da confrontare. Si occupa anche di valutare le risposte ottenute e di salvare il risultato del test
        - *Input*:
          - nessuno
        - *Output*:
          - nessuno

======= ExecuteTestUseCase
  - *Metodi*
    - `executeTest(): None`
      - *Descrizione*:
        - esegue il test e si occupa del salvataggio del risultato
      - *Input*:
        - nessuno
      - *Output*:
        - nessuno

======= LLMPort
  - *Metodi*
    - `makeQuestion(domanda: str): str`
      - *Descrizione*:
        - ritorna la risposta fornita dall'LLM a partire dalla domanda
      - *Input*:
        - `domanda`: stringa che rappresenta la domanda da porre all'LLM
      - *Output*:
        - oggetto di tipo `str` che rappresenta la risposta fornita dall'LLM
    - `getName(): str`
      - *Descrizione*:
        - ritorna il nome dell'LLM in uso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `str` che rappresenta il nome dell'LLM in uso

======= AlgoritmoValutazioneRisposte
  - *Metodi*
    - `evaluate(risposta_attesa: str, risposta_llm: str): tuple[dict[str, float], float]`
      - *Descrizione*:
        - valuta la risposta fornita dall'LLM rispetto alla risposta attesa e ritorna le metriche di valutazione e il punteggio di similitudine
      - *Input*:
        - `risposta_attesa`: stringa che rappresenta la risposta attesa
        - `risposta_llm`: stringa che rappresenta la risposta fornita dall'LLM
      - *Output*:
        - oggetto di tipo `tuple` contenente un dizionario con le metriche di valutazione e un float con il punteggio di similitudine

======= SaveRisultatoTestPort
  - *Metodi*
    - `saveRisultatoTest(risultato: RisultatoTest): RisultatoTest`
      - *Descrizione*:
        - salva il risultato del test nel database
      - *Input*:
        - `risultato`: oggetto di tipo `RisultatoTest` che rappresenta il risultato del test da salvare
      - *Output*:
        - oggetto di tipo `RisultatoTest` che rappresenta il risultato del test appena salvato nel database

======= GetAllElementiDomandaPort
  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti nel sistema
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appena ottenuti


======= GetTestStatusService
  - *Attributi*
    - `status_tracker`: oggetto responsabile del tracciamento dello stato del test
  - *Metodi*
    - `getTestStatus(): dict`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` che rappresenta lo stato del test in corso

======= GetTestStatusUseCase
  - *Metodi*
    - `getTestStatus(): dict`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` che rappresenta lo stato del test in corso

===== Risultato Test
Le dipendenze del servizio di risultato test sono:
  - *GetRisultatoTestPort*: rappresenta la porta per ottenere il risultato del test
  - *GetAllRisultatiTestPort*: rappresenta la porta per ottenere tutti i risultati del test
  - *GetRisultatoSingolaDomandaPort*: rappresenta la porta per ottenere il risultato di una singola domanda
  - *GetRisultatoTestUseCase*: rappresenta il caso d'uso per ottenere il risultato del test
  - *GetAllRisultatiTestUseCase*: rappresenta il caso d'uso per ottenere tutti i risultati del test
  - *GetRisultatoSingolaDomandaUseCase*: rappresenta il caso d'uso per ottenere il risultato di una singola domanda
  - *RisultatoTest*: rappresenta il dominio di risultato test
  - *RisultatoSingolaDomanda*: rappresenta il dominio di risultato per singola domanda
====== GetRisultatoTest
#align(center)[
      #image("../pictures/uml/GetRisultatoTest.png", height: 8%)
    ]
======= GetRisultatoTestService

  - *Attributi*
    - `port`: porta utilizzata per ottenere il risultato del test
  - *Metodi*
    - `getRisultatoTest(id: int): RisultatoTest`
      - *Descrizione*:
        - ritorna il risultato del test con l'id specificato
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato del test
      - *Output*:
        - oggetto di tipo `RisultatoTest` che rappresenta il risultato del test appena ottenuto
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione dell'id

======= GetRisultatoTestUseCase
  - *Metodi*
    - `getRisultatoTest(id: int): RisultatoTest`
      - *Descrizione*:
        - ritorna il risultato del test con l'id specificato
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato del test
      - *Output*:
        - oggetto di tipo `RisultatoTest` che rappresenta il risultato del test appena ottenuto

======= GetRisultatoTestPort
  - *Metodi*
    - `getRisultatoTest(id: int): RisultatoTest`
      - *Descrizione*:
        - ritorna il risultato del test con l'id specificato
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato del test
      - *Output*:
        - oggetto di tipo `RisultatoTest` che rappresenta il risultato del test con l'id specificato
====== GetAllRisultatiTest
#align(center)[
      #image("../pictures/uml/GetAllRisultatiTest.png", height: 8%)
    ]
======= GetAllRisultatiTestService
  - *Attributi*
    - `port`: porta utilizzata per ottenere tutti i risultati del test
  - *Metodi*
    - `getAllRisultatiTest(): set[RisultatoTest]`
      - *Descrizione*:
        - ritorna un set di tutti i risultati del test
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `RisultatoTest` che rappresentano i risultati del test appena ottenuti

======= GetAllRisultatiTestUseCase
  - *Metodi*
    - `getAllRisultatiTest(): set[RisultatoTest]`
      - *Descrizione*:
        - ritorna un set di tutti i risultati del test
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `RisultatoTest` che rappresentano i risultati del test appena ottenuti

======= GetAllRisultatiTestPort
  - *Metodi*
    - `getAllRisultatiTest(): set[RisultatoTest]`
      - *Descrizione*:
        - ritorna un set di tutti i risultati del test presenti nel sistema
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `RisultatoTest` che rappresentano tutti i risultati di test presenti nel sistema
====== GetRisultatoSingolaDomanda
#align(center)[
      #image("../pictures/uml/GetRisultatoSingolaDomanda.png", height: 4.8%)
    ]
======= GetRisultatoSingolaDomandaService
  - *Attributi*
    - `port`: porta utilizzata per ottenere il risultato di una specifica domanda di un test
  - *Metodi*
    - `getRisultatoSingolaDomandaTestById(id: int): RisultatoSingolaDomanda`
      - *Descrizione*:
        - ritorna il risultato di una specifica domanda di un test a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato della domanda di uno specifico test
      - *Output*:
        - oggetto di tipo `RisultatoSingolaDomanda` che rappresenta il risultato della domanda appena ottenuto
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui ci siano problemi di validazione dell'id

======= GetRisultatoSingolaDomandaUseCase
  - *Metodi*
    - `getRisultatoSingolaDomandaTestById(id: int): RisultatoSingolaDomanda`
      - *Descrizione*:
        - ritorna il risultato di una specifica domanda di un test a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato della domanda di uno specifico test
      - *Output*:
        - oggetto di tipo `RisultatoSingolaDomanda` che rappresenta il risultato della domanda appena ottenuto

======= GetRisultatoSingolaDomandaPort
  - *Metodi*
    - `getRisultatoSingolaDomandaTestById(id: int): RisultatoSingolaDomanda`
      - *Descrizione*:
        - ritorna il risultato di una specifica domanda di un test a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato della domanda di uno specifico test
      - *Output*:
        - oggetto di tipo `RisultatoSingolaDomanda` che rappresenta il risultato della domanda appena ottenuto

===== Evaluation
Le dipendenze dei servizi di valutazione sono:
  - *AlgoritmoValutazioneRisposte*: rappresenta l'algoritmo di valutazione delle risposte
  - *TestStatusTracker*: rappresenta il tracciamento dello stato del test

====== AlgoritmoValutazioneRisposteImpl
  - *Attributi*
    - `scorer`: classe che si occupa di calcolcare i punteggi parziali di valutazione
    - `model`: classe che si occupa di calcolare i punteggi di similitudine a partire dai punteggi parziali
  - *Metodi*
    - `evaluate(risposta_attesa: str, risposta_llm: str): tuple[dict[str, float], float]`
      - *Descrizione*:
        - valuta la risposta fornita dall'LLM rispetto alla risposta attesa e ritorna le metriche di valutazione e il punteggio di similitudine
      - *Input*:
        - `risposta_attesa`: stringa che rappresenta la risposta attesa
        - `risposta_llm`: stringa che rappresenta la risposta fornita dall'LLM
      - *Output*:
        - oggetto di tipo `tuple` contenente un dizionario con le metriche di valutazione e un float con il punteggio di similitudine
    - `transformInput(data: dict): DataFrame`
      - *Descrizione*:
        - trasforma i dati di input in un formato compatibile con il modello di valutazione
      - *Input*:
        - `data`: dizionario contenente i dati di input
      - *Output*:
        - oggetto di tipo `DataFrame` contenente i dati trasformati

====== Scorer
  - *Attributi*
    - `bertScorer`: oggetto di tipo `BertScorer` che si occupa di calcolare lo score Bert
    - `crossEncoder`: oggetto di tipo `CrossEncoder` che si occupa di calcolare lo score CrossEncoder
    - `rougeScorer`: oggetto di tipo `RougeScorer` che si occupa di calcolare lo score Rouge
  - *Metodi*
    - `lexical_score(ipotesi: str, riferimento: str): (float,float,float)`
      - *Descrizione*:
        - calcola i punteggi Bleu, Ter e Chrf a partire da un'ipotesi e un riferimento
      - *Input*:
        - `ipotesi`: stringa che rappresenta l'ipotesi
        - `riferimento`: stringa che rappresenta il riferimento
      - *Output*:
        - oggetto di tipo `tuple` contenente i punteggi Bleu, Ter e Chrf
    - `ROUGE_score(ipotesi: str, riferimento: str): float`
      - *Descrizione*:
        - calcola il punteggio Rouge a partire da un'ipotesi e un riferimento
      - *Input*:
        - `ipotesi`: stringa che rappresenta l'ipotesi
        - `riferimento`: stringa che rappresenta il riferimento
      - *Output*:
        - valore dello score Rouge in float
    - `BERT_score(ipotesi: str, riferimento: str): float`
      - *Descrizione*:
        - calcola il punteggio Bert a partire da un'ipotesi e un riferimento
      - *Input*:
        - `ipotesi`: stringa che rappresenta l'ipotesi
        - `riferimento`: stringa che rappresenta il riferimento
      - *Output*:
        - valore dello score Bert in float
    - `score(ipotesi: str, riferimento: str): dict[str, float]`
      - *Descrizione*:
        - calcola i punteggi di valutazione a partire da un'ipotesi e un riferimento
      - *Input*:
        - `ipotesi`: stringa che rappresenta l'ipotesi
        - `riferimento`: stringa che rappresenta il riferimento
      - *Output*:
        - oggetto di tipo `dict` contenente i le metriche utilizzate e i relativi punteggi di valutazione

====== TestStatusTrackerImpl
  - *Attributi*
    - `in_progress`: booleano che rappresenta se il test è in corso o meno
    - `total_questions`: intero che rappresenta il numero totale di domande del test
    - `questions_completed`: intero che rappresenta il numero della domanda completate
    - `id_risultato`: intero che rappresenta l'id del risultato del test
    - `error`: Exception che rappresenta l'eventuale eccezione sollevata durante l'esecuzione del test
  - *Metodi*
    - `start_test(total_questions: int): None`
      - *Descrizione*:
        - inizializza il tracciamento dello stato del test
      - *Input*:
        - `total_questions`: intero che rappresenta il numero totale di domande del test
      - *Output*:
        - nessuno
    - `update_progress()`: None
      - *Descrizione*:
        - aggiorna lo stato del test in corso facendo avanzare il numero delle domande completate
      - *Input*:
        - nessuno
      - *Output*:
        - nessuno
    - `set_id_risultato(id_risultato: int): None`
      - *Descrizione*:
        - setta l'id del risultato del test
      - *Input*:
        - `id_risultato`: intero che rappresenta l'id del risultato del test
      - *Output*:
        - nessuno
    - `finish_test(): None`
      - *Descrizione*:
        - termina il tracciamento dello stato del test impostando in_progress a False
      - *Input*:
        - nessuno
      - *Output*:
        - nessuno
    - `set_error(error: Exception): None`
      - *Descrizione*:
        - setta l'eventuale eccezione sollevata durante l'esecuzione del test
      - *Input*:
        - `error`: eccezione sollevata durante l'esecuzione del test
      - *Output*:
        - nessuno
    - `get_status(): dict`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` che rappresenta lo stato del test in corso

==== Input Adapters (REST Controllers)
===== Elemento Domanda
Le dipendenze dei REST controllers di elemento domanda sono:
  - *ElementoDomandaUseCase*: rappresentano i casi d'uso implementati dai
  servizi
  - *Containers*: rappresentano le classi che gestiscono le dependency injection
  - *Inject* e *Provide*: rappresentano le funzioni per l'iniezione delle dipendenze
  - *BadRequest* e *UnsupportedMediaType*: rappresentano alcune eccezioni catturate

====== AddController
#align(center)[
      #image("../pictures/uml/AddController.png", height: 7%)
    ]

======= AddElementoDomandaController
    - *Attributi*
      - `useCase`: caso d'uso per aggiungere un elemento domanda, iniettato tramite dependency injection

    - *Metodi*
      - `post(): Response`
        - *Descrizione*:
          - aggiunge un elemento domanda a partire da domanda e risposta e lo ritorna all'interno della risposta
        - *Input*:
          - `domanda` e `risposta` tramite body json
        - *Output*:
          - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno l'elemento domanda appena creato
          - messaggio di errore in caso di:
            - problemi di validazione della domanda o della risposta
            - errore interno del server
            - mancanza di domanda o risposta nel body json
          
======= AddElementoDomandaUseCase
  - *Metodi*
      - `addElementoDomanda(domanda: str, risposta: str): ElementoDomanda`
        - *Descrizione*:
          - Aggiunge un elemento domanda a partire da domanda e risposta e lo ritorna
        - *Input*:
          - `domanda`: stringa che rappresenta il testo della domanda
          - `risposta`: stringa che rappresenta il testo della risposta
        - *Output*:
          - oggetto di tipo `ElementoDomanda`

====== GetController
#align(center)[
      #image("../pictures/uml/GetController.png", height:8%)
    ]

======= GetElementoDomandaController
    - *Attributi*
      - `useCase`: caso d'uso per ottenere un elemento domanda, iniettato tramite dependency injection

    - *Metodi*
      - `get(id: int): Response`
        - *Descrizione*:
          - ritorna una risposta contenente un elemento domanda, a partire dal suo id
        - *Input*:
          - `id` tramite url param
        - *Output*:
          - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno l'elemento domanda appena ottenuto
          - messaggio di errore in caso di:
            - problemi di validazione dell'id
            - errore interno del server

======= GetElementoDomandaUseCase
  - *Metodi*
    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda`

====== GetAllController
#align(center)[
      #image("../pictures/uml/GetAllController.png", height: 9%)
    ]


======= GetAllElementiDomandaController
    - *Attributi*
      - `useCase`: caso d'uso per ottenere tutti gli elementi domanda, iniettato tramite dependency injection

    - *Metodi*
      - `get(): Response`
        - *Descrizione*:
          - ritorna una risposta contenente un set di tutti gli elementi domanda presenti
        - *Input*:
          - nessuno
        - *Output*:
          - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il set di elementi domanda appena ottenuti
          - messaggio di errore in caso di:
            - errore interno del server

======= GetAllElementiDomandaUseCase
  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda`

====== DeleteController
#align(center)[
      #image("../pictures/uml/DeleteController.png", height: 9%)
    ]

======= DeleteElementiDomandaController
    - *Attributi*
      - `useCase`: caso d'uso per eliminare gli elementi domanda, iniettato tramite dependency injection

    - *Metodi*
      - `delete(): Response`
        - *Descrizione*:
          - elimina uno o più elementi domanda a partire da un set di id
        - *Input*:
          - `ids` tramite body json
        - *Output*:
          - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il risultato dell'operazione di eliminazione
          - messaggio di errore in caso di:
            - problemi di validazione degli id
            - errore interno del server
            - mancanza di ids nel body json

======= DeleteElementiDomandaUseCase
  - *Metodi*
    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina uno o più elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione

====== UpdateController
#align(center)[
      #image("../pictures/uml/UpdateController.png", height: 7%)
    ]

======= UpdateElementoDomandaController
    - *Attributi*
      - `useCase`: caso d'uso per aggiornare un elemento domanda, iniettato tramite dependency injection

    - *Metodi*
      - `put(id: int): Response`
        - *Descrizione*:
          - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
        - *Input*:
          - `id` tramite url param
          - `domanda` e `risposta` tramite body json
        - *Output*:
          - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il risultato dell'operazione di aggiornamento
          - messaggio di errore in caso di:
            - problemi di validazione dell'id, della domanda o della risposta
            - errore interno del server
            - mancanza di domanda o risposta nel body json

======= UpdateElementoDomandaUseCase
  - *Metodi*
    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento

===== Esecuzione Test
Le dipendenze dei REST controllers di esecuzione test sono:
  - *ExecuteTestUseCase*: rappresentano i casi d'uso per l'esecuzione del test implementati dai servizi
  - *GetTestStatusUseCase*: rappresenta il caso d'uso per ottenere lo stato del test
  - *Containers*: rappresentano le classi che gestiscono le dependency injection
  - *Inject* e *Provide*: rappresentano le funzioni per l'iniezione delle dipendenze

====== ExecuteController
#align(center)[
      #image("../pictures/uml/ExecuteController.png", height: 9%)
    ]

======= ExecuteTestController
  - *Attributi*
    - `useCase`: caso d'uso per eseguire il test, iniettato tramite dependency injection
    - `status_tracker`: caso d'uso per monitorare lo stato di avanzamento del test, iniettato tramite dependency injection
  
  - *Metodi*
    - `post(): Response`
      - *Descrizione*:
        - avvia il test a partire da tutti gli elementi domanda presenti nel sistema e ne monitora lo stato durante la sua esecuzione
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno un messaggio di corretto avvio del test
        - messaggio di errore in caso di:
          - errore di comunicazione con l'LLM
          - errore interno del server

======= ExecuteTestUseCase
  - *Metodi*
    - `executeTest(): None`
      - *Descrizione*:
        - esegue il test a partire da tutti gli elementi domanda presenti nel sistema, utilizzando l'LLM per ottenere le risposte da confrontare. Si occupa anche di valutare le risposte ottenute e di salvare il risultato del test
      - *Input*:
        - nessuno
      - *Output*:
        - nessuno

======= GetTestStatusUseCase
  - *Metodi*
    - `getTestStatus(): dict`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` che rappresenta lo stato del test in corso

====== StatusController
#align(center)[
      #image("../pictures/uml/StatusController.png", height: 9%)
    ]

======= GetTestStatusController
  - *Attributi*
    - `useCase`: caso d'uso per ottenere lo stato del test, iniettato tramite dependency injection

  - *Metodi*
    - `get(): Response`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno lo stato del test in corso
        - messaggio di errore in caso di:
          - errore interno del server

======= GetTestStatusUseCase
  - *Metodi*
    - `getTestStatus(): dict`
      - *Descrizione*:
        - ritorna lo stato del test in corso
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `dict` che rappresenta lo stato del test in corso

===== Risultato Test
Le dipendenze dei REST controllers di risultato test sono:
  - *GetRisultatoTestUseCase*: rappresenta il caso d'uso per ottenere il risultato del test
  - *GetAllRisultatiTestUseCase*: rappresenta il caso d'uso per ottenere tutti i risultati del test
  - *GetRisultatoSingolaDomandaUseCase*: rappresenta il caso d'uso per ottenere il risultato di una singola domanda
  - *Containers*: rappresentano le classi che gestiscono le dependency injection
  - *Inject* e *Provide*: rappresentano le funzioni per l'iniezione delle dipendenze

====== Get Controllers

#align(center)[
      #image("../pictures/uml/GetRisultatoTestController.png", height: 9%)
    ]
======= GetRisultatoTestController

  - *Attributi*
    - `useCase`: caso d'uso per ottenere il risultato del test, iniettato tramite dependency injection

  - *Metodi*
    - `get(id: int): Response`
      - *Descrizione*:
        - ritorna una risposta contenente il risultato del test a partire dal suo id
      - *Input*:
        - `id` tramite url param
      - *Output*:
        - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il risultato del test appena ottenuto
        - messaggio di errore in caso di:
          - problemi di validazione dell'id
          - errore interno del server

======= GetRisultatoTestUseCase
  - *Metodi*
    - `getRisultatoTest(id: int): RisultatoTest`
      - *Descrizione*:
        - ritorna il risultato del test con l'id specificato
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato del test
      - *Output*:
        - oggetto di tipo `RisultatoTest` che rappresenta il risultato del test appena ottenuto

====== GetAllRisultatoTest
#align(center)[
      #image("../pictures/uml/GetRisultatoTestController.png", height: 9%)
    ]
======= GetAllRisultatiTestController
  - *Attributi*
    - `useCase`: caso d'uso per ottenere tutti i risultati del test, iniettato tramite dependency injection

  - *Metodi*
    - `get(): Response`
      - *Descrizione*:
        - ritorna una risposta contenente un set di tutti i risultati del test
      - *Input*:
        - nessuno
      - *Output*:
        - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il set di risultati del test appena ottenuti
        - messaggio di errore in caso di:
          - errore interno del server

======= GetAllRisultatiTestUseCase
  - *Metodi*
    - `getAllRisultatiTest(): set[RisultatoTest]`
      - *Descrizione*:
        - ritorna un set di tutti i risultati del test
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `RisultatoTest` che rappresentano i risultati del test appena ottenuti
====== GetRisultatoSingolaDomanda
#align(center)[
      #image("../pictures/uml/GetRisultatoSingolaDomandaController.png", height: 7%)
    ]
======= GetRisultatoSingolaDomandaController
  - *Attributi*
    - `useCase`: caso d'uso per ottenere il risultato di una singola domanda, iniettato tramite dependency injection

  - *Metodi*
    - `get(id: int): Response`
      - *Descrizione*:
        - ritorna una risposta contenente il risultato di una singola domanda a partire dal suo id
      - *Input*:
        - `id` tramite url param
      - *Output*:
        - oggetto di tipo `Response` che rappresenta la risposta HTTP con all'interno il risultato della singola domanda appena ottenuto
        - messaggio di errore in caso di:
          - problemi di validazione dell'id
          - errore interno del server

======= GetRisultatoSingolaDomandaUseCase
  - *Metodi*
    - `getRisultatoSingolaDomandaTestById(id: int): RisultatoSingolaDomanda`
      - *Descrizione*:
        - ritorna il risultato di una specifica domanda di un test a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco del risultato della domanda di uno specifico test
      - *Output*:
        - oggetto di tipo `RisultatoSingolaDomanda` che rappresenta il risultato della domanda appena ottenuto

==== Output Adapters
===== LLM
#align(center)[
      #image("../pictures/uml/LLM.png", height: 9%)
    ]
Le dipendenze dell'Adapter di LLM sono:
  - *LLMPort*: rappresenta la porta implementata dall'Adapter stesso

====== LLMAdapter
  - *Attributi*
    - `url`: stringa che rappresenta l'url per comunicare la domanda all'LLM ed ottenere la risposta
    - `nome`: stringa che rappresenta il nome/modello dell'LLM utilizzato

  - *Metodi*
    - `makeQuestion(domanda: str): str`
      - *Descrizione*:
        - invia la domanda all'LLM e ne ritorna la risposta
      - *Input*:
        - `domanda`: stringa che rappresenta il testo della domanda
      - *Output*:
        - stringa che rappresenta la risposta fornita dall'LLM
      - *Eccezioni*:
        - `Exception`: eccezione sollevata nel caso in cui ci siano problemi di comunicazione con l'LLM

    - `getName(): str`
      - *Descrizione*:
        - ritorna il nome dell'LLM
      - *Input*:
        - nessuno
      - *Output*:
        - stringa che rappresenta il nome dell'LLM

====== LLMPort
  - *Metodi*
    - `makeQuestion(domanda: str): str`
      - *Descrizione*:
        - invia la domanda all'LLM e ne ritorna la risposta
      - *Input*:
        - `domanda`: stringa che rappresenta il testo della domanda
      - *Output*:
        - stringa che rappresenta la risposta fornita dall'LLM

    - `getName(): str`
      - *Descrizione*:
        - ritorna il nome dell'LLM
      - *Input*:
        - nessuno
      - *Output*:
        - stringa che rappresenta il nome dell'LLM

===== Persistence (PostreSQL)
====== Elemento Domanda
Le dipendenze della sezione persistence di elemento domanda sono:
  - *ElementoDomanda*: rappresenta il dominio di elemento domanda
  - *ElementoDomandaPorts*: rappresentano le porte implementate dell'Adapter stesso
  - *SQLAlchemyError* e *NoResultFound*: rappresentano alcune eccezioni lanciate da SQLAlchemy e catturate dall'Adapter
  - *db*: rappresenta l'istanza del database utilizzato dalle entità del database e dalla repository per comunicare con il database stesso

#align(center)[
      #image("../pictures/uml/ElementoDomandaPersistence.png", height: 23%)
    ]

======= ElementoDomandaPersistenceAdapter
  - *Attributi*
    - `repository`: repository utilizzata per comunicare con il database
    - `mapper`: mapper utilizzato per mappare le entità del dominio di business con le entità del database

  - *Metodi*
    - `saveElementoDomanda(elementoDomanda: ElementoDomanda): ElementoDomanda`
      - *Descrizione*:
        - salva un elemento domanda nel database
      - *Input*:
        - `elementoDomanda`: oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda da salvare
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena salvato nel database

    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena ottenuto dal database
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui non venga trovato alcun elemento domanda con l'id specificato

    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti nel database
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appena ottenuti dal database

    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina uno o più elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione nel database

    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento nel database
      - *Eccezioni*:
        - `ValueError`: eccezione sollevata nel caso in cui non venga trovato alcun elemento domanda con l'id specificato

======= SaveElementoDomandaPort
  - *Metodi*
    - `saveElementoDomanda(elementoDomanda: ElementoDomanda): ElementoDomanda`
      - *Descrizione*:
        - salva un elemento domanda nel database
      - *Input*:
        - `elementoDomanda`: oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda da salvare
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena salvato nel database

======= GetElementoDomandaPort
  - *Metodi*
    - `getElementoDomandaById(id: int): ElementoDomanda`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomanda` che rappresenta l'elemento domanda appena ottenuto dal database

======= GetAllElementiDomandaPort
  - *Metodi*
    - `getAllElementiDomanda(): Set[ElementoDomanda]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti nel database
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomanda` che rappresentano gli elementi domanda appena ottenuti dal database

======= DeleteElementiDomandaPort
  - *Metodi*
    - `deleteElementiDomanda(ids: Set[int]): bool`
      - *Descrizione*:
        - elimina uno o più elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione nel database

======= UpdateElementoDomandaPort
  - *Metodi*
    - `updateElementoDomanda(id: int, domanda: str, risposta: str): bool`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento nel database

======= ElementoDomandaEntity
  - *Attributi*
    - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
    - `domanda`: stringa che rappresenta il testo della domanda
    - `risposta`: stringa che rappresenta il testo della risposta

======= ElementoDomandaPersistenceMapper
  - *Metodi*
    - `fromElementoDomandaEntity(entity: ElementoDomandaEntity): ElementoDomanda`
      - *Descrizione*:
        - mappa un oggetto di tipo `ElementoDomandaEntity` in un oggetto di tipo `ElementoDomanda`
      - *Input*:
        - `entity`: oggetto di tipo `ElementoDomandaEntity` da mappare
      - *Output*:
        - oggetto di tipo `ElementoDomanda`

    - `toElementoDomandaEntity(elementoDomanda: ElementoDomanda): ElementoDomandaEntity`
      - *Descrizione*:
        - mappa un oggetto di tipo `ElementoDomanda` in un oggetto di tipo `ElementoDomandaEntity`
      - *Input*:
        - `elementoDomanda`: oggetto di tipo `ElementoDomanda` da mappare
      - *Output*:
        - oggetto di tipo `ElementoDomandaEntity`

    - `fromDomandaRisposta(domanda: str, risposta: str): ElementoDomandaEntity`
      - *Descrizione*:
        - mappa una domanda e una risposta in un oggetto di tipo `ElementoDomandaEntity`
      - *Input*:
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - oggetto di tipo `ElementoDomandaEntity`

======= ElementoDomandaPostgreSQLRepository
  - *Attributi*
    - `db`: istanza del database utilizzata per comunicare con il database stesso

  - *Metodi*
    - `saveElementoDomanda(elementoEntity: ElementoDomandaEntity): ElementoDomandaEntity`
      - *Descrizione*:
        - salva un elemento domanda nel database
      - *Input*:
        - `elementoEntity`: oggetto di tipo `ElementoDomandaEntity` che rappresenta l'elemento domanda da salvare
      - *Output*:
        - oggetto di tipo `ElementoDomandaEntity` che rappresenta l'elemento domanda appena salvato nel database
      - *Eccezioni*:
        - `SQLAlchemyError`: eccezione sollevata nel caso in cui ci siano problemi durante le operazione svolte sul database

    - `loadElementoDomandaById(id: int): ElementoDomandaEntity`
      - *Descrizione*:
        - ritorna un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
      - *Output*:
        - oggetto di tipo `ElementoDomandaEntity` che rappresenta l'elemento domanda appena ottenuto dal database
      - *Eccezioni*:
        - `NoResultFound`: eccezione sollevata nel caso in cui non venga trovato alcun elemento domanda con l'id specificato
        - `SQLAlchemyError`: eccezione sollevata nel caso in cui ci siano problemi durante le operazione svolte sul database

    - `loadAllElementiDomanda(): Set[ElementoDomandaEntity]`
      - *Descrizione*:
        - ritorna un set di tutti gli elementi domanda presenti nel database
      - *Input*:
        - nessuno
      - *Output*:
        - set di oggetti di tipo `ElementoDomandaEntity` che rappresentano gli elementi domanda appena ottenuti dal database
      - *Eccezioni*:
        - `SQLAlchemyError`: eccezione sollevata nel caso in cui ci siano problemi durante le operazione svolte sul database

    - `deleteElementiDomanda(id: Set[int]): None`
      - *Descrizione*:
        - elimina uno o più elementi domanda a partire da un set di id
      - *Input*:
        - `ids`: set di interi che rappresentano gli identificativi univoci degli elementi domanda da eliminare
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di eliminazione nel database
      - *Eccezioni*:
        - `SQLAlchemyError`: eccezione sollevata nel caso in cui ci siano problemi durante le operazione svolte sul database

    - `updateElementoDomanda(id: int, domanda: str, risposta: str): None`
      - *Descrizione*:
        - aggiorna domanda e risposta di un elemento domanda a partire dal suo id
      - *Input*:
        - `id`: intero che rappresenta l'identificativo univoco dell'elemento domanda
        - `domanda`: stringa che rappresenta il testo della domanda
        - `risposta`: stringa che rappresenta il testo della risposta
      - *Output*:
        - booleano che rappresenta il risultato dell'operazione di aggiornamento nel database
      - *Eccezioni*:
        - `SQLAlchemyError`: eccezione sollevata nel caso in cui ci siano problemi durante le operazione svolte sul database
        - `NoResultFound`: eccezione sollevata nel caso in cui non venga trovato alcun elemento domanda con l'id specificato

====== Risultato Test

=== Tracciamento requisiti
Qui di seguito verrà riportato in una tabella il tracciamento dei requisiti funzionali sulle varie classi del backend.

#table-json-ST(json("tabelle.json").at("tracciamento_requisiti").at("backend"))

== Database
#figure(
  image("../pictures/db/Artificial_QI_ER.jpg"),
  caption: [
    Architettura del database
  ]
)

=== Entità
Il database è composto da 5 entità:
  - *ElementoDomanda*: rappresenta una singola domanda con annessa risposta. È composto da:
    - id: identificativo univoco dell'elemento domanda
    - domanda: l' oggetto domanda
    - risposta: l' oggetto risposta attesa

  - *Domanda* : rappresenta la domanda. È composto da:
    - testo : il testo della domanda
  
  - *Risposta* : rappresenta la risposta. È composto da:
    - testo : il testo della risposta

  - *RisultatoTest*: rappresenta il risultato di un test di valutazione svolto su delle domande. È composto da:
    - id: identificativo univoco del risultato
    - score: punteggio ottenuto dal test
    - LLM: nome dell'LLM a cui vengono poste le domande
    - data: data in cui è stato svolto il test
    - nomeSet: nome del set di domande utilizzato per il test. Questo campo può essere nullo se il test viene svolto su tutte le domande disponibili

  - *RisultatoSingolaDomanda*: rappresenta il risultato ottenuto da una singola domanda all'interno del risultato di un test . È composto da:
    - id: identificativo univoco del risultato
    - idRisultatoTest: identificativo del risultato del test a cui appartiene
    - domanda: testo della domanda testata
    - risposta: testo della risposta testata
    - rispostaLLM: testo della risposta fornita dall'LLM
    - score: punteggio ottenuto dalla domanda
    - metriche : un dizionario di coppie "nome metrica" e "score parziale ottenuto" corrispondente

=== Query
Le operazioni principali che vengono eseguite sul database sono:
- *Inserimento*:
  - di un elemento domanda
  - di un risultato di un test, con conseguente caricamento di risultati delle singole domande e dei relativi risultati delle singole metriche.
- *Ottenimento*:
  - di un elemento domanda o di tutti gli elementi domanda presenti.
  - di un risultato di un test o di tutti i risultati di test presenti. In entrambi i casi, con conseguente ottenimento di risultati delle singole domande e dei relativi risultati delle singole metriche.
  - di un risultato di una singola domanda, con conseguente ottenimento dei risultati delle singole metriche.
- *Eliminazione*:
  - di uno o più elementi domanda
- *Aggiornamento*:
  - di domanda o risposta di un determinato elemento domanda

== Architettura
=== Architettura di Deployment
L'architettura di deployment utilizzata dall'applicativo sia lato client che lato server è di tipo *monolitico*. Questo tipo di architettura porta diversi vantaggi:
- Semplicità di sviluppo
- Facilità di deployment
- Facilità di testing
- Prestazioni migliori

=== Architettura Logica
==== Backend
L'architettura logica della componente backend dell'applicativo è di tipo *esagonale*, il quale permette di *isolare* la logica di business e renderla indipendente da eventuali servizi esterni, con i quali andrà a *comunicare* tramite l'uso di *interfacce* che fungeranno da porte. Questo permette di rendere il sistema più flessibile a comunicazioni con servizi esterni differenti. \

La parte centrale dell'esagono è rappresentata quindi dalla *logica di business*, il quale contiene quindi il dominio del programma. \

Le porte, punto focale di comunicazione con l'esterno, sono rappresentate dalle *interfacce*. Ne distinguiamo di due tipi:
 - Le *Inbound Ports* (o Use Case) saranno quelle utilizzate da attori esterni per comunicare con il sistema. Queste interfacce saranno implementate dal sistema stesso tramite un sistema di API. Esse definiscono quindi i casi d'uso e le operazioni implementate dal sistema.
 - Le *Outbound Ports* saranno invece quelle utilizzate dal sistema stesso per comunicare con attori esterni. \

Gli *Adapters* sono invece le classi che andranno ad implementare in maniera concreta le porte definite dalle interfacce. Queste classi faranno quindi da ponte tramite la logica interna e i servizi esterni. Anche qui ne distinguiamo di due tipi:
- Gli *Inbound Adapters* saranno quelli che implementeranno le interfacce Inbound, andando a definire quindi le operazioni che il sistema dovrà eseguire in base ai casi d'uso.
- Gli *Outbound Adapters* saranno quelli che implementeranno le interfacce Outbound, andando a definire quindi le operazioni che il sistema dovrà eseguire per comunicare con servizi esterni.

==== Frontend
Per quanto riguarda il frontend è stata invece adottata un'architettura di tipo *MVVM* (Model-View-ViewModel), implementata in modo implicito dal framework *Vue.js*. Questa struttura consente un approccio dichiarativo e reattivo, favorendo una netta separazione tra la logica di business e l'interfaccia utente. 
Nel dettaglio, il pattern MVVM si articola nei seguenti elementi:
- Model: rappresenta i dati dell'applicazione. In Vue.js, ciò corrisponde allo stato locale dei componenti, eventualmente esteso attraverso strumenti come Vuex o Pinia per la gestione dello stato globale.
- View: è l'interfaccia grafica dell'applicazione, costituita dai template HTML. Grazie al data binding reattivo offerto da Vue.js, la vista si aggiorna automaticamente al variare dei dati sottostanti.

- ViewModel: funge da ponte tra il Model e la View, gestendo la logica di interazione e l'aggiornamento dello stato. In Vue.js, il componente stesso, nonché il motore di Vue.js che svolge il ruolo di ViewModel, che definisce proprietà, metodi, computed properties e gestori degli eventi.

Questo tipo di architettura, oltre a facilitare lo sviluppo di Single Page Application (SPA), sfrutta una struttura component-based che consente un'elevata modularità del codice. Tale approccio favorisce il riuso dei componenti, la separazione delle responsabilità e una composizione scalabile dell'interfaccia, rendendo l'applicazione più manutenibile ed estensibile nel tempo.

== Design Patterns Utilizzati
=== Singleton
Il pattern *Singleton* viene utilizzato per garantire che una classe abbia una sola istanza e fornire un punto di accesso globale a tale istanza. Ciò è utile in casi in cui sia hanno classi diverse che utilizzano un'istanza di un'altra classe in maniera condivisa. Questo pattern è stato utilizzato per gestire la creazione di un'unica istanza di connessione al database.

=== Strategy
Il pattern *Strategy* viene principalmente utilizzato per definire una famiglia di algoritmi, incapsularli e renderli intercambiabili. Questo pattern è stato utilizzato per definire le diverse strategie e algoritmi che permettono la valutazione delle domande.

=== Factory Method
Il pattern *Factory Method* viene utilizzato per definire un'interfaccia per la creazione di un oggetto, ma lascia alle sottoclassi la decisione su quale classe istanziare. Questo pattern è stato utilizzato per la creazione e gestione di dipendenze tramite dependency injection.

=== Decorator
Il pattern *Decorator* viene utilizzato per aggiungere funzionalità a un oggetto dinamicamente, incapsulandolo in un nuovo oggetto che contiene queste funzionalità. Questo pattern è stato utilizzato per esempio per l'"iniezione" delle dipendenze all'interno dei controllers.

=== Dependency injection
Il pattern *Dependency Injection* viene utilizzato per fornire alle classi le loro dipendenze dall'esterno, piuttosto che crearle direttamente al loro interno. Questo approccio migliora la modularità e facilita il testing, permettendo di sostituire facilmente le dipendenze con implementazioni alternative o mock durante i test. \
Nel nostro progetto, la dependency injection è stata utilizzata per gestire la configurazione e l'inizializzazione dei servizi principali, come i repository, i servizi di business e i controllers per la comunicazione con servizi esterni.

=== MVVM
Il pattern *MVVM* (Model-View-ViewModel) è un'architettura progettuale che separa la logica di presentazione dalla logica di business e dall'interfaccia utente. Questo pattern è stato utilizzato per strutturare l'applicazione frontend, consentendo una chiara separazione delle responsabilità tra i componenti e facilitando la manutenzione e l'estensibilità del codice. \