from extensions import db


class Questions(db.Model):
    __tablename__ = 'questions'
    id = db.Column(db.Integer, primary_key=True)  # Chiave primaria
    question = db.Column(db.Text, nullable=False)  # Campo obbligatorio di tipo testo
    answer = db.Column(db.Text, nullable=False)  # Campo obbligatorio di tipo testo
