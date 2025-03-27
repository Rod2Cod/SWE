from dependency_injector import containers, providers
from src.application import GetRisultatoTestService, GetAllRisultatiTestService, GetAllRisultatiSingoleDomandeService, GetRisultatoSingolaDomandaService
from src.infrastructure.adapter.output.persistence import RisultatoTestPersistenceAdapter
from src.infrastructure.adapter.output.persistence.repository import RisultatoTestPostgreSQLRepository, RisultatoSingolaDomandaPostgreSQLRepository
from src.infrastructure.adapter.output.persistence.mapper import RisultatoTestPersistenceMapper, RisultatoSingolaDomandaPersistenceMapper


class RisultatoTestContainer(containers.DeclarativeContainer):
    
    """
    Definisco il wiring (a quali moduli dovrò fornire le dipendenze).
    Se scrivo questo quando istanzio il container (container = Containers()), 
    esso chiamerà automaticamente in application container.wire con la configurazione che ho definito qua
    """
    #wiring_config = containers.WiringConfiguration(modules=["src.infrastructure.adapter.input.rest.RisultatoTestControllers"])
    
    """ Qui indico che mi deve arrivare una dipendenza db, che sarà fornita dall'esterno, in questo caso dal container principale """
    db = providers.Dependency()
    
    # Repository
    RisultatoTestRepository = providers.Factory(RisultatoTestPostgreSQLRepository, db=db)
    RisultatoSingolaDomandaRepository = providers.Factory(RisultatoSingolaDomandaPostgreSQLRepository, db=db)
    
    # Mapper
    RisultatoSingolaDomandaPersistenceMapper = providers.Factory(RisultatoSingolaDomandaPersistenceMapper)
    RisultatoTestPersistenceMapper = providers.Factory(RisultatoTestPersistenceMapper, mapperRisultatoSingolaDomanda=RisultatoSingolaDomandaPersistenceMapper)
    
    # Adapter
    RisultatoTestAdapter = providers.Factory(RisultatoTestPersistenceAdapter, repositoryTest=RisultatoTestRepository, repositorySingolaDomanda=RisultatoSingolaDomandaRepository, mapperSingolaDomanda=RisultatoSingolaDomandaPersistenceMapper, mapperTest=RisultatoTestPersistenceMapper)
    
    # Services
    GetRisultatoTestService = providers.Factory(GetRisultatoTestService, port=RisultatoTestAdapter)
    GetAllRisultatiTestService = providers.Factory(GetAllRisultatiTestService, port=RisultatoTestAdapter)
    GetAllRisultatiSingoleDomandeService = providers.Factory(GetAllRisultatiSingoleDomandeService, port=RisultatoTestAdapter)
    GetRisultatoSingolaDomandaService = providers.Factory(GetRisultatoSingolaDomandaService, port=RisultatoTestAdapter)