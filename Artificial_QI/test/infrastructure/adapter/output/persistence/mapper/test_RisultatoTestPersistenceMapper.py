import pytest
from unittest.mock import Mock, patch
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity, RisultatoSingolaDomandaEntity, RisultatoMetricaEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoTestPersistenceMapper, RisultatoSingolaDomandaPersistenceMapper

@pytest.fixture
def RisultatoSingolaDomanda1():
    return RisultatoSingolaDomanda(id=1, 
                                   domanda="Domanda 1", 
                                   risposta="Risposta 1", 
                                   rispostaLLM="Risposta LLM 1", 
                                   score=0.9, 
                                   metriche={
                                       "BLEU": 0.8, 
                                       "TER": 0.7
                                       })
    
@pytest.fixture
def RisultatoSingolaDomanda2():
    return RisultatoSingolaDomanda(id=2, 
                                   domanda="Domanda 2", 
                                   risposta="Risposta 2", 
                                   rispostaLLM="Risposta LLM 2", 
                                   score=0.8, 
                                   metriche={
                                       "BLEU": 0.75, 
                                       "TER": 0.65
                                       })
    
@pytest.fixture
def RisultatoTest1(RisultatoSingolaDomanda1, RisultatoSingolaDomanda2):
    return RisultatoTest(id=1,
                         score=0.85,
                         LLM="gpt-3",
                         dataEsecuzione="2025-03-31",
                         nomeSet=None,
                         risultatiDomande={RisultatoSingolaDomanda1, RisultatoSingolaDomanda2})

class TestRisultatoTestPersistenceMapper:
    @classmethod
    def setup_class(cls):
        cls.mockRisultatoSingolaDomandaPersistenceMapper = Mock(spec=RisultatoSingolaDomandaPersistenceMapper)
        cls.mapper = RisultatoTestPersistenceMapper(cls.mockRisultatoSingolaDomandaPersistenceMapper)
        
    def setup_method(self):
        self.mockRisultatoSingolaDomandaPersistenceMapper.reset_mock()

    def test_from_risultato_test_entity(self, RisultatoTest1, RisultatoSingolaDomanda1, RisultatoSingolaDomanda2):
        """Test per la creazione di un oggetto RisultatoTest a partire da un oggetto RisultatoTestEntity."""

        entity = RisultatoTestEntity(
            id=1,
            score=0.85,
            LLM="gpt-3",
            data="2025-03-31",
            risultatiDomande=[
                RisultatoSingolaDomandaEntity(id=10, 
                                                domanda="Domanda 1", 
                                                risposta="Risposta 1", 
                                                rispostaLLM="Risposta LLM 1", 
                                                score=0.9, 
                                                risultatiMetriche=[
                                                        RisultatoMetricaEntity(nomeMetrica="BLEU", score=0.8),
                                                        RisultatoMetricaEntity(nomeMetrica="TER", score=0.7)
                                                ]),
                RisultatoSingolaDomandaEntity(id=11,
                                                domanda="Domanda 2", 
                                                risposta="Risposta 2", 
                                                rispostaLLM="Risposta LLM 2", 
                                                score=0.8, 
                                                risultatiMetriche=[
                                                        RisultatoMetricaEntity(nomeMetrica="BLEU", score=0.75),
                                                        RisultatoMetricaEntity(nomeMetrica="TER", score=0.65)
                                                    ])
                
            ]
        )
        
        self.mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.side_effect = [RisultatoSingolaDomanda1, RisultatoSingolaDomanda2]
        
        risultato = self.mapper.fromRisultatoTestEntity(entity)
        
        assert risultato.getId() == RisultatoTest1.getId()
        assert risultato.getScore() == RisultatoTest1.getScore()
        assert risultato.getLLM() == RisultatoTest1.getLLM()
        assert risultato.getDataEsecuzione() == RisultatoTest1.getDataEsecuzione()
        assert risultato.getNomeSet() == RisultatoTest1.getNomeSet()
        assert risultato.getRisultatiDomande() == RisultatoTest1.getRisultatiDomande()
        assert len(risultato.getRisultatiDomande()) == 2
        assert RisultatoSingolaDomanda1 in risultato.getRisultatiDomande()
        assert RisultatoSingolaDomanda2 in risultato.getRisultatiDomande()
        self.mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(entity.risultatiDomande[0])
        self.mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(entity.risultatiDomande[1])

    def test_to_risultato_test_entity(self, RisultatoTest1):
        """Test per la creazione di un oggetto RisultatoTestEntity a partire da un oggetto RisultatoTest."""
        
        entity = RisultatoTestEntity(
            id=1,
            score=0.85,
            LLM="gpt-3",
            data="2025-03-31",
            risultatiDomande=[
                RisultatoSingolaDomandaEntity(id=10, 
                                                domanda="Domanda 1", 
                                                risposta="Risposta 1", 
                                                rispostaLLM="Risposta LLM 1", 
                                                score=0.9, 
                                                risultatiMetriche=[
                                                        RisultatoMetricaEntity(nomeMetrica="BLEU", score=0.8),
                                                        RisultatoMetricaEntity(nomeMetrica="TER", score=0.7)
                                                ]),
                RisultatoSingolaDomandaEntity(id=11,
                                                domanda="Domanda 2", 
                                                risposta="Risposta 2", 
                                                rispostaLLM="Risposta LLM 2", 
                                                score=0.8, 
                                                risultatiMetriche=[
                                                        RisultatoMetricaEntity(nomeMetrica="BLEU", score=0.75),
                                                        RisultatoMetricaEntity(nomeMetrica="TER", score=0.65)
                                                    ])
                
            ]
        )
        
        self.mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.side_effect = [entity.risultatiDomande[0], entity.risultatiDomande[1]]

        risultato = self.mapper.toRisultatoTestEntity(RisultatoTest1)

        assert risultato.score == entity.score
        assert risultato.LLM == entity.LLM
        assert risultato.data == entity.data
        assert risultato.nomeSet == entity.nomeSet
        assert len(risultato.risultatiDomande) == 2
        for res,exp in zip(risultato.risultatiDomande, entity.risultatiDomande):
            assert res.id == exp.id
            assert res.domanda == exp.domanda
            assert res.risposta == exp.risposta
            assert res.rispostaLLM == exp.rispostaLLM
            assert res.score == exp.score
            assert len(res.risultatiMetriche) == len(exp.risultatiMetriche)
            for metrica, metricaEntity in zip(res.risultatiMetriche, exp.risultatiMetriche):
                assert metrica.nomeMetrica == metricaEntity.nomeMetrica
                assert metrica.score == metricaEntity.score
        for res in RisultatoTest1.getRisultatiDomande():
            self.mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.assert_any_call(res)