# Imagen base oficial de Azure Functions con Node.js
FROM mcr.microsoft.com/azure-functions/node:4-node18

# Instala Chromium y dependencias necesarias
RUN apt-get update && apt-get install -y \
    chromium-browser \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libasound2 \
    libpangocairo-1.0-0 \
    libgtk-3-0 \
 && rm -rf /var/lib/apt/lists/*

# Define la ruta para Puppeteer
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Configura el directorio de trabajo
WORKDIR /home/site/wwwroot

# Copia el código y instala dependencias
COPY . .
RUN npm install

# Comando de inicio
CMD ["npm", "start"]
