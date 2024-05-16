FROM debian:12-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get -y install nodejs && npm install -g npm
RUN apt-get -y install libxss1

COPY package.json /app/package.json

RUN cd /app && npm install

COPY src /app/src
COPY example.js /app/example.js

WORKDIR /app

