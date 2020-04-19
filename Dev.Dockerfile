# pull official base image
FROM node:13.13.0-alpine
WORKDIR /app

COPY package.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . ./

CMD ["npm", "start"]
