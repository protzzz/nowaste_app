FROM node:20

WORKDIR /app

# Firstly, copy manifest dependencies
COPY package*.json ./

# Setting up dependencies
RUN npm ci

COPY . .

RUN npm install

EXPOSE 8000

CMD [ "npm", "run", "dev" ]