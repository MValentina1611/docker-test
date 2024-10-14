# Usar la imagen base de Node
FROM node:14

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar los archivos package.json y package-lock.json al contenedor
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Construir la aplicación para producción
RUN npm run build

# Exponer el puerto donde la aplicación estará disponible
EXPOSE 3000

# Comando para correr la aplicación en modo de producción
CMD ["npx", "serve", "-s", "build", "-l", "3000"]
