 #let table-json(data,fractions) = {
  let keys = data.at("keys")
  let values = data.at("values")

  table(
      fill: (_,y) =>
      if y == 0 {gray.lighten(50%)},
      align: left,
      columns: fractions,
      ..keys.map(key => {strong(key)}),
      ..values.map(
        row => keys.map(
          key => row.at(key, default:[])
        )
      ).rev().flatten()
  )
}

#let table-json-rev(data,fractions) = {
  let keys = data.at("keys")
  let values = data.at("values")

  table(
      fill: (_,y) =>
      if y == 0 {gray.lighten(50%)}, // Sfondo blu per la cella "Totale", //else if calc.even(y){gray.lighten(80%)},
      align: horizon + center,
      columns: fractions,
      ..keys.map(key => {strong(key)}),
      ..values.map(
        row => keys.map(
          key => if key == "Codice" {
                    //evidenzio contenuto colonna "codice"
                    strong(row.at(key, default: []))
                 } else {
                    if row.at("Tipologia", default: "") == "Totale" and key == "Tipologia" {
                          // Evidenzion sfondo cella Tipologia
                          strong(row.at(key, default: []))
                    } else {
                      row.at(key, default: [])
                    }
                 }
        )
      ).flatten()
  )
}

#let table-json-cal(data,fractions) = {
  let keys = data.at("keys")
  let values = data.at("values")

  table(
      fill: (_,y) =>
      if y == 0 {gray.lighten(50%)},
      align: horizon + center,
      columns: fractions,
      ..keys.map(key => {strong(key)}),
      ..values.map(
        row => keys.map(
          key => if key == "Revisione" {
                    //evidenzio contenuto colonna "codice"
                    emph(row.at(key, default: []))
                 } else { 
                  row.at(key, default:[])
                 }
        )
      ).flatten()
  )
}

#let table-json-req(data) = {
  let funzionali = (
    Obbligatori: data.at("requisiti_funzionali").at("values").filter(x => x.Classificazione == "Obbligatorio").len(),
    Desiderabili: data.at("requisiti_funzionali").at("values").filter(x => x.Classificazione == "Desiderabile").len(),
    Opzionali: data.at("requisiti_funzionali").at("values").filter(x => x.Classificazione == "Opzionale").len()
  )

  let qualità = (
    Obbligatori: data.at("requisiti_qualità").at("values").filter(x => x.Classificazione == "Obbligatorio").len(),
    Desiderabili: data.at("requisiti_qualità").at("values").filter(x => x.Classificazione == "Desiderabile").len(),
    Opzionali: data.at("requisiti_qualità").at("values").filter(x => x.Classificazione == "Opzionale").len()
  )

  let vincolo = (
    Obbligatori: data.at("requisiti_vincolo").at("values").filter(x => x.Classificazione == "Obbligatorio").len(),
    Desiderabili: data.at("requisiti_vincolo").at("values").filter(x => x.Classificazione == "Desiderabile").len(),
    Opzionali: data.at("requisiti_vincolo").at("values").filter(x => x.Classificazione == "Opzionale").len()
  )

  let totali = (
    Obbligatori: funzionali.Obbligatori + qualità.Obbligatori + vincolo.Obbligatori,
    Desiderabili: funzionali.Desiderabili + qualità.Desiderabili + vincolo.Desiderabili,
    Opzionali: funzionali.Opzionali + qualità.Opzionali + vincolo.Opzionali,
    Totali: funzionali.Obbligatori + funzionali.Desiderabili + funzionali.Opzionali + qualità.Obbligatori + qualità.Desiderabili + qualità.Opzionali + vincolo.Obbligatori + vincolo.Desiderabili + vincolo.Opzionali
  )

  table(
    fill: (_,y) =>
      if y == 0 {gray.lighten(50%)}, // Sfondo blu per la cella "Totale", //else if calc.even(y){gray.lighten(80%)},
      align: horizon + center,
      columns: 5,
      table.header(
        [*Tipologia*], [*Obbligatorio*], [*Desiderabile*], [*Opzionale*], [*Totale*],
      ),
      [Funzionali], [#funzionali.at("Obbligatori")], [#funzionali.at("Desiderabili")], [#funzionali.at("Opzionali")], [#totali.at("Obbligatori")],
      [Di qualità], [#qualità.at("Obbligatori")], [#qualità.at("Desiderabili")], [#qualità.at("Opzionali")], [#totali.at("Desiderabili")],
      [Di vincolo], [#vincolo.at("Obbligatori")], [#vincolo.at("Desiderabili")], [#vincolo.at("Opzionali")], [#totali.at("Opzionali")],
      [*Totale*], [#totali.at("Obbligatori")], [#totali.at("Desiderabili")], [#totali.at("Opzionali")], [#totali.at("Totali")],
  )
}

#let table-json-tec(data) = {
  let sections = data.keys()

  for section in sections [
    #let keys = data.at(section).at("keys")
    #let values = data.at(section).at("values")

    == #section.replace(regex("(^)[a-z]"), m => upper(m.text))

    #table(
        fill: (_,y) =>
        if y == 0 {gray.lighten(50%)},
        align: left,
        columns: 3,
        ..keys.map(key => {strong(key)}),
        ..values.map(
          row => keys.map(
            key => row.at(key, default:[])
          )
        ).rev().flatten()
    )
  ]
}

#let printDict(dict) = {
  let sortedDict = dict.pairs().sorted(key: x => upper(x.first()))
  let printed = none
  for (key, value) in dict {
    
  }
  for (key,value) in sortedDict {
    let words-in-key = ()
    if "|" in key{
      words-in-key.push(key.split("|").join(" - "))
    }else{
            words-in-key.push(key)
    }
    if printed != upper(words-in-key.at(0).first()){
      heading(
        upper(words-in-key.at(0).first())
      )
      printed = upper(words-in-key.at(0).first())
    }
    heading(depth: 2)[#upper(words-in-key.at(0).first())#words-in-key.at(0).slice(1)] //Stampo la chiave con la prima lettera maiuscola
    upper(value.first())+value.slice(1) //Per essere sicuri che la prima lettera della descrizione sia maiuscola
    if(value.last()!=".") {"."} //Per assicurarsi di terminare tutte le descrizioni con un punto
  }
}

#let inDict(testo) = {
  return emph[#testo#sub("G")]
}

// Prendo l'ultima versione del documento
#let getLastDocVersion(data, path) = {
  let items = json("/" + path + "/" + data).at("versione").at("values")
  let filtered = items.filter(it => it.keys().contains("Versione"))
  filtered.at(-1, default: []).at("Versione", default: "")    // se versione non presente ritorna stringa vuota
}