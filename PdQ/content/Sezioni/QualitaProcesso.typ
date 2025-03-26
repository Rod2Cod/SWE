#let tabelle = "../tabelle.json"
#import "../../../functions.typ": table-json

Per il monitoraggio della qualità dei processi, il gruppo ha scelto di attenersi allo standard ISO/IEC/IEEE 12207:1995, che fornisce un riferimento strutturato per la gestione e il miglioramento dei processi software. \ 

In questa sezione sono riportati i valori accettabili e ottimali delle metriche che il team ha deciso di utilizzare per valutare la qualità dei processi primari, di supporto e organizzativi. Tali metriche sono identificate dalla sigla *MPC* (Metriche di Processo).

== Processi Primari
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiPrimari"),3)

== Processi di Supporto
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiSupporto"),3)

== Processi organizzativi
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiOrganizzativi"),3)

== Metriche Utilizzate
Le metriche presentate in questa sezione sono definite e formalizzate nel Way of Working.
  
=== Processi Primari
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiPrimariMetriche").at("Fornitura"),4)
    
==== Sviluppo
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiPrimariMetriche").at("Sviluppo"),4)

=== Processi di Supporto
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiSupportoMetriche").at("Verifica"),4)

==== Gestione della Qualità
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiSupportoMetriche").at("GestioneQualità"),4)
  
=== Processi Organizzativi
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiOrganizzativiMetriche").at("GestioneOrganizzativa"),4)
  