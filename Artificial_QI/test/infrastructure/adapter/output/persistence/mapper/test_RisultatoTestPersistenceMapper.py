import pytest
from unittest.mock import Mock
from datetime import datetime
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity, RisultatoSingolaDomandaEntity, MetricheEntity
from src.infrastructure.adapter.output.persistence.mapper import RisultatoTestPersistenceMapper, RisultatoSingolaDomandaPersistenceMapper

class TestRisultatoTestPersistenceMapper:

    @pytest.fixture
    def mockRisultatoSingolaDomandaPersistenceMapper(self):
        return Mock()

    @pytest.fixture
    def RisultatoTestEntity(self):
        metriche1 = {"matrica1": 3.14}
        metriche2 = {"matrica2": 2.71}  

        risultatoDomanda1 = RisultatoSingolaDomandaEntity(
            id=1,
            domanda="domanda 1",  
            risposta="risposta 1",
            rispostaLLM="risposta LLM 1",
            score=0.8,
            risultatiMetriche=[MetricheEntity(nomeMetrica=nome, score=valore, risultatoDomandaId=1) for nome, valore in metriche1.items()],
        )
        risultatoDomanda2 = RisultatoSingolaDomandaEntity(
            id=2,
            domanda="domanda 2",  
            risposta="risposta 2",
            rispostaLLM="risposta LLM 2",
            score=0.9,  
            risultatiMetriche=[MetricheEntity(nomeMetrica=nome, score=valore, risultatoDomandaId=2) for nome, valore in metriche2.items()],
        )
        return RisultatoTestEntity(
            id=1,
            score=0.85,
            LLM="gpt-3",
            data="2025-03-31",  
            nomeSet="testSet",
            risultatiDomande=[
                risultatoDomanda1,
                risultatoDomanda2,
            ]
        )
    
    @pytest.fixture
    def EmptyRisultatoTestEntity(self):
        return RisultatoTestEntity(
            id=1,
            score=0.85,
            LLM="gpt-3",
            data="2025-03-31",  
            nomeSet="testSet",
            risultatiDomande=[]
        )

    @pytest.fixture
    def RisultatoTest(self):
        metriche = {"matrica1": 3.14, "matrica1": 2.71}
        risultatoDomanda1= RisultatoSingolaDomanda(id=1, domanda="doamnda", risposta="risposta", rispostaLLM=" risposta LLM", score = 0.8, metriche=metriche)
        risultatoDomanda2= RisultatoSingolaDomanda(id=2, domanda="doamnda", risposta="risposta", rispostaLLM=" risposta LLM", score = 0.8, metriche=metriche)
        risultatiDomande = {risultatoDomanda1,risultatoDomanda2}
        return RisultatoTest(id=1, LLM="gpt-3", score = 0.85, dataEsecuzione ="2025-03-31", nomeSet = "testSet", risultatiDomande=risultatiDomande)

    def test_fromRisultatoTestEntity(self, mockRisultatoSingolaDomandaPersistenceMapper, RisultatoTestEntity):
        metriche = {"matrica1": 3.14, "matrica1": 2.71}
        expectedRisultato1= RisultatoSingolaDomanda(id=1, domanda="doamnda", risposta="risposta", rispostaLLM=" risposta LLM", score = 0.8, metriche=metriche)
        expectedRisultato2= RisultatoSingolaDomanda(id=2, domanda="doamnda", risposta="risposta", rispostaLLM=" risposta LLM", score = 0.8, metriche=metriche)
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.side_effect = [expectedRisultato1, expectedRisultato2]
        mapper = RisultatoTestPersistenceMapper(mockRisultatoSingolaDomandaPersistenceMapper)
        risultato = mapper.fromRisultatoTestEntity(RisultatoTestEntity)
        assert risultato.getId() == 1
        assert risultato.getScore() == 0.85
        assert risultato.getLLM() == "gpt-3"
        assert risultato.getDataEsecuzione() == datetime.strptime("2025-03-31", "%Y-%m-%d").date()
        assert risultato.getNomeSet() == "testSet"
        assert len(risultato.getRisultatiDomande()) == 2
        assert expectedRisultato1 in risultato.getRisultatiDomande()
        assert expectedRisultato2 in risultato.getRisultatiDomande()
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(RisultatoTestEntity.risultatiDomande[0])
        mockRisultatoSingolaDomandaPersistenceMapper.fromRisultatoSingolaDomandaEntity.assert_any_call(RisultatoTestEntity.risultatiDomande[1])

    def test_toRisultatoTestEntity(self, RisultatoTest, RisultatoTestEntity):
        mapper = RisultatoTestPersistenceMapper(RisultatoSingolaDomandaPersistenceMapper())
        risTestEntity = mapper.toRisultatoTestEntity(RisultatoTest)
        assert risTestEntity.score == RisultatoTestEntity.score
        assert risTestEntity.LLM == RisultatoTestEntity.LLM
        assert risTestEntity.data == RisultatoTestEntity.data
        assert risTestEntity.nomeSet == RisultatoTestEntity.nomeSet
        assert len(risTestEntity.risultatiDomande) == len(RisultatoTestEntity.risultatiDoamnde)

    def test_fromRisultatoTestEntityWithEmptyRisultati(self, EmptyRisultatoTestEntity):
        singolaDomandaMapper =RisultatoSingolaDomandaPersistenceMapper()
        mapper = RisultatoTestPersistenceMapper(singolaDomandaMapper)
        risultato = mapper.fromRisultatoTestEntity(EmptyRisultatoTestEntity)
        assert len(risultato.getRisultatiDomande()) == 0
        singolaDomandaMapper.fromRisultatoSingolaDomandaEntity.assert_not_called()

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