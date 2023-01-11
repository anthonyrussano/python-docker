FROM python:3.11.1-alpine3.17 as dev

WORKDIR /work

FROM dev as runtime
COPY ./src/ /app 

ENTRYPOINT [ "python", "/app/app.py" ]
