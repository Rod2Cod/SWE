from src.domain import ElementoDomanda
from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity

class ElementoDomandaPersistenceMapper:

    def fromElementoDomandaEntity(self, entity: ElementoDomandaEntity) -> ElementoDomanda:
        return ElementoDomanda(id=entity.id, 
                               domanda=entity.domanda, 
                               risposta=entity.risposta)

    def toElementoDomandaEntity(self, elemento: ElementoDomanda) -> ElementoDomandaEntity:
        return ElementoDomandaEntity(domanda=elemento.getDomanda().getText(), 
                                     risposta=elemento.getRisposta().getText())
        
    def fromDomandaRisposta(self, domanda: str, risposta: str) -> ElementoDomandaEntity:
        return ElementoDomandaEntity(domanda=domanda, risposta=risposta)