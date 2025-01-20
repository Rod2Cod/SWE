import sacrebleu
import pandas as pd
from rouge_score import rouge_scorer
from transformers import BertTokenizer, BertModel
from bert_score import BERTScorer
from sentence_transformers import CrossEncoder

def lexical_score(ipotesi, riferimento): #BLEU - TER - CHRF

    bleu = sacrebleu.sentence_bleu(ipotesi, [riferimento]).score # BLEU score

    ter = sacrebleu.sentence_ter(ipotesi, [riferimento]).score # TER score

    chrf = sacrebleu.sentence_chrf(ipotesi, [riferimento]).score  # CHRF score

    return bleu/100, ter/100, chrf/100



def ROUGE_valut(ipotesi, riferimento): #ROUGE
    scorer = rouge_scorer.RougeScorer(['rouge1', 'rouge2', 'rougeL'], use_stemmer=True)
    scores = scorer.score(riferimento, ipotesi)
    return scores['rougeL'].fmeasure

def BERTscore(ipotesi, riferimento, modello): #BERTscore
    scorer = BERTScorer(model_type=modello)
    P, R, F1 = scorer.score([ipotesi], [riferimento])
    return F1.item()

def CrossEncoder_score(ipotesi, riferimento, modello): #CrossEncoder
    model = CrossEncoder(modello)
    return model.predict([(ipotesi, riferimento)])


def EvaluateLLM(data):
    matrice_punteggi = []

    modello_BERTscore = "bert-base-uncased"
    modello_CrossEncoder = 'cross-encoder/stsb-roberta-large'
    features = ["BLEU", "TER", "CHRF", "ROUGE-L", "BERTscore", "CrossEncoder"]
    importance_values = [0.046187, 0.035189, 0.057927, 0.037883, 0.056955, 0.765859]

    # Creazione del DataFrame
    feature_importance = pd.DataFrame({
        'Feature': features,
        'Importance': importance_values
    })

    i = 0

    while i < len(data):
        ipotesi, riferimento = data[i]

        bleu, ter, chrf = lexical_score(ipotesi, riferimento)
        valutazione_ROUGE = ROUGE_valut(ipotesi, riferimento)  # Considero solo F-score
        score_bert = BERTscore(ipotesi, riferimento, modello_BERTscore)
        score_CrossEncoder = CrossEncoder_score(ipotesi, riferimento, modello_CrossEncoder)

        matrice_punteggi.append(
            [round(bleu, 3), round(ter, 3), round(chrf, 3), round(valutazione_ROUGE, 3), round(score_bert, 3), round(float(score_CrossEncoder), 3)])  # ipotesi, riferimento,

        i += 1

    #mat_punteggi = pd.DataFrame(matrice_punteggi,columns=['BLEU', 'TER', 'CHRF', 'ROUGE-L', 'BERTscore', 'CrossEncoder'])

    score_finale = []

    #num_metriche = len(matrice_punteggi[0])

    for i in range(len(matrice_punteggi)):
        sum_parziale = 0
        for j in range(len(feature_importance)):
            sum_parziale += matrice_punteggi[i][j] * float(feature_importance.iloc[j]['Importance'])
        score_finale.append(round(sum_parziale, 2))

    return score_finale