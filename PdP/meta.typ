// Elementi da modificare per verbali
#let title = "Piano di Progetto"
#let tabelle = "content/tabelle.json"
#let data = datetime.today().display("[day]/[month]/[year]")

#let abstract =  [#include "content/abstract.typ"]
#let introduzione = [#include "content/introduzione.typ"]
#let pianificazione = [#include "content/pianificazione.typ"]
#let calendario_massima = [#include "content/calendario_massima.typ"]
#let stima_costi = [#include "content/stima_costi.typ"]
#let rischi_mitigazioni = [#include "content/rischi_mitigazioni.typ"]
#let preventivo = [#include "content/preventivo.typ"]
#let consuntivo = [#include "content/consuntivo.typ"]
