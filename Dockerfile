FROM python:3.11.1-alpine3.17
WORKDIR /app
COPY ./src/Pipfile ./src/Pipfile.lock /app/
RUN pip install pipenv && pipenv install --ignore-pipfile
COPY ./src/app.py /app/app.py
COPY ./src/templates/index.html /app/templates/
ENV FLASK_APP=app.py
CMD pipenv run flask run -h 0.0.0.0 -p 5000