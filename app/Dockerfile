FROM node:16.10.0

WORKDIR /app

COPY package.json .
COPY tsconfig.json .
COPY src ./src

RUN ls -a
RUN npm install
RUN npm run build

COPY frontend ./frontend
RUN npm run i:frontend
RUN npm run build:frontend

EXPOSE 8000

CMD [ "node", "./dist/index.js" ]
