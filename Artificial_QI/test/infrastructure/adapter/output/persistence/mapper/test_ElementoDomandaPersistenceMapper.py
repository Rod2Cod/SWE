from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity
from src.infrastructure.adapter.output.persistence.mapper import ElementoDomandaPersistenceMapper
from src.domain import ElementoDomanda

class TestElementoDomandaPersistenceMapper:
    @classmethod
    def setup_class(cls):
        cls.mapper = ElementoDomandaPersistenceMapper()

    def test_from_elemento_domanda_entity(self):
        """Test per la creazione di un oggetto ElementoDomanda a partire da un oggetto ElementoDomandaEntity."""
        
        domanda = "Qual è la capitale d'Italia?"
        risposta = "Roma"
        id = 1
        
        entity = ElementoDomandaEntity(id=id, domanda=domanda, risposta=risposta)

        elemento = self.mapper.fromElementoDomandaEntity(entity)

        assert elemento.getId() == id
        assert elemento.getDomanda().getText() == domanda
        assert elemento.getRisposta().getText() == risposta

    def test_to_elemento_domanda_entity(self):
        """Test per la creazione di un oggetto ElementoDomandaEntity a partire da un oggetto ElementoDomanda."""
        
        domanda = "Qual è la capitale della Germania?"
        risposta = "Berlino"
        id = 999
        elemento = ElementoDomanda(id=id, domanda=domanda, risposta=risposta)

        entity = self.mapper.toElementoDomandaEntity(elemento)

        assert entity.domanda == domanda
        assert entity.risposta == risposta
        assert entity.id is None  # L'ID di una nuova entità è None prima del salvataggio

    def test_from_domanda_risposta(self):
        """Test per la creazione di un oggetto ElementoDomandaEntity a partire da una domanda e una risposta."""
        
        domanda_text = "Quanto fa 2 + 2?"
        risposta_text = "4"

        entity = self.mapper.fromDomandaRisposta(domanda_text, risposta_text)

        assert entity.domanda == domanda_text
        assert entity.risposta == risposta_text
        assert entity.id is None  # L'ID di una nuova entità creata da domanda/risposta è None