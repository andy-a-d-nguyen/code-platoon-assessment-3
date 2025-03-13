FROM node:alpine
# ENV CONNECTION_STRING=postgresql://postgres:password@postgres:5432/movie_hero
WORKDIR /app
COPY . /app
RUN apk add --no-cache npm && npm install
EXPOSE 3001
CMD ["node", "index.js"]
