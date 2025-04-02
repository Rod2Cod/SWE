import pytest
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter
from unittest.mock import Mock
from src.domain import ElementoDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class TestElementoDomandaPersistenceAdapter:
    @classmethod
    def setup_class(cls):
        cls.mockRepository = Mock()
        cls.mockMapper = Mock()
        cls.adapter = ElementoDomandaPersistenceAdapter(cls.mockRepository, cls.mockMapper)

    def setup_method(self):
        self.mockMapper.fromElementoDomandaEntity.return_value = ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1)
        self.mockMapper.fromDomandaRisposta.return_value = ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1)

        self.mockRepository.loadElementoDomandaById.return_value = ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1)
        self.mockRepository.saveElementoDomanda.return_value = ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1)

    def teardown_method(self):
        self.mockRepository.reset_mock(side_effect=True, return_value=True)
        self.mockMapper.reset_mock(side_effect=True, return_value=True)

    def test_SaveElementoDomandaReturnType(self):
        saved = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert type(saved) == ElementoDomanda
    
    def test_SaveElementoDomandaReturnValue(self):
        saved = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert saved.serialize() == {
            "id": 1,
            "domanda": "Domanda1",
            "risposta": "Risposta1"
        }
    
    def test_SaveElementoDomandaException(self):
        self.mockMapper.fromElementoDomandaEntity.side_effect = SQLAlchemyError()
        saved = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert saved is None
        
        self.mockMapper.fromElementoDomandaEntity.side_effect = Exception()
        saved = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert saved is None

    def test_GetElementoDomandaByIdReturnType(self):
        saved = self.adapter.getElementoDomandaById(1)
        assert type(saved) == ElementoDomanda

    def test_GetElementoDomandaByIdValue(self):
        saved = self.adapter.getElementoDomandaById(1)
        assert saved.serialize() == {
            "id": 1,
            "domanda": "Domanda1",
            "risposta": "Risposta1"
        }
        
    def test_GetElementoDomandaByIdException(self):
        self.mockMapper.fromElementoDomandaEntity.side_effect = SQLAlchemyError()
        saved = self.adapter.getElementoDomandaById(1)
        assert saved is None

        self.mockMapper.fromElementoDomandaEntity.side_effect = Exception()
        saved = self.adapter.getElementoDomandaById(1)
        assert saved is None

    def test_GetAllElementiDomandaReturnType(self):
        self.mockRepository.loadAllElementiDomanda.return_value = [1,2]
        saved = self.adapter.getAllElementiDomanda()
        assert type(saved) == set

    def test_GetAllElementiDomandaReturnValue(self):

        def differentElementoDomanda(i: int) -> ElementoDomanda:
            return ElementoDomanda(domanda=f"Domanda{i}", risposta=f"Risposta{i}", id=i)
        self.mockMapper.fromElementoDomandaEntity.side_effect = differentElementoDomanda

        self.mockRepository.loadAllElementiDomanda.return_value = [1,2]
        saved = self.adapter.getAllElementiDomanda()
        
        assert len(saved) == 2
        ser = [i.serialize() for i in saved]
        assert ser.sort(key=lambda x: x["id"]) == [
            {"id": 1, "domanda": "Domanda1", "risposta": "Risposta1"},
            {"id": 2, "domanda": "Domanda2", "risposta": "Risposta2"}
        ].sort(key=lambda x: x["id"])
        
    def test_GetAllElementiDomandaException(self):
        self.mockRepository.loadAllElementiDomanda.side_effect = SQLAlchemyError()
        saved = self.adapter.getAllElementiDomanda()
        assert saved is None

        self.mockRepository.loadAllElementiDomanda.side_effect = Exception()
        saved = self.adapter.getAllElementiDomanda()
        assert saved is None

    def test_DeleteElementiDomandaByIdReturnType(self):
        ids = {1, 2, 3}
        result = self.adapter.deleteElementiDomandaById(ids)
        assert type(result) == bool

    def test_DeleteElementiDomandaByIdReturnValue(self):
        ids = {1, 2, 3}
        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is True

    def test_DeleteElementiDomandaByIdException(self):
        ids = {1, 2, 3}
        self.mockRepository.deleteElementiDomanda.side_effect = SQLAlchemyError()
        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is False

        self.mockRepository.deleteElementiDomanda.side_effect = Exception()
        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is False

    def test_UpdateElementoDomandaByIdReturnType(self):
        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert type(result) == bool

    def test_UpdateElementoDomandaByIdReturnValue(self):
        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is True
    
    def test_UpdateElementoDomandaByIdException(self):
        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        self.mockRepository.updateElementoDomanda.side_effect = SQLAlchemyError()
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is False

        self.mockRepository.updateElementoDomanda.side_effect = Exception()
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is False