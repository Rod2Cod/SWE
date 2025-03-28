import src.application.ElementoDomandaServices as eds
import pytest
from unittest.mock import Mock

@pytest.mark.parametrize("domanda, risposta", [("domanda", False), (True, "risposta"), (True,False), ("", "risposta"), ("domanda", "")])
def test_invalidValidateDomandaRisposta(domanda,risposta):
    with pytest.raises(ValueError):
        eds.validateDomandaRisposta(domanda, risposta)

def test_validValidateDomandaRisposta():
    eds.validateDomandaRisposta("domanda", "risposta")
    assert True


def test_validateId():
    with pytest.raises(ValueError):
        eds.validateId("id")

    eds.validateId(1)
    assert True

@pytest.mark.parametrize("ids", [set([1,"2",3]), set([1,2,"3"]), set(["1",2,3]),set()])
def test_invalidValidateIdSet(ids):
    with pytest.raises(ValueError):
        eds.validateIdSet(ids)

def test_validValidateIdSet():
    eds.validateIdSet(set([1,2,3]))
    assert True

class Test_AddElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.port = Mock()
        cls.service = eds.AddElementoDomandaService(cls.port)
    
    def setup_method(self):
        self.port.reset_mock()

    def test_addElementoDomanda(self):
        self.service.addElementoDomanda("domanda", "risposta")
        self.port.saveElementoDomanda.assert_called_once_with("domanda", "risposta")
        pass


class Test_GetElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.port = Mock()
        cls.service = eds.GetElementoDomandaService(cls.port)
    
    def setup_method(self):
        self.port.reset_mock()
    
    def test_getElementoDomandaById(self):
        self.service.getElementoDomandaById(1)
        self.port.getElementoDomandaById.assert_called_once_with(1)

class Test_GetAllElementiDomandaService:
    @classmethod
    def setup_class(cls):
        cls.port = Mock()
        cls.service = eds.GetAllElementiDomandaService(cls.port)
    
    def setup_method(self):
        self.port.reset_mock()
    
    def test_getAllElementiDomanda(self):
        self.service.getAllElementiDomanda()
        self.port.getAllElementiDomanda.assert_called_once()

class Test_DeleteElementiDomandaService:
    @classmethod
    def setup_class(cls):
        cls.port = Mock()
        cls.service = eds.DeleteElementiDomandaService(cls.port)

    def setup_method(self):
        self.port.reset_mock()
    
    def test_deleteElementiDomandaById(self):
        self.service.deleteElementiDomandaById(set([1,2,3]))
        self.port.deleteElementiDomandaById.assert_called_once_with(set([1,2,3]))

class Test_UpdateElementoDomandaService:
    @classmethod
    def setup_class(cls):
        cls.port = Mock()
        cls.service = eds.UpdateElementoDomandaService(cls.port)
    def test_updateElementoDomandaById(self):
        self.service.updateElementoDomandaById(1, "domanda", "risposta")
        self.port.updateElementoDomandaById.assert_called_once_with(1, "domanda", "risposta")