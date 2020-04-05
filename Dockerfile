# Version 0.0.1
FROM python:3.7.3-alpine3.9
RUN pip3 install webssh
EXPOSE 8080
CMD ["wssh", "--address=0.0.0.0", "--port=8080"]
