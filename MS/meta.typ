#let title = "Manuale Sviluppatore"
#let tabelle = "content/tabelle.json"
#let keywords = ("Manuale Sviluppatore", "modulistica", "guida", "tecnologie")
#let data = datetime.today().display("[day]/[month]/[year]")

#let abstract =  [#include "content/abstract.typ"]
#let pages_Jekyll = [#include "content/pages_Jekyll.typ"]
#let github_Actions = [#include "content/github_Actions.typ"]
#let introduzione = [#include "content/introduzione.typ"]
#let frontend_vue = [#include "content/frontend_vue.typ"]
#let docker = [#include "content/docker.typ"]
#let db_postgres = [#include "content/db_postgres.typ"]
#let backend_flask = [#include "content/flask_api.typ"]
#let llm_evaluator = [#include "content/llm_evaluator.typ"]