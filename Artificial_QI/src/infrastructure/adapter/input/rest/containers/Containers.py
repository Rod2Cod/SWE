from dependency_injector import containers, providers
from src.infrastructure.adapter.input.rest.containers.ElementoDomandaContainer import ElementoDomandaContainer
from src.infrastructure.adapter.input.rest.containers.RisultatoTestContainer import RisultatoTestContainer


class RootContainer(containers.DeclarativeContainer):
    
    """ Qui indico che mi deve arrivare una dipendenza db, che sarà fornita dall'esterno """
    db = providers.Dependency()
    
    wiring_config = containers.WiringConfiguration(modules=["src.infrastructure.adapter.input.rest.ElementoDomandaControllers",
                                                            "src.infrastructure.adapter.input.rest.RisultatoTestControllers"])
    
    elementoDomandaContainer = providers.Container(ElementoDomandaContainer, db=db)
    
    risultatoTestContainer = providers.Container(RisultatoTestContainer, db=db)