from dependency_injector import containers, providers
from src.application import ExecuteTestService, GetAllElementiDomandaService
from src.infrastructure.adapter.output.persistence import ElementoDomandaPersistenceAdapter, RisultatoTestPersistenceAdapter
from src.infrastructure.adapter.output.LLM import LLMAdapter
from src.application.evaluation.AlgoritmoValutazioneRisposteImpl import AlgoritmoValutazioneRisposteImpl

class ExecuteTestContainer(containers.DeclarativeContainer):

    executeTestService = providers.Factory(
        ExecuteTestService,
        llm=providers.Factory(LLMAdapter),
        valutatore=providers.Factory(LLMAdapter),
        save_port=providers.Singleton(RisultatoTestPersistenceAdapter),
        get_domande_port=providers.Singleton(GetAllElementiDomandaService)
    )