FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Elasticbean uses the expose command to know what port to expose
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html