# Usa un'immagine base di Python
FROM python:3.9

# Imposta la directory di lavoro nel container
WORKDIR /app

# Copia il file delle dipendenze nella directory di lavoro
COPY ./App/requirements.txt /app/requirements.txt

# Installa le dipendenze richieste
RUN pip install --no-cache-dir -r requirements.txt

# Copia tutto il contenuto della directory App nel container
COPY ./App /app

# Imposta la variabile di ambiente per Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5000

# Espone la porta su cui Flask gira
EXPOSE 5000

# Aggiungi la variabile d'ambiente per attivare il debug in Flask
ENV FLASK_ENV=development

# Comando per avviare l'app Flask
CMD ["flask", "run"]
