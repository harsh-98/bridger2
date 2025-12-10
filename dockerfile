FROM node:20.14-alpine


WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000
 
CMD ["node", "/app/src/app.js"]