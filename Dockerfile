FROM ubuntu:trusty
MAINTAINER John Kelly <john.m.kelly@cdk.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs

COPY . /app
WORKDIR /app

RUN npm install -g mocha && \
    npm install

ENTRYPOINT ["mocha"]
