# Version 0.0.1
FROM python:alpine3.9
RUN apk add --no-cache --virtual .build-deps binutils-gold curl g++ gcc gnupg libgcc linux-headers make libffi-dev openssl-dev
RUN rm -rf /var/cache/apk/*
RUN pip3 install webssh
RUN apk del .build-deps
RUN mkdir /data
VOLUME /data
EXPOSE 8080/tcp 4443/tcp
#WORKDIR /
CMD ["wssh", "--port=8080","--sslport=4443","--certfile='/data/cert.crt'","--keyfile='/data/cert.key'"]
