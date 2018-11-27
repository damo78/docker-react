# as builder is a tag
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx automatically starts so no CMD required
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
