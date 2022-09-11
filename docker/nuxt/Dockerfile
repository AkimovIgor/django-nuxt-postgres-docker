FROM node:16.17.0-alpine

ARG USERNAME=nuxt
ARG PROJECTNAME=nuxt_app

RUN adduser -D ${USERNAME} \
    && mkdir -p /usr/src/${USERNAME}/${PROJECTNAME} \
    && chown -R ${USERNAME} /usr/src/${USERNAME} \
    && apk update \
    && apk upgrade

WORKDIR /usr/src/${USERNAME}/${PROJECTNAME}

COPY ./front /usr/src/${USERNAME}/${PROJECTNAME}/

RUN npm install

RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

RUN npm run build

USER ${USERNAME}

EXPOSE 3000
