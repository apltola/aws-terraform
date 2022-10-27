FROM node:alpine

WORKDIR /app

COPY package.json .
COPY tsconfig.json .
COPY src /app/src

RUN ls -a
RUN npm install
RUN npm run build

EXPOSE 8000

CMD [ "node", "./dist/index.js" ]
