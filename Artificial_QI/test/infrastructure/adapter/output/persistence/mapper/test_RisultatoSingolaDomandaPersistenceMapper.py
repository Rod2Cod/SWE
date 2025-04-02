from src.domain import RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoSingolaDomandaEntity, RisultatoMetricaEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoSingolaDomandaPersistenceMapper

class TestRisultatoSingolaDomandaPersistenceMapper:
    @classmethod
    def setup_class(cls):
        cls.mapper = RisultatoSingolaDomandaPersistenceMapper()

    def test_from_risultato_singola_domanda_entity(self):
        """Test per la creazione di un oggetto RisultatoSingolaDomanda a partire da un oggetto RisultatoSingolaDomandaEntity."""

        entity = RisultatoSingolaDomandaEntity(
            id=1,
            domanda="Domanda",
            risposta="Risposta",
            rispostaLLM="Risposta LLM",
            score=0.95,
            risultatiMetriche=[
                RisultatoMetricaEntity(nomeMetrica="bert", score=0.9),
                RisultatoMetricaEntity(nomeMetrica="roberta", score=0.85)
            ]
        )

        risultato = self.mapper.fromRisultatoSingolaDomandaEntity(entity)

        assert risultato.getId() == 1
        assert risultato.getDomanda() == "Domanda"
        assert risultato.getRisposta() == "Risposta"
        assert risultato.getRispostaLLM() == "Risposta LLM"
        assert risultato.getScore() == 0.95
        assert risultato.getMetriche() == {"bert": 0.9, "roberta": 0.85}

    def test_to_risultato_singola_domanda_entity(self):
        """Test per la creazione di un oggetto RisultatoSingolaDomandaEntity a partire da un oggetto RisultatoSingolaDomanda."""

        risultato = RisultatoSingolaDomanda(
            id=2,
            domanda="Altra domanda",
            risposta="Altra risposta",
            rispostaLLM="Altra risposta LLM",
            score=0.8,
            metriche={
                "bert": 0.92,
                "roberta": 0.88
            }
        )

        entity = self.mapper.toRisultatoSingolaDomandaEntity(risultato)

        assert entity.domanda == "Altra domanda"
        assert entity.risposta == "Altra risposta"
        assert entity.rispostaLLM == "Altra risposta LLM"
        assert entity.score == 0.8
        assert len(entity.risultatiMetriche) == 2
        metriche_entity_dict = {m.nomeMetrica: m.score for m in entity.risultatiMetriche}
        assert metriche_entity_dict == {"bert": 0.92, "roberta": 0.88}