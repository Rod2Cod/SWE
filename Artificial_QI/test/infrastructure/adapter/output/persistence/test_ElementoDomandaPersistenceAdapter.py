import pytest
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter
from unittest.mock import Mock
from src.domain import ElementoDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class TestElementoDomandaPersistenceAdapter:
    @pytest.fixture
    def mockRepository(self):
        return Mock()

    @pytest.fixture
    def mockMapper(self):
        return Mock()
    
    @pytest.fixture
    def adapter(self, mockRepository, mockMapper):
        return ElementoDomandaPersistenceAdapter(mockRepository, mockMapper)
    
    def test_SaveElementoDomandaSuccess(self, adapter, mockRepository, mockMapper):
        domanda = "Qual è la capitale della Francia?"
        risposta = "Parigi"
        mockEntity = Mock()
        mockSavedEntity = Mock()
        expectedElementoDomanda = ElementoDomanda(domanda=domanda, risposta=risposta, id=1)

        mockMapper.fromDomandaRisposta.return_value = mockEntity
        mockRepository.saveElementoDomanda.return_value = mockSavedEntity
        mockMapper.fromElementoDomandaEntity.return_value = expectedElementoDomanda

        result = adapter.saveElementoDomanda(domanda, risposta)

        mockMapper.fromDomandaRisposta.assert_called_once_with(domanda, risposta)
        mockRepository.saveElementoDomanda.assert_called_once_with(mockEntity)
        mockMapper.fromElementoDomandaEntity.assert_called_once_with(mockSavedEntity)
        assert result == expectedElementoDomanda

    def test_SaveElementoDomandaDbError(self, adapter, mockRepository):
        mockRepository.saveElementoDomanda.side_effect = SQLAlchemyError()
        result = adapter.saveElementoDomanda("Domanda", "Risposta")
        assert result is None

    def test_SaveElementoDomandaGenericError(self, adapter, mockRepository):
        mockRepository.saveElementoDomanda.side_effect = Exception("Errore generico")
        result = adapter.saveElementoDomanda("Domanda", "Risposta")
        assert result is None

    def test_GetElementoDomandaByIdSuccess(self, adapter, mockMapper, mockRepository):
        mockEntity = Mock()
        expectedElementoDomanda = ElementoDomanda( domanda="Qual è la capitale della Francia?", risposta="Parigi", id=1)
        
        mockRepository.loadElementoDomandaById.return_value = mockEntity
        mockMapper.fromElementoDomandaEntity.return_value = expectedElementoDomanda

        result = adapter.getElementoDomandaById(1)

        mockRepository.loadElementoDomandaById.assert_called_once_with(1)
        mockMapper.fromElementoDomandaEntity.assert_called_once_with(mockEntity)
        assert result == expectedElementoDomanda
    
    def test_GetElementoDomandaByIdNoResultFound(self, adapter, mockMapper, mockRepository):
        id = 1
        mockRepository.loadElementoDomandaById.side_effect = NoResultFound()

        with pytest.raises(ValueError, match="Elemento non trovato."):
            adapter.getElementoDomandaById(id)

        mockRepository.loadElementoDomandaById.assert_called_once_with(id)
        mockMapper.fromElementoDomandaEntity.assert_not_called()
    
    def test_GetElementoDomandaByIdDbError(self, adapter, mockMapper, mockRepository):
        elementoId = 1
        mockRepository.loadElementoDomandaById.side_effect = SQLAlchemyError()
        result = adapter.getElementoDomandaById(elementoId)
        
        mockRepository.loadElementoDomandaById.assert_called_once_with(elementoId)
        mockMapper.fromElementoDomandaEntity.assert_not_called()
        assert result is None
    
    def test_GetElementoDomandaByIdGenericError(self, adapter, mockMapper, mockRepository):
        elementoId = 1
        mockRepository.loadElementoDomandaById.side_effect = Exception("Errore generico")
        result = adapter.getElementoDomandaById(elementoId)
        
        mockRepository.loadElementoDomandaById.assert_called_once_with(elementoId)
        mockMapper.fromElementoDomandaEntity.assert_not_called()
        assert result is None
    
    def test_GetAllElementiDomandaSuccess(self, adapter, mockRepository, mockMapper):
        mockEntity1 = Mock(id=1, domanda="Domanda 1", risposta="Risposta 1")
        mockEntity2 = Mock(id=2, domanda="Domanda 2", risposta="Risposta 2")
        mockRepository.loadAllElementiDomanda.return_value = [mockEntity1, mockEntity2]
        expectedElemento1 = ElementoDomanda(id=1, domanda="Domanda 1", risposta="Risposta 1")
        expectedElemento2 = ElementoDomanda(id=2, domanda="Domanda 2", risposta="Risposta 2")
        mockMapper.fromElementoDomandaEntity.side_effect = [expectedElemento1, expectedElemento2]

        result = adapter.getAllElementiDomanda()

        mockRepository.loadAllElementiDomanda.assert_called_once()
        assert mockMapper.fromElementoDomandaEntity.call_count == 2
        assert expectedElemento1 in result
        assert expectedElemento2 in result
        assert isinstance(result, set)
    
    def test_GetAllElementiDomandaDbError(self, adapter, mockRepository):
        mockRepository.loadAllElementiDomanda.side_effect = SQLAlchemyError()
        result = adapter.getAllElementiDomanda()
        assert result is None
    
    def test_GetAllElementiDomandaGenericError(self, adapter, mockRepository):
        mockRepository.loadAllElementiDomanda.side_effect = Exception("Errore generico")
        result = adapter.getAllElementiDomanda()
        assert result is None
    
    def test_DeleteElementiDomandaByIdSuccess(self, adapter, mockRepository):
        idsToDelete = {1, 2, 3}
        mockRepository.deleteElementiDomanda.return_value = None
        result = adapter.deleteElementiDomandaById(idsToDelete)
        mockRepository.deleteElementiDomanda.assert_called_once_with(idsToDelete)
        assert result is True
    
    def test_DeleteElementiDomandaByIdDbError(self, adapter, mockRepository):
        idsToDelete = {1}
        mockRepository.deleteElementiDomanda.side_effect = SQLAlchemyError()
        result = adapter.deleteElementiDomandaById(idsToDelete)
        assert result is False
    
    def test_DeleteElementiDomandaByIdGenericError(self, adapter, mockRepository):
        idsToDelete = {1}
        mockRepository.deleteElementiDomanda.side_effect = Exception("Errore generico")
        result = adapter.deleteElementiDomandaById(idsToDelete)
        assert result is False

    def test_UpdateElementoDomandaByIdSuccess(self, adapter, mockRepository):
        elementoId = 1
        nuovaDomanda = "Nuova domanda"
        nuovaRisposta = "Nuova risposta"
        mockRepository.updateElementoDomanda.return_value = None
        result = adapter.updateElementoDomandaById(elementoId, nuovaDomanda, nuovaRisposta)
        mockRepository.updateElementoDomanda.assert_called_once_with(elementoId, nuovaDomanda, nuovaRisposta)
        assert result is True

    def test_UpdateElementoDomandaByIdNotFound(self, adapter, mockRepository):
        elementoId = 1
        nuovaDomanda = "Nuova domanda"
        nuovaRisposta = "Nuova risposta"
        mockRepository.updateElementoDomanda.side_effect = NoResultFound()
        with pytest.raises(ValueError, match="Elemento non trovato."):
            adapter.updateElementoDomandaById(elementoId, nuovaDomanda, nuovaRisposta)
        mockRepository.updateElementoDomanda.assert_called_once_with(elementoId, nuovaDomanda, nuovaRisposta)

    def test_UpdateElementoDomandaByIdDbError(self, adapter, mockRepository):
        elementoId = 1
        nuovaDomanda = "Nuova domanda"
        nuovaRisposta = "Nuova risposta"
        mockRepository.updateElementoDomanda.side_effect = SQLAlchemyError()
        result = adapter.updateElementoDomandaById(elementoId, nuovaDomanda, nuovaRisposta)
        mockRepository.updateElementoDomanda.assert_called_once_with(elementoId, nuovaDomanda, nuovaRisposta)
        assert result is False
    
    def test_UpdateElementoDomandaByIdGenericError(self, adapter, mockRepository):
        elementoId = 1
        nuovaDomanda = "Nuova domanda"
        nuovaRisposta = "Nuova risposta"
        mockRepository.updateElementoDomanda.side_effect = Exception("Errore generico")
        result = adapter.updateElementoDomandaById(elementoId, nuovaDomanda, nuovaRisposta)
        mockRepository.updateElementoDomanda.assert_called_once_with(elementoId, nuovaDomanda, nuovaRisposta)
        assert result is False
    