from src.domain import RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoSingolaDomandaEntity, MetricheEntity

class RisultatoSingolaDomandaPersistenceMapper:
    
    def fromRisultatoSingolaDomandaEntity(self, entity: RisultatoSingolaDomandaEntity) -> RisultatoSingolaDomanda:
        return RisultatoSingolaDomanda(id=entity.id, 
                                        domanda=entity.domanda, 
                                        risposta=entity.risposta, 
                                        rispostaLLM=entity.rispostaLLM, 
                                        score=entity.score, 
                                        metriche={m.nomeMetrica: m.score for m in entity.risultatiMetriche})

    def toRisultatoSingolaDomandaEntity(self, risultato: RisultatoSingolaDomanda) -> RisultatoSingolaDomandaEntity:
        return RisultatoSingolaDomandaEntity(domanda=risultato.getDomanda(), 
                                                risposta=risultato.getRisposta(), 
                                                rispostaLLM=risultato.getRispostaLLM(), 
                                                score=risultato.getScore(), 
                                                risultatiMetriche=[MetricheEntity(nomeMetrica=metrica, score=risultato.getMetriche()[metrica]) for metrica in risultato.getMetriche().keys()])