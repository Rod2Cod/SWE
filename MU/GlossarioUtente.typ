#let glossario = (

  "LLM|Large Language Model":"Modello linguistico preaddestrato su grandi quantità di dati, in grado di comprendere e generare testo in linguaggio naturale in ambito generale.",

  "Elemento domanda":"Elemento composto dalla coppia domanda testuale e risposta attesa associata testuale.",
  "Meteriche":"Criteri di valutazione delle risposte dell'LLM che producono uno score intermedio utilizzato per il calcolo del punteggio domanda associato ad ogni domanda presente nel test.",
  "score generale":"Punteggio assegnato al test calcolato tenendo conto di tutti i punteggi domanda associati alle singole domande utilizzate nel test.",
  "API|Application Programming Interface":"Un insieme di regole e protocolli che permette a diverse applicazioni software di comunicare e scambiarsi dati tra loro.",
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
