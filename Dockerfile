FROM python:3.11.1-alpine3.17 as dev
WORKDIR /work
FROM dev as runtime
COPY ./src/ /app 
RUN pip install -r /app/requirements.txt
ENV FLASK_APP=app.py
CMD flask run -h 0.0.0 -p 5000
