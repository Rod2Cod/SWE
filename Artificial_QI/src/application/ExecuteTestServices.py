from src.application.ports.input import ExecuteTestUseCase
from src.application.ports.output import LLMPort, SaveRisultatoTestPort, GetAllElementiDomandaPort
from src.application.evaluation.AlgoritmoValutazioneRisposte import AlgoritmoValutazioneRisposte
from src.domain import RisultatoTest, RisultatoSingolaDomanda
import datetime
import uuid         # utilizzato per generare un id univoco temporaneo per ogni domanda e test. Quello definitivo verrà generato dal database

class ExecuteTestService(ExecuteTestUseCase):
    def __init__(self, llm: LLMPort, valutatore: AlgoritmoValutazioneRisposte, save_port: SaveRisultatoTestPort, get_domande_port: GetAllElementiDomandaPort):
        self.__llm = llm
        self.__valutatore = valutatore
        self.__saveTestport = save_port
        self.__getElementiDomanda_port = get_domande_port

    def executeTest(self) -> RisultatoTest:
        # recupero tutte le domande
        elementiDomanda = self.__getElementiDomanda_port.getAllElementiDomanda()

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
        
        score_totale = sum(scores) / len(scores)

        risultato_test = RisultatoTest(uuid.uuid1().int>>64, score_totale, self.__llm.getName(), datetime.datetime.now(), None, risultati)
        return self.__saveTestport.saveRisultatoTest(risultato_test)