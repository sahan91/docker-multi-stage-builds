# Stage 1 - the build process
FROM node:13.13.0-alpine as build-deps
WORKDIR /app

COPY package.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . ./
RUN npm run build

# Stage 2 - the deploy process
FROM nginx
COPY --from=build-deps /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]