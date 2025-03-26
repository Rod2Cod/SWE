#let tabelle = "../tabelle.json"
#import "../../../functions.typ": table-json

Nella sezione seguente, vengono descritte le *metriche* che il team si impegna a impiegare per monitorare e migliorare la qualità del prodotto.

La sigla *MPD* indica le *metriche di prodotto*.

== Documentazione
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("Documentazione"),3)

== Software
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("Software"),3)
  
== Metriche Utilizzate
Le metriche presentate in questa sezione sono definite e formalizzate nel Way of Working.

=== Documentazione
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("DocumentazioneMetriche").at("DocumentazioneTab"),4)

=== Software

==== Funzionalità
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("Funzionalità"),4)
    
==== Usabilità
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("Usabilità"),4)
    

=== Efficienza
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("Efficienza"),4)
    
=== Affidabilità
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("Affidabilità"),4)
    
=== Manutenibilità
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("Manutenibilità"),4)
    
=== Copertura dei test
    #table-json(json(tabelle).at("Qualità").at("Prodotto").at("SoftwareMetriche").at("CoperturaTest"),4)