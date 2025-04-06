import os
from flask import Flask
from flask_cors import CORS
from src.infrastructure.adapter.output.persistence.Extensions import db
from src.infrastructure.adapter.input.rest import (elementoDomanda_blueprint, 
                                                    risultatoTest_blueprint,
                                                    executeTest_blueprint)
from src.infrastructure.adapter.input.rest.containers.Containers import RootContainer
import configparser
from pathlib import Path, Path

def create_app(testing=False) -> Flask:
    app = Flask(__name__)
    app.config['SECRET_KEY'] = "default_secret_key"

    CORS(app)

    """ Impedisco a flask di ordinare le chiavi json alfabeticamente"""
    app.json.sort_keys = False
    
    """ Configuro app da INI file """
    INIconfig = configparser.ConfigParser()

    filePath = (Path(__file__).resolve().parent / 'config.ini')

    INIconfig.read(filePath)

    if(testing):
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///:memory:'
    else:
        app.config['SQLALCHEMY_DATABASE_URI'] = INIconfig['database']['uri']
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
            RisultatoSingolaDomandaEntity, RisultatoMetricaEntity)
        db.create_all()

    """ Registro i blueprint (route inserite in altri file) """
    app.register_blueprint(elementoDomanda_blueprint)
    app.register_blueprint(risultatoTest_blueprint)
    app.register_blueprint(executeTest_blueprint)
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(host='0.0.0.0', port=5000, debug=True)