# Phase 1 : Build the required code with the dependencies
FROM node:16-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Phase 2 : Get the build files from the phase 1 into the nginx container
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html