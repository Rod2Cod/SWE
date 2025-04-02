import pytest
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter
from src.infrastructure.adapter.output.persistence.repository import ElementoDomandaPostgreSQLRepository
from src.infrastructure.adapter.output.persistence.mapper import ElementoDomandaPersistenceMapper
from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity
from unittest import mock
from src.domain import ElementoDomanda
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm.exc import NoResultFound

class TestElementoDomandaPersistenceAdapter:
    @classmethod
    def setup_class(cls):
        cls.mockRepository = mock.Mock(spec=ElementoDomandaPostgreSQLRepository)
        cls.mockMapper = mock.Mock(spec=ElementoDomandaPersistenceMapper)
        cls.adapter = ElementoDomandaPersistenceAdapter(cls.mockRepository, cls.mockMapper)

    def setup_method(self):
        self.mockRepository.reset_mock(side_effect=True)
        self.mockMapper.reset_mock(side_effect=True)
        
    # Save Elemento Domanda

    def test_save_elemento_domanda(self):
        """Test per il salvataggio di un elemento domanda."""
        
        domanda = "Domanda1"
        risposta = "Risposta1"
        self.mockMapper.fromDomandaRisposta.return_value = ElementoDomandaEntity(domanda=domanda, risposta=risposta)
        self.mockRepository.saveElementoDomanda.return_value = ElementoDomandaEntity(id=1, domanda=domanda, risposta=risposta)
        self.mockMapper.fromElementoDomandaEntity.return_value = ElementoDomanda(domanda=domanda, risposta=risposta, id=1)
        
        result = self.adapter.saveElementoDomanda(domanda, risposta)
        assert result == self.mockMapper.fromElementoDomandaEntity.return_value
    
    def test_save_elemento_domanda_db_error(self):
        """Test per il salvataggio di un elemento domanda con errore nel database."""
        
        self.mockMapper.fromElementoDomandaEntity.side_effect = SQLAlchemyError()
        result = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert result is None
    
    @pytest.mark.parametrize("error", [None, Exception()])
    def test_save_elemento_domanda_server_error(self, error):
        """Test per il salvataggio di un elemento domanda con errore nel server."""

        if error:
            self.mockMapper.fromElementoDomandaEntity.side_effect = error
        else:
            self.mockMapper.fromElementoDomandaEntity.return_value = error

        result = self.adapter.saveElementoDomanda("Domanda1", "Risposta1")
        assert result is None
        
    # Get Elemento Domanda

    def test_get_elemento_domanda_by_id(self):
        """Test per il recupero di un elemento domanda tramite ID."""

        self.mockMapper.fromElementoDomandaEntity.return_value = ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1)
        self.mockRepository.loadElementoDomandaById.return_value = ElementoDomandaEntity(id=1, domanda="Domanda1", risposta="Risposta1")

        result = self.adapter.getElementoDomandaById(1)
        assert result == self.mockMapper.fromElementoDomandaEntity.return_value
        
    def test_get_elemento_domanda_by_id_not_found(self):
        """Test per il recupero di un elemento domanda non trovato."""

        self.mockRepository.loadElementoDomandaById.side_effect = NoResultFound()
        with pytest.raises(ValueError):
            self.adapter.getElementoDomandaById(1)
        
    def test_get_elemento_domanda_by_id_db_error(self):
        """Test per il recupero di un elemento domanda con errore nel database."""

        self.mockRepository.loadElementoDomandaById.return_value = ElementoDomandaEntity(id=1, domanda="Domanda1", risposta="Risposta1")
        self.mockMapper.fromElementoDomandaEntity.side_effect = SQLAlchemyError()

        saved = self.adapter.getElementoDomandaById(1)
        assert saved is None

    def test_get_elemento_domanda_by_id_server_error(self):
        """Test per il recupero di un elemento domanda con errore nel server."""

        self.mockMapper.fromElementoDomandaEntity.side_effect = Exception()
        saved = self.adapter.getElementoDomandaById(1)
        assert saved is None
        
    # Get All Elementi Domanda

    def test_get_all_elementi_domanda(self):
        """Test per il recupero di tutti gli elementi domanda."""

        self.mockRepository.loadAllElementiDomanda.return_value = {ElementoDomandaEntity(id=1, domanda="Domanda1", risposta="Risposta1"),
                                                                   ElementoDomandaEntity(id=2, domanda="Domanda2", risposta="Risposta2")}
        elementi = {ElementoDomanda(domanda="Domanda1", risposta="Risposta1", id=1),
                    ElementoDomanda(domanda="Domanda2", risposta="Risposta2", id=2)}
        self.mockMapper.fromElementoDomandaEntity.side_effect = elementi
        result = self.adapter.getAllElementiDomanda()
        assert len(result) == 2
        assert result == elementi
        
    def test_get_all_elementi_domanda_db_error(self):
        """Test per il recupero di tutti gli elementi domanda con errore nel database."""

        self.mockRepository.loadAllElementiDomanda.side_effect = SQLAlchemyError()
        saved = self.adapter.getAllElementiDomanda()
        assert saved is None

    @pytest.mark.parametrize("error", [None, Exception()])
    def test_get_all_elementi_domanda_server_error(self, error):
        """Test per il recupero di tutti gli elementi domanda con errore nel server."""

        if error:
            self.mockRepository.loadAllElementiDomanda.side_effect = error
        else:
            self.mockRepository.loadAllElementiDomanda.return_value = error
        
        saved = self.adapter.getAllElementiDomanda()
        assert saved is None
        
    # Delete Elementi Domanda

    def test_delete_elementi_domanda_by_id_(self):
        """Test per la cancellazione di elementi domanda tramite ID."""

        ids = {1, 2, 3}
        self.mockRepository.deleteElementiDomanda.return_value = None

        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is True

    def test_delete_elementi_domanda_by_id_db_error(self):
        """Test per la cancellazione di elementi domanda con errore nel database."""

        ids = {1, 2, 3}
        self.mockRepository.deleteElementiDomanda.side_effect = SQLAlchemyError()

        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is False

    def test_delete_elementi_domanda_by_id_server_error(self):
        """Test per la cancellazione di elementi domanda con errore nel server."""
    
        ids = {1, 2, 3}
        self.mockRepository.deleteElementiDomanda.side_effect = Exception()

        result = self.adapter.deleteElementiDomandaById(ids)
        assert result is False
        
    # Update Elemento Domanda

    def test_update_elemento_domanda_by_id(self):
        """Test per l'aggiornamento di un elemento domanda tramite ID."""

        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        self.mockRepository.updateElementoDomanda.return_value = None

        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is True
        
    def test_update_elemento_domanda_by_id_not_found(self):
        """Test per l'aggiornamento di un elemento domanda non trovato."""

        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        self.mockRepository.updateElementoDomanda.side_effect = NoResultFound()

        with pytest.raises(ValueError):
            self.adapter.updateElementoDomandaById(id, domanda, risposta)
    
    def test_update_elemento_domanda_by_id_db_error(self):
        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        self.mockRepository.updateElementoDomanda.side_effect = SQLAlchemyError()
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is False

    def test_update_elemento_domanda_by_id_server_error(self):
        id = 1
        domanda = "Nuova Domanda"
        risposta = "Nuova Risposta"
        self.mockRepository.updateElementoDomanda.side_effect = Exception()
        result = self.adapter.updateElementoDomandaById(id, domanda, risposta)
        assert result is False