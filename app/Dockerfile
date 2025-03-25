# Build
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

# Serve
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
