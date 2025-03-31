from flask import Flask
from src.infrastructure.adapter.output.persistence.Extensions import db
from src.infrastructure.adapter.input.rest import (elementoDomanda_blueprint, 
                                                    AddElementoDomandaController, 
                                                    GetElementoDomandaController, 
                                                    GetAllElementiDomandaController, 
                                                    DeleteElementiDomandaController, 
                                                    UpdateElementoDomandaController)
from src.infrastructure.adapter.input.rest import (risultatoTest_blueprint, 
                                                    GetRisultatoTestController, 
                                                    GetAllRisultatiTestController, 
                                                    GetRisultatoSingolaDomandaController)
from src.infrastructure.adapter.input.rest import (executeTest_blueprint, 
                                                   ExecuteTestController)
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer


def create_app(testing=False) -> Flask:
    app = Flask(__name__)
    app.config['SECRET_KEY'] = "default_secret_key"

    """ Impedisco a flask di ordinare le chiavi json alfabeticamente"""
    app.json.sort_keys = False
    
    """ Configuro database """
    if(testing):
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    else:
        app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://admin:admin@localhost:5432/progetto'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    
    db.init_app(app)
    
    """ Configuro dependency injection """
    container = RootContainer()
    
    """ Qui passo la dipendenza che il container si aspettava (verrà gestita coem singleton anche grazie a SQLAlchemy)"""
    container.db.override(db)
    
    app.container = container
    
    with app.app_context():
        """ Creo le tabelle del database. Devo importare i modelli per far si che vengano creati """
        from src.infrastructure.adapter.output.persistence.domain import (
            ElementoDomandaEntity, RisultatoTestEntity, 
            RisultatoSingolaDomandaEntity, MetricheEntity)
        db.create_all()
    
    """ Registro i blueprint (route inserite in altri file) """
    app.register_blueprint(elementoDomanda_blueprint)
    app.register_blueprint(risultatoTest_blueprint)
    app.register_blueprint(executeTest_blueprint)
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)