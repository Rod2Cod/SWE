import pytest
from unittest.mock import Mock
from src.infrastructure.adapter.output.persistence import RisultatoTestPersistenceAdapter
from src.domain import RisultatoTest, RisultatoSingolaDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class TestRisultatoTestPersistenceAdapter:

    @pytest.fixture
    def mockRepositoryTest(self):
        return Mock()

    @pytest.fixture
    def mockRepositorySingolaDomanda(self):
        return Mock()

    @pytest.fixture
    def mockMapperSingolaDomanda(self):
        return Mock()

    @pytest.fixture
    def mockMapperTest(self):
        return Mock()

    @pytest.fixture
    def adapter(self, mockRepositoryTest, mockRepositorySingolaDomanda, mockMapperSingolaDomanda, mockMapperTest):
        return RisultatoTestPersistenceAdapter(
            mockRepositoryTest, mockRepositorySingolaDomanda, mockMapperSingolaDomanda, mockMapperTest
        )
    @pytest.fixture
    def risultatoSingolaDomanda1(self):
        metriche1 = {"metrica 1": 8.5, "metrica 2": 9}
        return RisultatoSingolaDomanda(id=1, domanda="domanda 1", risposta="risposta 1", rispostaLLM = "rispostaLLM 1", score=8.2, metriche=metriche1)

    @pytest.fixture
    def risultatoSingolaDomanda1(self):
        metriche2 = {"metrica 1": 7.5, "metrica 2": 6, "metrica 3": 6}
        return RisultatoSingolaDomanda(id=2, domanda="domanda 2", risposta="risposta 2", rispostaLLM = "rispostaLLM 2", score=6.2, metriche=metriche2)

    @pytest.fixture
    def risultatoTest(self,RisultatoSingolaDomanda1,RisultatoSingolaDomanda2): 
        RDomande = {RisultatoSingolaDomanda1,RisultatoSingolaDomanda2}
        return RisultatoTest(id=1, score=7.8, LLM="nome LLM", dataEsecuzione="2025-03-31", nomeSet="All", risultatiDomande=RDomande )

    @pytest.fixture
    def risultatoTest2(self):
        metriche1 = {"metrica 1": 8.5, "metrica 2": 9}
        metriche2 = {"metrica 1": 7.5, "metrica 2": 6, "metrica 3": 6}
        RisultatoDomanda1 = RisultatoSingolaDomanda(id=1, domanda="domanda 1", risposta="risposta 1", rispostaLLM = "rispostaLLM 1", score=8.2, metriche=metriche1)
        RisultatoDomanda2 = RisultatoSingolaDomanda(id=2, domanda="domanda 2", risposta="risposta 2", rispostaLLM = "rispostaLLM 2", score=6.2, metriche=metriche2)
        RDomande = {RisultatoDomanda1,RisultatoDomanda2}
        return RisultatoTest(id=2, score=7.8, LLM="nome LLM", dataEsecuzione="2025-03-31", nomeSet="All", risultatiDomande=RDomande )

    @pytest.fixture
    def testId(self):
        return 1

    @pytest.fixture
    def singolaDomandaId(self):
        return 5

    def testSaveRisultatoTestSuccess(self, adapter, mockRepositoryTest, mockMapperTest, risultatoTest):
        mockEntityTest = Mock()
        mockMapperTest.toRisultatoTestEntity.return_value = mockEntityTest
        mockRepositoryTest.saveRisultatoTest.return_value = None  

        result = adapter.saveRisultatoTest(risultatoTest)

        mockMapperTest.toRisultatoTestEntity.assert_called_once_with(risultatoTest)
        mockRepositoryTest.saveRisultatoTest.assert_called_once_with(mockEntityTest)
        assert result is True

    def testSaveRisultatoTestDbError(self, adapter, mockRepositoryTest, mockMapperTest, risultatoTest):
        mockMapperTest.toRisultatoTestEntity.return_value = Mock()
        mockRepositoryTest.saveRisultatoTest.side_effect = SQLAlchemyError()

        result = adapter.saveRisultatoTest(risultatoTest)

        assert result is False

    def testSaveRisultatoTestGenericError(self, adapter, mockRepositoryTest, mockMapperTest, risultatoTest):
        mockMapperTest.toRisultatoTestEntity.return_value = Mock()
        mockRepositoryTest.saveRisultatoTest.side_effect = Exception("Errore generico")

        result = adapter.saveRisultatoTest(risultatoTest)

        assert result is False

    def testGetRisultatoTestByIdSuccess(self, adapter, mockRepositoryTest, mockMapperTest, risultatoTest, testId):
        mockEntityTest = Mock()
        expectedRisultatoTest = risultatoTest
        mockRepositoryTest.loadRisultatoTestById.return_value = mockEntityTest
        mockMapperTest.fromRisultatoTestEntity.return_value = expectedRisultatoTest

        result = adapter.getRisultatoTestById(testId)

        mockRepositoryTest.loadRisultatoTestById.assert_called_once_with(testId)
        mockMapperTest.fromRisultatoTestEntity.assert_called_once_with(mockEntityTest)
        assert result == expectedRisultatoTest

    def testGetRisultatoTestByIdNotFound(self, adapter, mockRepositoryTest, testId):
        mockRepositoryTest.loadRisultatoTestById.side_effect = NoResultFound()

        with pytest.raises(ValueError, match="Risultato non trovato."):
            adapter.getRisultatoTestById(testId)

        mockRepositoryTest.loadRisultatoTestById.assert_called_once_with(testId)

    def testGetRisultatoTestByIdDbError(self, adapter, mockRepositoryTest, testId):
        mockRepositoryTest.loadRisultatoTestById.side_effect = SQLAlchemyError()

        result = adapter.getRisultatoTestById(testId)

        assert result is False

    def testGetRisultatoTestByIdGenericError(self, adapter, mockRepositoryTest, testId):
        mockRepositoryTest.loadRisultatoTestById.side_effect = Exception("Errore generico")

        result = adapter.getRisultatoTestById(testId)

        assert result is False

    def testGetAllRisultatiTestSuccess(self, adapter, mockRepositoryTest, mockMapperTest, risultatoTest, risultatoTest2):
        mockEntityTest1 = Mock()
        mockEntityTest2 = Mock()
        mockRepositoryTest.loadAllRisultatiTest.return_value = [mockEntityTest1, mockEntityTest2]
        expectedRisultatoTest1 = risultatoTest
        expectedRisultatoTest2 = risultatoTest2
        mockMapperTest.fromRisultatoTestEntity.side_effect = [expectedRisultatoTest1, expectedRisultatoTest2]

        result = adapter.getAllRisultatiTest()

        mockRepositoryTest.loadAllRisultatiTest.assert_called_once()
        assert mockMapperTest.fromRisultatoTestEntity.call_count == 2
        assert expectedRisultatoTest1 in result
        assert expectedRisultatoTest2 in result
        assert isinstance(result, set)

    def testGetAllRisultatiTestSuccessEmpty(self, adapter, mockRepositoryTest, mockMapperTest):
        mockRepositoryTest.loadAllRisultatiTest.return_value = []

        result = adapter.getAllRisultatiTest()

        mockRepositoryTest.loadAllRisultatiTest.assert_called_once()
        mockMapperTest.fromRisultatoTestEntity.assert_not_called()
        assert isinstance(result, set)
        assert len(result) == 0

    def testGetAllRisultatiTestDbError(self, adapter, mockRepositoryTest):
        mockRepositoryTest.loadAllRisultatiTest.side_effect = SQLAlchemyError()

        result = adapter.getAllRisultatiTest()

        assert result is False

    def testGetAllRisultatiTestGenericError(self, adapter, mockRepositoryTest):
        mockRepositoryTest.loadAllRisultatiTest.side_effect = Exception("Errore generico")

        result = adapter.getAllRisultatiTest()

        assert result is False

    def testGetRisultatoSingolaDomandaTestByIdSuccess(self, adapter, mockRepositorySingolaDomanda, mockMapperSingolaDomanda, risultatoSingolaDomanda1, singolaDomandaId):
        mockEntitySingolaDomanda = Mock()
        expectedRisultatoSingolaDomanda = risultatoSingolaDomanda1
        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.return_value = mockEntitySingolaDomanda
        mockMapperSingolaDomanda.fromRisultatoSingolaDomandaEntity.return_value = expectedRisultatoSingolaDomanda

        result = adapter.getRisultatoSingolaDomandaTestById(singolaDomandaId)

        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(singolaDomandaId)
        mockMapperSingolaDomanda.fromRisultatoSingolaDomandaEntity.assert_called_once_with(mockEntitySingolaDomanda)
        assert result == expectedRisultatoSingolaDomanda

    def testGetRisultatoSingolaDomandaTestByIdNotFound(self, adapter, mockRepositorySingolaDomanda, singolaDomandaId):
        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = NoResultFound()

        with pytest.raises(ValueError, match="Risultato non trovato."):
            adapter.getRisultatoSingolaDomandaTestById(singolaDomandaId)

        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.assert_called_once_with(singolaDomandaId)

    def testGetRisultatoSingolaDomandaTestByIdDbError(self, adapter, mockRepositorySingolaDomanda, singolaDomandaId):
        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = SQLAlchemyError()

        result = adapter.getRisultatoSingolaDomandaTestById(singolaDomandaId)

        assert result is False

    def testGetRisultatoSingolaDomandaTestByIdGenericError(self, adapter, mockRepositorySingolaDomanda, singolaDomandaId):
        mockRepositorySingolaDomanda.loadRisultatoSingolaDomandaTestById.side_effect = Exception("Errore generico")

        result = adapter.getRisultatoSingolaDomandaTestById(singolaDomandaId)

        assert result is False