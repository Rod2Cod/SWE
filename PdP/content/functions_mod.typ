#let table-json(data, fractions) = {
  let keys = data.at("keys")
  let values = data.at("values")

  table(
      fill: (_, y) => 
      if y == 0 {gray.lighten(50%)} 
      else if calc.even(y) {gray.lighten(80%)},
      align: horizon + center,
      columns: fractions,
      ..keys.map(key => {strong(key)}),
      ..values.map(
        row => keys.map(
          key => if key == "Rischio" {
                    strong(str(row.at(key, default: "0")))
                 } else {
                    str(row.at(key, default: "0"))
                 }
        )
      ).flatten()
  )
}

#let table-stima-costi(data, fractions) = {
  let keys = data.at("keys")
  let values = data.at("values")

  table(
      fill: (_, y) => 
      if y == 0 {gray.lighten(50%)} 
      else if calc.even(y) {gray.lighten(80%)},
      align: horizon + center,
      columns: fractions,
      ..keys.map(key => {strong(key)}),
      ..values.map(
        row => keys.map(
          key => if str(row.at(key,default :"")) == "Totale" {
                    strong(str(row.at(key, default: "")))
                 } else {
                    str(row.at(key, default: ""))
                 }
        )
      ).flatten()
  )
}


#let costi(data) = {
  let ret = (
    "keys" : ("Ruolo", "Ore", "Costo €"),
    "values" : (),
  )

  let roles = ( //Ore totali, costo orario e coprrispondente
  "Res": (0,30,"Responsabile"),
  "Amm": (0,20,"Amministratore"),
  "Ana": (0,25,"Analista"),
  "Ptt": (0,25,"Progettista"),
  "Pre": (0,15,"Programmatore"),
  "Ver": (0,15,"Verificatore"),
  )

  for v in data.at("values"){
    for key in v.keys(){
      if key in roles{
        roles.at(key).at(0) += v.at(key)
      }
    }
  }

  for role in roles.values(){
    ret.at("values").push((
      "Ruolo": role.at(2),
      "Ore": role.at(0),
      "Costo €": role.at(0)*role.at(1)
    ))
  }
  return ret
}

//Esempio di utilizzo funzioni costi e table-json
#table-json(costi(json("tabelle.json").at("preventivo").at("1")),(1fr,1fr,1fr))