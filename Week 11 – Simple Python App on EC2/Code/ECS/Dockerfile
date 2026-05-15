FROM node:alpine

WORKDIR /week11app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]