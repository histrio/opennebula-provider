FROM phusion/baseimage:latest

RUN apt-get update && \
    apt-get install -y ruby-dev rake git-core build-essential zlib1g-dev &&\
    apt-get autoremove -y && apt-get clean && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./Gemfile /usr/src/plugin/
RUN cd /usr/src/plugin && gem install bundler && bundler install
