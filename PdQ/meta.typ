// Elementi da modificare per verbali interni
#let title = "Piano di Qualifica"
#let tabelle = "content/tabelle.json"
#let data = datetime.today().display("[day]/[month]/[year]")

#let abstract =  [#include "content/sezioni/abstract.typ"]
#let Introduzione = [#include "content/Sezioni/Introduzione.typ"]
#let QualitaProcesso = [#include"content/Sezioni/QualitaProcesso.typ"]
#let QualitaProdotto = [#include "content/Sezioni/QualitaProdotto.typ"]
#let ResocontoAttivitaVerifica = [#include "content/Sezioni/ResocontoAttivitaVerifica.typ"]
#let SpecificaTest = [#include "content/Sezioni/SpecificaTest.typ"]