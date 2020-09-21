FROM nginx:alpine

RUN apk update && \
    apk add --no-cache openssl && \
    openssl req -x509 -nodes -days 3650 \
    -subj  "/C=US/ST=NY/O=WCM ITS/CN=localhost" \
     -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
     -out /etc/ssl/certs/nginx-selfsigned.crt;

