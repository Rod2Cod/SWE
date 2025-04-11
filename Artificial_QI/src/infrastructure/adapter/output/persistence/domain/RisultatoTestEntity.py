from src.infrastructure.adapter.output.persistence.Extensions import db

class RisultatoMetricaEntity(db.Model):
    __tablename__ = 'RisultatoMetrica'
    nomeMetrica = db.Column(db.Text, primary_key=True)  # Chiave primaria
    score = db.Column(db.Float, nullable=False)
    risultatoDomandaId = db.Column(db.Integer, db.ForeignKey('RisultatoSingolaDomanda.id', ondelete='CASCADE'), nullable=False, primary_key=True)
    risultatoDomanda = db.relationship('RisultatoSingolaDomandaEntity', back_populates="risultatiMetriche")  # Relazione uno a molti con la tabella risultato_singola_domanda (bidirezionale)

class RisultatoSingolaDomandaEntity(db.Model):
    __tablename__ = 'RisultatoSingolaDomanda'
    id = db.Column(db.Integer, primary_key=True)  # Chiave primaria
    domanda = db.Column(db.Text, nullable=False)
    risposta = db.Column(db.Text, nullable=False) 
    rispostaLLM = db.Column(db.Text, nullable=False)
    score = db.Column(db.Float, nullable=False)
    risultatoTestId = db.Column(db.Integer, db.ForeignKey('RisultatoTest.id', ondelete='CASCADE'), nullable=False)
    risultatoTest = db.relationship('RisultatoTestEntity', back_populates="risultatiDomande")  # Relazione uno a molti con la tabella risultato_test (bidirezionale)
    risultatiMetriche = db.relationship('RisultatoMetricaEntity', back_populates="risultatoDomanda")  # Relazione uno a molti con la tabella elemento_domanda (bidirezionale)

class RisultatoTestEntity(db.Model):
    __tablename__ = 'RisultatoTest'
    id = db.Column(db.Integer, primary_key=True)  # Chiave primaria
    data = db.Column(db.DateTime, nullable=False)
    score = db.Column(db.Float, nullable=False)
    LLM = db.Column(db.Text, nullable=False)
    nomeSet = db.Column(db.Text, nullable=True)
    risultatiDomande = db.relationship('RisultatoSingolaDomandaEntity', back_populates="risultatoTest")  # Relazione uno a molti con la tabella risultato_singola_domanda (bidirezionale)