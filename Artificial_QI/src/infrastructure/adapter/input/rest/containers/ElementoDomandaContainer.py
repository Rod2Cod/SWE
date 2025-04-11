from dependency_injector import containers, providers
from src.application import AddElementoDomandaService, GetElementoDomandaService, GetAllElementiDomandaService, DeleteElementiDomandaService, UpdateElementoDomandaService
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter
from src.infrastructure.adapter.output.persistence.repository import ElementoDomandaPostgreSQLRepository
from src.infrastructure.adapter.output.persistence.mapper import ElementoDomandaPersistenceMapper


class ElementoDomandaContainer(containers.DeclarativeContainer):
    
    """
    Definisco il wiring (a quali moduli dovrò fornire le dipendenze).
    Se scrivo questo quando istanzio il container (container = Containers()), 
    esso chiamerà automaticamente in application container.wire con la configurazione che ho definito qua
    """
    #wiring_config = containers.WiringConfiguration(modules=["src.infrastructure.adapter.input.rest.ElementoDomandaControllers"])
    
    """ Qui indico che mi deve arrivare una dipendenza db, che sarà fornita dall'esterno, in questo caso dal container principale """
    db = providers.Dependency()
    
    # Repository
    ElementoDomandaRepository = providers.Factory(ElementoDomandaPostgreSQLRepository, db=db)
    
    # Mapper
    ElementoDomandaPersistenceMapper = providers.Factory(ElementoDomandaPersistenceMapper)
    
    # Adapter
    ElementoDomandaAdapter = providers.Factory(ElementoDomandaPersistenceAdapter, repository=ElementoDomandaRepository, mapper=ElementoDomandaPersistenceMapper)
    
    # Services
    AddElementoDomandaService = providers.Factory(AddElementoDomandaService, port=ElementoDomandaAdapter)
    GetElementoDomandaService = providers.Factory(GetElementoDomandaService, port=ElementoDomandaAdapter)
    GetAllElementiDomandaService = providers.Factory(GetAllElementiDomandaService, port=ElementoDomandaAdapter)
    DeleteElementiDomandaService = providers.Factory(DeleteElementiDomandaService, port=ElementoDomandaAdapter)
    UpdateElementoDomandaService = providers.Factory(UpdateElementoDomandaService, port=ElementoDomandaAdapter)