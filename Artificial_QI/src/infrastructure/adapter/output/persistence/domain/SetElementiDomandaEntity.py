from src.infrastructure.adapter.output.persistence.Extensions import db

class SetElementiDomandaEntity(db.Model):
    __tablename__ = 'set_elementi_domanda'
    nome = db.Column(db.Text, primary_key=True)  # Chiave primaria
    elementi = db.relationship('ElementoDomandaEntity', secondary="elementi_set", backref='set_elementi_domanda')  # Relazione uno a molti con la tabella elementi_set (bidirezionale)
    
elementi_set = db.Table('elementi_set', db.Model.metadata,
    db.Column('id_elemento', db.Integer, db.ForeignKey('elemento_domanda.id', ondelete='CASCADE'), primary_key=True),
    db.Column('nome_set', db.Text, db.ForeignKey('set_elementi_domanda.nome', ondelete='CASCADE'), primary_key=True)
)