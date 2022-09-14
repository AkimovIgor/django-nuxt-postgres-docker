FROM python:3.10-alpine

ARG USERNAME=python
ARG PROJECTNAME=app
ARG ENV_MODE=dev

RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev \
    && adduser -D ${USERNAME} \
    && mkdir -p /usr/src/${USERNAME}/${PROJECTNAME} \
    && mkdir -p /usr/src/${USERNAME}/logs \
    && mkdir -p /usr/src/${USERNAME}/scripts \
    && mkdir -p /usr/src/${USERNAME}/${PROJECTNAME}/dotenvs \
    && chown -R ${USERNAME} /usr/src/${USERNAME}/

COPY ./docker/django/${ENV_MODE}_req.txt /usr/src/${USERNAME}/${PROJECTNAME}/req.txt
COPY ./docker/django/start.sh /usr/src/${USERNAME}/scripts/start.sh
COPY ./docker/postgres/db.env /usr/src/${USERNAME}/dotenvs/db.env

RUN pip install -r /usr/src/${USERNAME}/${PROJECTNAME}/req.txt
RUN chmod +x /usr/src/${USERNAME}/scripts/start.sh
RUN touch /usr/src/${USERNAME}/logs/django.log

WORKDIR /usr/src/${USERNAME}/${PROJECTNAME}

COPY ./back .

COPY ./docker/postgres/db.env ./dotenvs/db.env

USER ${USERNAME}

EXPOSE 8000
