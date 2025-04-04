from dependency_injector import containers, providers
from src.application import ExecuteTestService
from src.infrastructure.adapter.output.persistence.repository import RisultatoTestPostgreSQLRepository, RisultatoSingolaDomandaPostgreSQLRepository, ElementoDomandaPostgreSQLRepository
from src.infrastructure.adapter.output.persistence.mapper import RisultatoSingolaDomandaPersistenceMapper, RisultatoTestPersistenceMapper, ElementoDomandaPersistenceMapper
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter, RisultatoTestPersistenceAdapter
from src.infrastructure.adapter.output.LLM.LLMAdapter import LLMAdapter
from src.application.evaluation.AlgoritmoValutazioneRisposteImpl import AlgoritmoValutazioneRisposteImpl
from src.application.evaluation.status.StatusTrackerImpl import TestStatusTrackerImpl
from src.application.evaluation.Scorer import Scorer
from pathlib import Path, Path

class ExecuteTestContainer(containers.DeclarativeContainer):
    
    """ Qui indico che mi deve arrivare una dipendenza db, che sarà fornita dall'esterno, in questo caso dal container principale """
    db = providers.Dependency()
    
    # Status Tracker
    TestStatusTracker = providers.Singleton(TestStatusTrackerImpl)
    
    # Repository
    ElementoDomandaRepository = providers.Factory(ElementoDomandaPostgreSQLRepository, db=db)
    RisultatoTestRepository = providers.Factory(RisultatoTestPostgreSQLRepository, db=db)
    RisultatoSingolaDomandaRepository = providers.Factory(RisultatoSingolaDomandaPostgreSQLRepository, db=db)
    
    # Mapper
    RisultatoSingolaDomandaPersistenceMapper = providers.Factory(RisultatoSingolaDomandaPersistenceMapper)
    RisultatoTestPersistenceMapper = providers.Factory(RisultatoTestPersistenceMapper, mapperRisultatoSingolaDomanda=RisultatoSingolaDomandaPersistenceMapper)
    ElementoDomandaPersistenceMapper = providers.Factory(ElementoDomandaPersistenceMapper)
    
    # Adapter
    ElementoDomandaAdapter = providers.Factory(ElementoDomandaPersistenceAdapter, repository=ElementoDomandaRepository, mapper=ElementoDomandaPersistenceMapper)
    RisultatoTestAdapter = providers.Factory(RisultatoTestPersistenceAdapter, repositoryTest=RisultatoTestRepository, repositorySingolaDomanda=RisultatoSingolaDomandaRepository, mapperSingolaDomanda=RisultatoSingolaDomandaPersistenceMapper, mapperTest=RisultatoTestPersistenceMapper)
    
    configpath = (Path(__file__).resolve().parents[6] / "config.ini").as_posix()
    
    config = providers.Configuration(ini_files=[str(configpath)])
    config.load()
    
    modelPath = Path(__file__).resolve().parents[6] / config.evaluator.model()
    
    # LLMs
    hermes3_Adapter = providers.Factory(
        LLMAdapter,
        url=config.llm.url,
        nome=config.llm.nome
    )
    
    # Evaluator 
    scorer = providers.Factory(
        Scorer
    )
    evaluator = providers.Factory(
        AlgoritmoValutazioneRisposteImpl,
        scorer=scorer,
        modelPath=modelPath
    )

    # Services
    ExecuteTestService = providers.Factory(
        ExecuteTestService,
        port=RisultatoTestAdapter,
        elementoDomandaAdapter=ElementoDomandaAdapter,
        evaluator=evaluator,
        llmAdapter=hermes3_Adapter,
        statusTracker=TestStatusTracker
    )