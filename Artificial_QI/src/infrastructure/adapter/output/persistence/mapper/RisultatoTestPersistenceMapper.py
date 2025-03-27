from src.domain import RisultatoTest
from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoSingolaDomandaPersistenceMapper

class RisultatoTestPersistenceMapper:
    def __init__(self, mapperRisultatoSingolaDomanda: RisultatoSingolaDomandaPersistenceMapper):
        self.__mapperRisultatoSingolaDomanda = mapperRisultatoSingolaDomanda
    
    def fromRisultatoTestEntity(self, entity: RisultatoTestEntity) -> RisultatoTest:
        return RisultatoTest(id=entity.id, 
                            score=entity.score, 
                            LLM=entity.LLM, 
                            dataEsecuzione=entity.data, 
                            nomeSet=entity.nomeSet, 
                            risultatiDomande=set([self.__mapperRisultatoSingolaDomanda.fromRisultatoSingolaDomandaEntity(risultato) for risultato in entity.risultatiDomande]))

    def toRisultatoTestEntity(self, risultato: RisultatoTest) -> RisultatoTestEntity:
        return RisultatoTestEntity(score=risultato.getScore(), 
                                  LLM=risultato.getLLM(), 
                                  data=risultato.getDataEsecuzione(), 
                                  nomeSet=risultato.getNomeSet(), 
                                  risultatiDomande=list([self.__mapperRisultatoSingolaDomanda.toRisultatoSingolaDomandaEntity(risultato) for risultato in risultato.getRisultatiDomande()]) )