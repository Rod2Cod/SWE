from src.infrastructure.adapter.output.persistence.domain import ElementoDomandaEntity, SetElementiDomandaEntity

class SetElementiDomandaPostgreSQLRepository:
    def __init__(self, db):
        self.__db = db
        
    def saveSetElementiDomanda(self, setElementiEntity: SetElementiDomandaEntity) -> bool:
        self.__db.session.add(setElementiEntity)
        self.__db.session.commit()
        return True
    
    def deleteSetElementiDomanda(self, nomeSet: str) -> bool:
        setElementi = SetElementiDomandaEntity.query.filter_by(nome=nomeSet).first()
        self.__db.session.delete(setElementi)
        self.__db.session.commit()
        return True
    
    def loadSetElementiDomandaByNome(self, nomeSet: str) -> SetElementiDomandaEntity:
        return SetElementiDomandaEntity.query.filter_by(nome=nomeSet).first()
    
    def loadAllSetElementiDomanda(self) -> set[SetElementiDomandaEntity]:
        return set(SetElementiDomandaEntity.query.all())
    
    def updateNomeSetElementiDomanda(self, nomeSet: str, nuovoNomeSet: str) -> bool:
        setElementi = SetElementiDomandaEntity.query.filter_by(nome=nomeSet).first()
        setElementi.nome = nuovoNomeSet
        self.__db.session.commit()
        return True
    
    def updateElementiSetElementiDomanda(self, nomeSet: str, elementi: set[ElementoDomandaEntity]) -> bool:
        setElementi = SetElementiDomandaEntity.query.filter_by(nome=nomeSet).first()
        setElementi.elementi = elementi
        self.__db.session.commit()
        return True