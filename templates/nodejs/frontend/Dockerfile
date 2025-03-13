FROM node:alpine
# ENV API_URL=http://backend:3001
WORKDIR /app
COPY . /app
RUN apk add --no-cache npm && npm install
EXPOSE 3000
CMD ["node", "index.js"]
