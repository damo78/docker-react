# as builder is a tag
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx automatically starts so no CMD required
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
