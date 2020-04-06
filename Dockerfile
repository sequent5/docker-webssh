# Version 0.0.1
FROM python:alpine3.9
RUN apk add --no-cache --virtual .build-deps binutils-gold curl g++ gcc gnupg libgcc linux-headers make libffi-dev openssl-dev
RUN rm -rf /var/cache/apk/*
RUN pip3 install webssh
RUN apk del .build-deps
EXPOSE 80/tcp 443/tcp
CMD ["wssh", "--address=0.0.0.0", "--sslport=443","--certfile='/etc/ssl/certs/cert.crt'","--keyfile='/etc/ssl/certs/cert.key'"]
