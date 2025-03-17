// Elementi da modificare per verbali
#let title = "Titolo del documento"
#let tabelle = "content/tabelle.json"
#let segretario = "Maggion Alberto"
#let date = datetime(
  day: 17,
  month: 03,
  year: 2025
)

#let abstract =  [#include "content/abstract.typ"]
#let odg = [#include "content/odg.typ"]
#let discussione = [#include "content/discussione.typ"]
#let rimandati = [#include "content/rimandati.typ"]