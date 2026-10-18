FROM node:20-alpine

WORKDIR /app

COPY index.js package.json ./

EXPOSE 3000

RUN apk update && apk --no-cache add openssl bash curl ca-certificates &&\
    chmod +x index.js

CMD ["node", "index.js"]
