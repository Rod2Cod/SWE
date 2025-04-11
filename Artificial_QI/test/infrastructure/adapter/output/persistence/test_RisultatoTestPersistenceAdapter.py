import pytest
from unittest import mock
from src.infrastructure.adapter.output.persistence import RisultatoTestPersistenceAdapter
from src.infrastructure.adapter.output.persistence.repository import RisultatoTestPostgreSQLRepository, RisultatoSingolaDomandaPostgreSQLRepository
from src.infrastructure.adapter.output.persistence.mapper import RisultatoTestPersistenceMapper, RisultatoSingolaDomandaPersistenceMapper
from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity, RisultatoSingolaDomandaEntity, RisultatoMetricaEntity
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

@pytest.fixture
def RisultatoSingolaDomanda1():
    return RisultatoSingolaDomanda(id=1, 
                                   domanda="domanda 1", 
                                   risposta="risposta 1", 
                                   rispostaLLM = "rispostaLLM 1", 
                                   score=7.3, 
                                   metriche=[
                                        {"nomeMetrica": "metrica 1", "score": 7.5},
                                        {"nomeMetrica": "metrica 2", "score": 6},
                                        {"nomeMetrica": "metrica 3", "score": 6}])

@pytest.fixture
def risultatoTest1():
    return RisultatoTest(id=1, score=7.8, LLM="LLM1", dataEsecuzione="2025-03-31", nomeSet=None, risultatiDomande={})

@pytest.fixture
def risultatoTest2():
    return RisultatoTest(id=2, score=9.2, LLM="LLM2", dataEsecuzione="2025-04-31", nomeSet=None, risultatiDomande={})

class TestRisultatoTestPersistenceAdapter:
    @classmethod
    def setup_class(cls):
        cls.mockRepositoryTest = mock.Mock(spec=RisultatoTestPostgreSQLRepository)
        cls.mockRepositorySingolaDomanda = mock.Mock(spec=RisultatoSingolaDomandaPostgreSQLRepository)
        cls.mockMapperTest = mock.Mock(spec=RisultatoTestPersistenceMapper)
        cls.mockMapperSingolaDomanda = mock.Mock(spec=RisultatoSingolaDomandaPersistenceMapper)
        cls.adapter = RisultatoTestPersistenceAdapter(
            cls.mockRepositoryTest, cls.mockRepositorySingolaDomanda, cls.mockMapperSingolaDomanda, cls.mockMapperTest
        )
        
    def setup_method(self):
        self.mockRepositoryTest.reset_mock(side_effect=True)
        self.mockRepositorySingolaDomanda.reset_mock(side_effect=True)
        self.mockMapperTest.reset_mock(side_effect=True)
        self.mockMapperSingolaDomanda.reset_mock(side_effect=True)
        
    # Save Risultato Test

    def test_save_risultato_test(self, risultatoTest1):
        """Test per il salvataggio di un risultato test."""

        entityIn = RisultatoTestEntity(score=7.8, LLM="nome LLM", data="2025-03-31", risultatiDomande=[])
        entityOut = RisultatoTestEntity(id=1, score=7.8, LLM="nome LLM", data="2025-03-31", nomeSet=None, risultatiDomande=[])
        self.mockMapperTest.toRisultatoTestEntity.return_value = entityIn
        self.mockRepositoryTest.saveRisultatoTest.return_value = entityOut
        self.mockMapperTest.fromRisultatoTestEntity.return_value = risultatoTest1

        result = self.adapter.saveRisultatoTest(risultatoTest1)

        assert result == risultatoTest1
        self.mockMapperTest.toRisultatoTestEntity.assert_called_once_with(risultatoTest1)
        self.mockRepositoryTest.saveRisultatoTest.assert_called_once_with(entityIn)
        self.mockMapperTest.fromRisultatoTestEntity.assert_called_once_with(entityOut)

    def test_save_risultato_test_db_error(self, risultatoTest1):
        """Test per il salvataggio di un risultato test in presenza di un errore nel database."""

        entityIn = RisultatoTestEntity(score=7.8, LLM="nome LLM", data="2025-03-31", risultatiDomande=[])
        self.mockMapperTest.toRisultatoTestEntity.return_value = entityIn
        self.mockRepositoryTest.saveRisultatoTest.side_effect = SQLAlchemyError()

        result = self.adapter.saveRisultatoTest(risultatoTest1)

        assert result is None

    def test_save_risultato_test_server_error(self, risultatoTest1):
        """Test per il salvataggio di un risultato test in presenza di un errore nel server."""

        entityIn = RisultatoTestEntity(score=7.8, LLM="nome LLM", data="2025-03-31", risultatiDomande=[])
        self.mockMapperTest.toRisultatoTestEntity.return_value = entityIn
        self.mockRepositoryTest.saveRisultatoTest.side_effect = Exception()

        result = self.adapter.saveRisultatoTest(risultatoTest1)

        assert result is None
        
    # Get Risultato Test

    def test_get_risultato_test_by_id(self, risultatoTest1):
        """Test per il recupero di un risultato test tramite ID.""" 
        
        entityIn = RisultatoTestEntity(id=1, score=7.8, LLM="nome LLM", data="2025-03-31", risultatiDomande=[])
        self.mockRepositoryTest.loadRisultatoTestById.return_value = entityIn
        self.mockMapperTest.fromRisultatoTestEntity.return_value = risultatoTest1

        id = 1
        result = self.adapter.getRisultatoTestById(id)

        assert result == risultatoTest1
        self.mockRepositoryTest.loadRisultatoTestById.assert_called_once_with(id)
        self.mockMapperTest.fromRisultatoTestEntity.assert_called_once_with(entityIn)

    def test_get_risultato_test_by_id_not_found(self):
        """Test per il recupero di un risultato test non trovato."""
        
        self.mockRepositoryTest.loadRisultatoTestById.side_effect = NoResultFound()

        id = 1
        with pytest.raises(ValueError):
            self.adapter.getRisultatoTestById(id)

        self.mockRepositoryTest.loadRisultatoTestById.assert_called_once_with(id)

    def test_get_risultato_test_by_id_db_error(self):
        """Test per il recupero di un risultato test in presenza di un errore nel database."""

        self.mockRepositoryTest.loadRisultatoTestById.side_effect = SQLAlchemyError()

        id = 1
        result = self.adapter.getRisultatoTestById(id)

        assert result is None

    def test_get_risultato_test_by_id_server_error(self):
        """Test per il recupero di un risultato test in presenza di un errore nel server."""

        self.mockRepositoryTest.loadRisultatoTestById.side_effect = Exception()

        id = 1
        result = self.adapter.getRisultatoTestById(id)

        assert result is None
        
    # Get All Risultati Test

    def test_get_all_risultati_test(self, risultatoTest1, risultatoTest2):
        """Test per il recupero di tutti i risultati test."""

        entityIn1 = RisultatoTestEntity(id=1, score=7.8, LLM="nome LLM", data="2025-03-31", risultatiDomande=[])
        entityIn2 = RisultatoTestEntity(id=2, score=9.2, LLM="nome LLM", data="2025-04-31", risultatiDomande=[])
        self.mockRepositoryTest.loadAllRisultatiTest.return_value = [entityIn1, entityIn2]
        self.mockMapperTest.fromRisultatoTestEntity.side_effect = [risultatoTest1, risultatoTest2]

        result = self.adapter.getAllRisultatiTest()
        
        assert result == {risultatoTest1, risultatoTest2}
        self.mockRepositoryTest.loadAllRisultatiTest.assert_called_once()
        self.mockMapperTest.fromRisultatoTestEntity.assert_any_call(entityIn1)
        self.mockMapperTest.fromRisultatoTestEntity.assert_any_call(entityIn2)
        assert len(result) == 2

    def test_get_all_risultati_test_empty(self):
        """Test per il recupero di tutti i risultati test vuoti."""
        
        self.mockRepositoryTest.loadAllRisultatiTest.return_value = {}

        result = self.adapter.getAllRisultatiTest()

        self.mockRepositoryTest.loadAllRisultatiTest.assert_called_once()
        self.mockMapperTest.fromRisultatoTestEntity.assert_not_called()
        assert len(result) == 0

    def test_get_all_risultati_test_db_error(self):
        """"Test per il recupero di tutti i risultati test in presenza di un errore nel database."""
            
        self.mockRepositoryTest.loadAllRisultatiTest.side_effect = SQLAlchemyError()

        result = self.adapter.getAllRisultatiTest()

        assert result is None

    def test_get_all_risultati_test_server_error(self):
        """Test per il recupero di tutti i risultati test in presenza di un errore nel server."""

        self.mockRepositoryTest.loadAllRisultatiTest.side_effect = Exception()

        result = self.adapter.getAllRisultatiTest()

        assert result is None
        
    # Get Risultato Singola Domanda Test

    def test_get_risultato_singola_domanda_test_by_id(self, RisultatoSingolaDomanda1):
        """Test per il recupero di un risultato singola domanda test tramite ID."""
        
        entityIn = RisultatoSingolaDomandaEntity(id=1, 
                                                 domanda="domanda 1", 
                                                 risposta="risposta 1", 
                                                 rispostaLLM = "rispostaLLM 1", 
                                                 score=7.3, 
                                                 risultatiMetriche=[
                                                        RisultatoMetricaEntity(nomeMetrica="metrica 1", score=7.5),
                                                        RisultatoMetricaEntity(nomeMetrica="metrica 2", score=6), 
                                                        RisultatoMetricaEntity(nomeMetrica="metrica 3", score=6)])
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.return_value = entityIn
        self.mockMapperSingolaDomanda.fromRisultatoSingolaDomandaEntity.return_value = RisultatoSingolaDomanda1

        id = 1
        result = self.adapter.getRisultatoSingolaDomandaTestById(id)

        assert result == RisultatoSingolaDomanda1
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(id)
        self.mockMapperSingolaDomanda.fromRisultatoSingolaDomandaEntity.assert_called_once_with(entityIn)

    def test_get_risultato_singola_domanda_test_by_id_not_found(self):
        """Test per il recupero di un risultato singola domanda test non trovato."""
        
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = NoResultFound()

        id = 1
        with pytest.raises(ValueError):
            self.adapter.getRisultatoSingolaDomandaTestById(id)

        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(id)

    def test_get_risultato_singola_domanda_test_by_id_db_error(self):
        """Test per il recupero di un risultato singola domanda test in presenza di un errore nel database."""
        
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = SQLAlchemyError()

        id = 1
        result = self.adapter.getRisultatoSingolaDomandaTestById(id)

        assert result is None
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(id)
        
    def test_get_risultato_singola_domanda_test_by_id_server_error(self):
        """Test per il recupero di un risultato singola domanda test in presenza di un errore nel server."""

        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = Exception()

        id = 1
        result = self.adapter.getRisultatoSingolaDomandaTestById(id)

        assert result is None
        self.mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(id)