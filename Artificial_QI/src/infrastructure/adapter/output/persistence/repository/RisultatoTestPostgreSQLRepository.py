from src.infrastructure.adapter.output.persistence.domain import RisultatoTestEntity

class RisultatoTestPostgreSQLRepository:
    def __init__(self, db):
        self.__db = db
        
    def saveRisultatoTest(self, risultatoTestEntity: RisultatoTestEntity) -> RisultatoTestEntity:
        self.__db.session.add(risultatoTestEntity)
        self.__db.session.commit()
        return risultatoTestEntity
    
    def loadRisultatoTestById(self, id: int) -> RisultatoTestEntity:
        return RisultatoTestEntity.query.filter_by(id=id).one()
    
    def deleteRisultatoTest(self, id: int) -> None:
        risultatoTest = RisultatoTestEntity.query.filter_by(id=id).one()
        self.__db.session.delete(risultatoTest)
        self.__db.session.commit()
    
    def loadAllRisultatiTest(self) -> set[RisultatoTestEntity]:
        return set(RisultatoTestEntity.query.all())