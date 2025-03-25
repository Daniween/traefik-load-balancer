# Utiliser une image Node pour le build
FROM node:18-alpine AS build
WORKDIR /app

# Copier les fichiers de configuration
COPY package*.json ./
COPY tsconfig*.json ./
COPY vite.config.ts ./

# Installer les dépendances
RUN npm ci

# Copier le reste du code source
COPY . .

# Build de l'application
RUN npm run build

# Image finale avec nginx
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]