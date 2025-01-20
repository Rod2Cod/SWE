# Step 1: Usa una immagine Node.js ufficiale come build environment
FROM node:18

# Step 2: Imposta la directory di lavoro all'interno del container
WORKDIR /app

# Step 3: Copia i file package.json e package-lock.json dalla cartella /VueApp nel container
COPY ./react_app/package*.json ./

# Step 4: Installa le dipendenze
RUN npm install

# Step 5: Copia tutto il contenuto della cartella /VueApp nel container
COPY ./react_app .

# Step 9: Esponi la porta 80 per il traffico HTTP
EXPOSE 5173

# Step 10: Avvia Nginx
CMD ["npm", "run", "host"]
