from src.infrastructure.adapter.output.persistence.Extensions import db

class ElementoDomandaEntity(db.Model):
    __tablename__ = 'elemento_domanda'
    id = db.Column(db.Integer, primary_key=True)  # Chiave primaria
    domanda = db.Column(db.Text, nullable=False)  # Campo obbligatorio di tipo testo
    risposta = db.Column(db.Text, nullable=False)  # Campo obbligatorio di tipo testo