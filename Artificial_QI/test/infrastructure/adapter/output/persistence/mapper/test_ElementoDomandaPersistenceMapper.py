import pytest
from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity
from src.infrastructure.adapter.output.persistence.mapper import ElementoDomandaPersistenceMapper
from src.domain import ElementoDomanda, Domanda, Risposta

class test_ElementoDomandaPersistenceMapper:
    
    @pytest.fixture
    def mapper(self):
        return ElementoDomandaPersistenceMapper()

    def test_FromElementoDomandaEntity(self, mapper):
        entity = ElementoDomandaEntity(id=1, domanda="Qual è la capitale d'Italia?", risposta="Roma")

        elemento = mapper.fromElementoDomandaEntity(entity)

        assert elemento.getId() == 1
        assert elemento.getDomanda().getText() == "Qual è la capitale d'Italia?"
        assert elemento.getRisposta().getText() == "Roma"

    def test_ToElementoDomandaEntity(self, mapper):
        domanda = Domanda("Qual è il tuo nome?")
        risposta = Risposta("Sono un modello linguistico.")
        elemento = ElementoDomanda(domanda=domanda, risposta=risposta)

        entity = mapper.toElementoDomandaEntity(elemento)

        assert entity.domanda == "Qual è il tuo nome?"
        assert entity.risposta == "Sono un modello linguistico."
        assert entity.id is None  # L'ID di una nuova entità è None prima del salvataggio

    def test_FromDomandaRisposta(self, mapper):
        domanda_text = "Quanto fa 2 + 2?"
        risposta_text = "4"

        entity = mapper.fromDomandaRisposta(domanda_text, risposta_text)

        assert entity.domanda == "Quanto fa 2 + 2?"
        assert entity.risposta == "4"
        assert entity.id is None  # L'ID di una nuova entità creata da domanda/risposta è None