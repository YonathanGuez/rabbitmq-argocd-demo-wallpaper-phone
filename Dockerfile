FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN npm install --omit=dev

COPY server.js worker.js ./

# Allow any UID assigned by OpenShift restricted-v2 to read/write app files
RUN chmod -R g=u /app

EXPOSE 3000
