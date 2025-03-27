from src.infrastructure.adapter.output.persistence.domain import RisultatoSingolaDomandaEntity

class RisultatoSingolaDomandaPostgreSQLRepository:
    def __init__(self, db):
        self.__db = db
        
    def loadRisultatoSingolaDomandaTestById(self, id: int) -> RisultatoSingolaDomandaEntity:
        return RisultatoSingolaDomandaEntity.query.filter_by(id=id).one()
    
    def loadAllRisultatiSingoleDomandeByTestId(self, id: int) -> set[RisultatoSingolaDomandaEntity]:
        return set(RisultatoSingolaDomandaEntity.query.filter_by(risultatoTestId=id).all())