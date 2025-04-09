import sacrebleu
from rouge_score import rouge_scorer
from bert_score import BERTScorer
from sentence_transformers import CrossEncoder

"""Questa classe si occupa di calcolare i gli score da associare ad una singola domanda generata dal modello."""
 
class Scorer:
    def __init__(self):
        self.__bertScorer = BERTScorer(model_type="bert-base-uncased")
        self.__crossEncoder = CrossEncoder('cross-encoder/stsb-roberta-large')
        self.__rougeScorer = rouge_scorer.RougeScorer(['rouge1', 'rouge2', 'rougeL'], use_stemmer=True)
 
 
    def __lexical_score(self, ipotesi, riferimento): #BLEU - TER - CHRF
        bleu = sacrebleu.sentence_bleu(ipotesi, [riferimento]).score
        ter = sacrebleu.sentence_ter(ipotesi, [riferimento]).score
        chrf = sacrebleu.sentence_chrf(ipotesi, [riferimento]).score
       
        return bleu/100, ter/100, chrf/100
   
    def __ROUGE_score(self, ipotesi, riferimento): #ROUGE
        scores = self.__rougeScorer.score(riferimento, ipotesi)
        return scores['rougeL'].fmeasure
   
    def __BERT_score(self, ipotesi, riferimento): #BERTscore
        P, R, F1 = self.__bertScorer.score([ipotesi], [riferimento])
        return F1.item()
   
    def score(self,ipotesi : str,riferimento : str)-> dict :
        bleu, ter, chrf = self.__lexical_score(ipotesi, riferimento)
        rouge = self.__ROUGE_score(ipotesi, riferimento)
        bert = self.__BERT_score(ipotesi, riferimento)
        cross = float(self.__crossEncoder.predict([(ipotesi, riferimento)])[0])
 
        return {"BLEU": bleu, "TER": ter, "CHRF": chrf, "ROUGE": rouge, "BERT": bert, "CrossEncoder": cross}