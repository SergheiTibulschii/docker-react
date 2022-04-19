FROM node:16-alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY --from=0 /app/build /usr/share/nginx/html
EXPOSE 80