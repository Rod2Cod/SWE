import pytest
from src.domain import RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoSingolaDomandaEntity, MetricheEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoSingolaDomandaPersistenceMapper

class TestRisultatoSingolaDomandaPersistenceMapper:

    def test_FromRisultatoSingolaDomandaEntity(self):
        metricheEntity = [
            MetricheEntity(nomeMetrica="bert", score=0.9),
            MetricheEntity(nomeMetrica="roberta", score=0.85)
        ]
        entity = RisultatoSingolaDomandaEntity(
            id=1,
            domanda="Domanda di test",
            risposta="Risposta attesa",
            rispostaLLM="Risposta LLM",
            score=0.95,
            risultatiMetriche=metricheEntity
        )
        mapper = RisultatoSingolaDomandaPersistenceMapper()

        risultato = mapper.fromRisultatoSingolaDomandaEntity(entity)

        assert risultato.getId() == 1
        assert risultato.getDomanda() == "Domanda di test"
        assert risultato.getRisposta() == "Risposta attesa"
        assert risultato.getRispostaLLM() == "Risposta LLM"
        assert risultato.getScore() == 0.95
        assert risultato.getMetriche() == {"bert": 0.9, "roberta": 0.85}

    def test_ToRisultatoSingolaDomandaEntity(self):
        metriche = {"bert": 0.92, "roberta": 0.88}
        risultato = RisultatoSingolaDomanda(
            id=2,
            domanda="Altra domanda",
            risposta="Altra risposta utente",
            rispostaLLM="Altra risposta LLM",
            score=0.8,
            metriche=metriche
        )
        mapper = RisultatoSingolaDomandaPersistenceMapper()

        entity = mapper.toRisultatoSingolaDomandaEntity(risultato)

        assert entity.domanda == "Altra domanda"
        assert entity.risposta == "Altra risposta utente"
        assert entity.rispostaLLM == "Altra risposta LLM"
        assert entity.score == 0.8
        assert len(entity.risultatiMetriche) == 2
        metriche_entity_dict = {m.nomeMetrica: m.score for m in entity.risultatiMetriche}
        assert metriche_entity_dict == {"bert": 0.92, "roberta": 0.88}

    def test_FromRisultatoSingolaDomandaEntityWithEmptyMetrics(self):
        entity = RisultatoSingolaDomandaEntity(
            id=3,
            domanda="Domanda senza metriche",
            risposta="Risposta",
            rispostaLLM="LLM",
            score=0.75,
            risultatiMetriche=[]
        )
        mapper = RisultatoSingolaDomandaPersistenceMapper()

        risultato = mapper.fromRisultatoSingolaDomandaEntity(entity)

        assert risultato.getMetriche() == {}

    def test_ToRisultatoSingolaDomandaEntityWithEmptyMetrics(self):
        risultato = RisultatoSingolaDomanda(
            id=4,
            domanda="Domanda senza metriche nel dominio",
            risposta="Risposta",
            rispostaLLM="LLM",
            score=0.6,
            metriche={}
        )
        mapper = RisultatoSingolaDomandaPersistenceMapper()

        entity = mapper.toRisultatoSingolaDomandaEntity(risultato)

        assert entity.risultatiMetriche == []