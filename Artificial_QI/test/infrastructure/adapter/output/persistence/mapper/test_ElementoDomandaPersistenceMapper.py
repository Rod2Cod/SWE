import pytest
from unittest.mock import MagicMock
from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity
from src.infrastructure.adapter.output.persistence.mapper import ElementoDomandaPersistenceMapper
from src.domain import ElementoDomanda, Domanda, Risposta

class TestElementoDomandaPersistenceMapper:
    
    @pytest.fixture
    def mapper(self):
        return ElementoDomandaPersistenceMapper()
    
    @pytest.fixture
    def mockDomanda(self):
        mockDom = MagicMock()
        mockDom.getText.return_value = "Domanda"
        return mockDom
    
    @pytest.fixture
    def mockRisposta(self):
        mockRis = MagicMock()
        mockRis.getText.return_value = "Risposta"
        return mockRis
    

    def test_FromElementoDomandaEntity(self, mapper):
        elementoDomandaEntity = ElementoDomandaEntity(id=1, domanda="Qual è la capitale d'Italia?", risposta="Roma")

        elementoDomanda = mapper.fromElementoDomandaEntity(elementoDomandaEntity)

        assert elementoDomanda.getId() == 1
        assert elementoDomanda.getDomanda().getText() == "Qual è la capitale d'Italia?"
        assert elementoDomanda.getRisposta().getText() == "Roma"

    def test_ToElementoDomandaEntity(self, mapper):
        mockElementoDomanda = MagicMock()
        mockDomanda = MagicMock()
        mockRisposta = MagicMock()
        mockDomanda.getText.return_value = "Test domanda"
        mockRisposta.getText.return_value = "Test risposta"
        mockElementoDomanda.getDomanda.return_value = mockDomanda
        mockElementoDomanda.getRisposta.return_value = mockRisposta

        elementoDomandaEntity = mapper.toElementoDomandaEntity(mockElementoDomanda)

        assert elementoDomandaEntity.domanda == "Test domanda"
        assert elementoDomandaEntity.risposta == "Test risposta"
        assert elementoDomandaEntity.id is None  # L'ID di una nuova entità è None prima del salvataggio

    def test_FromDomandaRisposta(self, mapper):
        domanda_text = "Quanto fa 2 + 2?"
        risposta_text = "4"

        elementoDomandaEntity = mapper.fromDomandaRisposta(domanda_text, risposta_text)

        assert elementoDomandaEntity.domanda == "Quanto fa 2 + 2?"
        assert elementoDomandaEntity.risposta == "4"
        assert elementoDomandaEntity.id is None  # L'ID di una nuova entità creata da domanda/risposta è None