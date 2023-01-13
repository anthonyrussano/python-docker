FROM python:3.11.1-alpine3.17 as dev
WORKDIR /work
FROM dev as runtime
WORKDIR /app
COPY ./src/requirements.txt /app/
RUN pip install -r /app/requirements.txt
COPY ./src/app.py /app/app.py
COPY ./src/templates/index.html /app/templates/
ENV FLASK_APP=app.py
CMD flask run -h 0.0.0 -p 5000
