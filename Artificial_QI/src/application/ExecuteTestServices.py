from src.application.ports.input import ExecuteTestUseCase, GetTestStatusUseCase
from src.application.ports.output import LLMPort, SaveRisultatoTestPort, GetAllElementiDomandaPort
from src.application.evaluation.AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from src.application.evaluation.status.StatusTracker import TestStatusTracker
from src.domain import RisultatoTest, RisultatoSingolaDomanda
import datetime
import uuid         # utilizzato per generare un id univoco temporaneo per ogni domanda e test. Quello definitivo verrà generato dal database

class ExecuteTestService(ExecuteTestUseCase):
    def __init__(self, llm: LLMPort, valutatore: AlgoritmoValutazioneRisposte, save_port: SaveRisultatoTestPort, get_domande_port: GetAllElementiDomandaPort, status_tracker: TestStatusTracker):
        self.__status_tracker = status_tracker
        self.__llm = llm
        self.__valutatore = valutatore
        self.__saveTestport = save_port
        self.__getElementiDomanda_port = get_domande_port

    def executeTest(self) -> RisultatoTest:
        # recupero tutte le domande
        elementiDomanda = self.__getElementiDomanda_port.getAllElementiDomanda()

        self.__status_tracker.start_test(len(elementiDomanda))
        risultati = set()
        scores = []
        for elemento in elementiDomanda:
            domanda = elemento.getDomanda().getText()
            risposta = elemento.getRisposta().getText()
            risposta_llm = self.__llm.makeQuestion(domanda)
            metriche, score = self.__valutatore.evaluate(risposta, risposta_llm)
            score = float(score)
            metriche = {k: float(v) for k, v in metriche.items()}
            risultato = RisultatoSingolaDomanda(uuid.uuid1().int>>64, domanda, risposta, risposta_llm, score, metriche)
            risultati.add(risultato)
            scores.append(score)

            self.__status_tracker.update_progress()

        self.__status_tracker.finish_test()
        score_totale = sum(scores) / len(scores)

        risultato_test = RisultatoTest(uuid.uuid1().int>>64, score_totale, self.__llm.getName(), datetime.datetime.now(), None, risultati)
        return self.__saveTestport.saveRisultatoTest(risultato_test)
    
class GetTestStatusService(GetTestStatusUseCase):
    def __init__(self, status_tracker: TestStatusTracker):
        self.__status_tracker = status_tracker

    def getTestStatus(self) -> dict:
        return self.__status_tracker.get_status()