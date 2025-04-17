#import "functions_mod.typ": table-json , costi

#let preventivi = json("tabelle.json").at("preventivo")

== Introduzione
  Un preventivo rappresenta un documento di riferimento utilizzato per fornire una stima riguardante il consumo di risorse necessario per lo svolgimento delle attività programmate. In questa parte, vengono presi in considerazione i costi economici e temporali affrontati dal gruppo in ciascun periodo di lavoro.
  
  Per semplicità verranno usate le seguenti abbreviazioni:
  - *Res* : Responsabile
  - *Amm* : Amministratore
  - *Ana* : Analista
  - *Ptt* : Progettista
  - *Pre* : Programmatore
  - *Ver* : Verificatore

#pagebreak()

== Requirements and Technology Baseline
  === Primo Periodo 05/11/2024 - 18/11/2024
  *Preventivo Orario*
    #table-json(preventivi.at("1"), 8)
    #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p1_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p1_dist_ore.png",height: 18%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(preventivi.at("1")), 3)
  ],
  [
    #table-json(preventivi.at("tot1"), 3)
  ]
)
  *Grafico a torta del budget speso e rimanente preventivato nel primo periodo.*
  #image("Graphs/P/1costi.png",height: 20%)
  #pagebreak()
  === Secondo Periodo 19/11/2024 - 02/12/2024
  *Preventivo Orario*
  #table-json(preventivi.at("2"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p2_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p2_dist_ore.png",height: 18%)
  ])
  
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(preventivi.at("2")), 3)
  ],
  [
    #table-json(preventivi.at("tot2"), 3)
  ]
)
  *Grafico a torta del budget speso e rimanente preventivato nel secondo periodo.*
   #image("Graphs/P/2costi.png",height: 20%)
  #pagebreak()
  === Terzo Periodo 03/12/2024 - 16/12/2024
  *Preventivo Orario*
  #table-json(preventivi.at("3"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p3_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p3_dist_ore.png",height: 18%)
  ])
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(preventivi.at("3")), 3)
  ],
  [
    #table-json(preventivi.at("tot3"), 3)
  ]
)
  *Grafico a torta del budget speso e rimanente preventivato nel terzo periodo.*
   #image("Graphs/P/3costi.png",height: 20%)
  #pagebreak()
  === Quarto Periodo 17/12/2024 - 30/12/2024
  *Preventivo Orario*
  #table-json(preventivi.at("4"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p4_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p4_dist_ore.png",height: 18%)
  ])
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
  #table-json(costi(preventivi.at("4")), 3)
  ],
  [
    #table-json(preventivi.at("tot4"), 3)
  ]
)
  *Grafico a torta del budget speso e rimanente preventivato nel quarto periodo.*
   #image("Graphs/P/4costi.png",height: 20%)
  #pagebreak()
  === Quinto Periodo 31/12/2024 - 13/01/2025
  *Preventivo Orario*
  #table-json(preventivi.at("5"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p5_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p5_dist_ore.png",height: 18%)
  ])
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("5")), 3)
  ],
  [
    #table-json(preventivi.at("tot5"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel quinto periodo.*
  #image("Graphs/P/5costi.png",height: 20%)
  #pagebreak()
  === Sesto Periodo 14/01/2025 - 27/01/2025
  *Preventivo Orario*
  #table-json(preventivi.at("6"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p6_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p6_dist_ore.png",height: 18%)
  ])
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("6")), 3)
  ],
  [
    #table-json(preventivi.at("tot6"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel sesto periodo.*
   #image("Graphs/P/6costi.png",height: 20%)
  #pagebreak()
  === Settimo Periodo 28/01/2025 - 10/02/2025
    *Preventivo Orario*
  #table-json(preventivi.at("7"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p7_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p7_dist_ore.png",height: 18%)
  ])
  *Preventivo costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("7")), 3)
  ],
  [
    #table-json(preventivi.at("tot7"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel settimo periodo.*
   #image("Graphs/P/7costi.png",height: 20%)
  #pagebreak()

  === Ottavo Periodo 11/02/2025 - 24/02/2025
      *Preventivo Orario*
  #table-json(preventivi.at("8"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p8_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p8_dist_ore.png",height: 18%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("8")), 3)
  ],
  [
    #table-json(preventivi.at("tot8"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nell'ottavo periodo.*
   #image("Graphs/P/8costi.png",height: 20%)
  #pagebreak()
  === Nono Periodo 25/02/2025 - 10/03/2025
        *Preventivo Orario*
  #table-json(preventivi.at("9"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/p9_dist_ore_persona.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/p9_dist_ore.png",height: 18%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("9")), 3)
  ],
  [
    #table-json(preventivi.at("tot9"), 3)
  ]
)
  *Grafico a torta del budget speso e rimanente preventivato nel nono periodo.*
   #image("Graphs/P/9costi.png",height: 20%)
  #pagebreak()

== Product Baseline

  === Decimo Periodo 11/02/2025 - 24/03/2025
        *Preventivo Orario*
  #table-json(preventivi.at("10"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/P/10persone.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/P/10ruoli.png",height: 17%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("10")), 3)
  ],
  [
    #table-json(preventivi.at("tot10"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel decimo periodo.*
  #image("Graphs/P/10costi.png",height: 22%)
  #pagebreak()
   === Undicesimo Periodo 25/03/2025 - 07/04/2025
        *Preventivo Orario*
  #table-json(preventivi.at("11"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/P/11persone.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/P/11ruoli.png",height: 17%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("11")), 3)
  ],
  [
    #table-json(preventivi.at("tot11"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel undicesimo periodo.*
  #image("Graphs/P/11costi.png",height: 22%)
  #pagebreak()
   === Dodicesimo Periodo 08/04/2025 - 21/04/2025
        *Preventivo Orario*
  #table-json(preventivi.at("12"), 8)
  #table(
  columns: 2,
  stroke: none,
  [
  *Distribuzione delle ore personali*
  #image("Graphs/P/12persone.png",height: 18%)
  ],[
  *Distribuzione delle ore per ruolo*
  #image("Graphs/P/12ruoli.png",height:17%)
  ])
  *Preventivo Costi*
  #table(
  columns: 2,
  stroke: none,
  [
    #table-json(costi(preventivi.at("12")), 3)
  ],
  [
    #table-json(preventivi.at("tot12"), 3)
  ]
)
  
  *Grafico a torta del budget speso e rimanente preventivato nel dodicesimo periodo.*
  #image("Graphs/P/12costi.png",height: 22%)
  #pagebreak()