#let tabelle = "../tabelle.json"
#import "../../../functions.typ": table-json


La qualità di processo si fonda sull'idea che, per ottenere un prodotto che soddisfi determinati *standard* di qualità, è necessario che i *processi* che lo vanno a creare, vengano sottoposti a *controlli* periodici con lo scopo ultimo di ottimizzarli. \
Il concetto di qualità di processo viene dunque applicato all’intero spettro di *attività*, *pratiche* e *metodi* utilizzati lungo l’intero ciclo di vita del software. In sintesi, la qualità di processo si pone l'obiettivo di rendere la qualità una *parte integrante* del prodotto, garantendo che sia *costruita* nel processo stesso e non sia solo un obiettivo secondario. \
Di seguito vengono presentate le *metriche* che il team si impegna ad utilizzare nel contesto della verifica della qualità di processo.

La sigla *MPC* indica le *metriche di processo*.

== Processi Primari
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiPrimari"),3)

== Processi di Supporto
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiSupporto"),3)

== Processi organizzativi
    #table-json(json(tabelle).at("Qualità").at("Processo").at("ProcessiOrganizzativi"),3)

== Metriche Utilizzate
  
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
  