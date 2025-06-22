FROM node:18-alpine
WORKDIR /app
COPY app/ .
RUN npm init -y && npm install express
CMD ["node", "index.js"]