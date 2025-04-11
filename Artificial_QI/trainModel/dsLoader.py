from datasets import load_dataset

import sacrebleu
from rouge_score import rouge_scorer
from bert_score import BERTScorer
from sentence_transformers import CrossEncoder
import torch

"""Questa classe si occupa di calcolare i gli score da associare ad una singola domanda generata dal modello."""

class Scorer:
    def __init__(self, device=None):
        if device is None:
            self.device = "cuda" if torch.cuda.is_available() else "cpu"
        else:
            self.device = device
        self.__bertScorer = BERTScorer(model_type="bert-base-uncased", device=self.device)
        self.__crossEncoder = CrossEncoder('cross-encoder/stsb-roberta-large', device=self.device)
        self.__rougeScorer = rouge_scorer.RougeScorer(['rouge1', 'rouge2', 'rougeL'], use_stemmer=True)

    def __lexical_score_batch(self, ipotesi_batch, riferimento_batch):
        bleu_scores = [sacrebleu.sentence_bleu(hyp, [ref]).score / 100 for hyp, ref in zip(ipotesi_batch, riferimento_batch)]
        ter_scores = [sacrebleu.sentence_ter(hyp, [ref]).score / 100 for hyp, ref in zip(ipotesi_batch, riferimento_batch)]
        chrf_scores = [sacrebleu.sentence_chrf(hyp, [ref]).score / 100 for hyp, ref in zip(ipotesi_batch, riferimento_batch)]
        return bleu_scores, ter_scores, chrf_scores

    def __ROUGE_score_batch(self, ipotesi_batch, riferimento_batch):
        rouge_scores = []
        for hyp, ref in zip(ipotesi_batch, riferimento_batch):
            scores = self.__rougeScorer.score(ref, hyp)
            rouge_scores.append(scores['rougeL'].fmeasure)
        return rouge_scores

    def __BERT_score_batch(self, ipotesi_batch, riferimento_batch):
        P, R, F1 = self.__bertScorer.score(ipotesi_batch, riferimento_batch)
        return F1.tolist()

    def score_batch(self, ipotesi_batch: list[str], riferimento_batch: list[str]) -> dict:
        bleu_scores, ter_scores, chrf_scores = self.__lexical_score_batch(ipotesi_batch, riferimento_batch)
        rouge_scores = self.__ROUGE_score_batch(ipotesi_batch, riferimento_batch)
        bert_scores = self.__BERT_score_batch(ipotesi_batch, riferimento_batch)
        cross_scores = self.__crossEncoder.predict(list(zip(ipotesi_batch, riferimento_batch))).tolist()

        return {
            "BLEU": bleu_scores,
            "TER": ter_scores,
            "CHRF": chrf_scores,
            "ROUGE": rouge_scores,
            "BERT": bert_scores,
            "CrossEncoder": cross_scores,
        }

def compute_scores(examples, scorer):
    ipotesi_batch = examples["sentence1"]
    riferimento_batch = examples["sentence2"]
    scores = scorer.score_batch(ipotesi_batch, riferimento_batch)
    return scores

ds = load_dataset("mteb/stsb_multi_mt", "it")
ds = ds.remove_columns("lang")

# Inizializza l'oggetto Scorer (puoi specificare il device)
scorer = Scorer(device="cuda" if torch.cuda.is_available() else "cpu")

# Applica la funzione compute_scores al dataset utilizzando map con batched=True
ds = ds.map(compute_scores, batched=True, fn_kwargs={"scorer": scorer})


ds = ds.remove_columns(["sentence1", "sentence2"])

ds.save_to_disk("assets/ds1")