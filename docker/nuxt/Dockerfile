FROM node:16.17.0-alpine

ARG USERNAME=nuxt
ARG PROJECTNAME=nuxt_app

RUN apk update \
    && adduser -D ${USERNAME} \
    && mkdir -p /usr/src/${USERNAME}/${PROJECTNAME} \
    && chown -R ${USERNAME} /usr/src/${USERNAME} \
    && apk upgrade

COPY ./front /usr/src/${USERNAME}/${PROJECTNAME}/

WORKDIR /usr/src/${USERNAME}/${PROJECTNAME}

RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

RUN npm install

USER ${USERNAME}

EXPOSE 3000
