# Version 0.0.1
FROM python:3.7.3-alpine3.9
RUN sed -i ‘s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g’ /etc/apk/repositories
RUN apk add --no-cache --virtual .build-deps binutils-gold curl g++ gcc gnupg libgcc linux-headers make libffi-dev openssl-dev
&& rm -rf /var/cache/apk/*
RUN pip3 install webssh -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN apk del .build-deps
EXPOSE 8080/tcp
CMD ["wssh", "--address=0.0.0.0", "--port=8080"]
