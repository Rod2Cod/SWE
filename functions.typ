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

#let table-json-req(data,fractions) = {
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
                          // Se "PrimaColonna" è "Totale", evidenzio in giallo
                          strong(row.at(key, default: []))
                    } else {
                      row.at(key, default: [])
                    }
                 }
        )
      ).flatten()
  )
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

