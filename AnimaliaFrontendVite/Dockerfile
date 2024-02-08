# Imagen base
FROM node:16-alpine

# Establecer directorio de trabajo en el contenedor
WORKDIR /app

# Copiar archivos de definición de paquetes
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto de los archivos del proyecto al contenedor
COPY . .

# Construir la versión de producción de la aplicación
RUN npm run build

# Exponer el puerto que Vite utiliza por defecto (3000 para desarrollo)
EXPOSE 4173

# Comando para iniciar la aplicación en modo de desarrollo
CMD ["npm", "run", "preview"]
