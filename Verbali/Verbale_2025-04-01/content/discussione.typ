#import "../../functions.typ": decisioni

== Architettura monolitica

Si è discusso in merito alla scelta tra un'*architettura* monolitica e una basata su microservizi. Dopo aver analizzato i vantaggi e le criticità di entrambe le soluzioni, si è giunti a una decisione condivisa.

#decisioni(
 [
   - Adottare un'architettura monolitica.
 ],
 [
   - Nonostante l'impiego di Docker, che tipicamente favorisce la suddivisione del sistema in container separati, si è deciso di realizzare un unico file di configurazione in grado di avviare l'intero sistema con un solo comando. Le varie componenti del sistema comunicheranno tra loro attraverso una rete interna condivisa di Docker.
 ]
)