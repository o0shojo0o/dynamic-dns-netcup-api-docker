FROM php:8.1-cli-alpine

ENV CUSTOMERNR=""
ENV APIPASSWORD=""
ENV APIKEY=""
ENV DOMAINLIST=""
ENV USE_IPV4=true
ENV USE_IPV6=false
ENV CHANGE_TTL=true

RUN apk --no-cache add \        
    git

RUN mkdir /usr/src/dynamic-dns-netcup-api \      
    && cd /usr/src/dynamic-dns-netcup-api \        
    && git clone https://github.com/stecklars/dynamic-dns-netcup-api.git .

WORKDIR /usr/src/dynamic-dns-netcup-api
COPY /files/config.php /usr/src/dynamic-dns-netcup-api/config.php
CMD [ "php", "./update.php" ]