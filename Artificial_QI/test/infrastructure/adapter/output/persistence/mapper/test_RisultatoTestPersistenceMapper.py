import pytest
from unittest.mock import Mock
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity, RisultatoSingolaDomandaEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoTestPersistenceMapper, RisultatoSingolaDomandaPersistenceMapper

class test_RisultatoTestPersistenceMapper:

    @pytest.fixture
    def mockRisultatoSingolaDomandaPersistenceMapper(self):
        return Mock(spec=RisultatoSingolaDomandaPersistenceMapper)

    def test_fromRisultatoTestEntity(self, mockRisultatoSingolaDomandaPersistenceMapper):
        entity = RisultatoTestEntity(
            id=1,
            score=0.85,
            LLM="gpt-3",
            data="2025-03-31",
            nomeSet="testSet",
            risultatiDomande=[
                Mock(spec=RisultatoSingolaDomandaEntity, id=10, domanda="Domanda 1"),
                Mock(spec=RisultatoSingolaDomandaEntity, id=11, domanda="Domanda 2"),
            ]
        )
        expectedRisultato1 = RisultatoSingolaDomanda(id=10, domanda="Domanda 1")
        expectedRisultato2 = RisultatoSingolaDomanda(id=11, domanda="Domanda 2")
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.side_effect = [expectedRisultato1, expectedRisultato2]
        mapper = RisultatoTestPersistenceMapper(mockRisultatoSingolaDomandaPersistenceMapper)
        risultato = mapper.fromRisultatoTestEntity(entity)
        assert risultato.getId() == 1
        assert risultato.getScore() == 0.85
        assert risultato.getLLM() == "gpt-3"
        assert risultato.getDataEsecuzione() == "2025-03-31"
        assert risultato.getNomeSet() == "testSet"
        assert len(risultato.getRisultatiDomande()) == 2
        assert expectedRisultato1 in risultato.getRisultatiDomande()
        assert expectedRisultato2 in risultato.getRisultatiDomande()
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(entity.risultatiDomande[0])
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(entity.risultatiDomande[1])

    def test_toRisultatoTestEntity(self, mockRisultatoSingolaDomandaPersistenceMapper):
        risultato = RisultatoTest(
            id=2,
            score=0.92,
            LLM="llama-2",
            dataEsecuzione="2025-04-01",
            nomeSet="altroSet",
            risultatiDomande={
                RisultatoSingolaDomanda(id=20, risposta="Risposta A"),
                RisultatoSingolaDomanda(id=21, risposta="Risposta B"),
            }
        )
        mockEntityRisultato1 = Mock(spec=RisultatoSingolaDomandaEntity, id=20, risposta="Risposta A Entity")
        mockEntityRisultato2 = Mock(spec=RisultatoSingolaDomandaEntity, id=21, risposta="Risposta B Entity")
        mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.side_effect = [mockEntityRisultato1, mockEntityRisultato2]
        mapper = RisultatoTestPersistenceMapper(mockRisultatoSingolaDomandaPersistenceMapper)
        entity = mapper.toRisultatoTestEntity(risultato)
        assert entity.score == 0.92
        assert entity.LLM == "llama-2"
        assert entity.data == "2025-04-01"
        assert entity.nomeSet == "altroSet"
        assert len(entity.risultatiDomande) == 2
        assert mockEntityRisultato1 in entity.risultatiDomande
        assert mockEntityRisultato2 in entity.risultatiDomande
        mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.assert_any_call(list(risultato.getRisultatiDomande())[0])
        mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.assert_any_call(list(risultato.getRisultatiDomande())[1])

    def test_fromRisultatoTestEntityWithEmptyRisultati(self, mockRisultatoSingolaDomandaPersistenceMapper):
        entity = RisultatoTestEntity(
            id=3,
            score=0.78,
            LLM="bert",
            data="2025-04-02",
            nomeSet="emptySet",
            risultatiDomande=[]
        )
        mapper = RisultatoTestPersistenceMapper(mockRisultatoSingolaDomandaPersistenceMapper)
        risultato = mapper.fromRisultatoTestEntity(entity)
        assert len(risultato.getRisultatiDomande()) == 0
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_not_called()

    def test_toRisultatoTestEntityWithEmptyRisultati(self, mockRisultatoSingolaDomandaPersistenceMapper):
        risultato = RisultatoTest(
            id=4,
            score=0.88,
            LLM="roberta",
            dataEsecuzione="2025-04-03",
            nomeSet="vuotoSet",
            risultatiDomande=set()
        )
        mapper = RisultatoTestPersistenceMapper(mockRisultatoSingolaDomandaPersistenceMapper)
        entity = mapper.toRisultatoTestEntity(risultato)
        assert len(entity.risultatiDomande) == 0
        mockRisultatoSingolaDomandaPersistenceMapper.toRisultatoSingolaDomandaEntity.assert_not_called()