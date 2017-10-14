FROM mhart/alpine-node:latest

MAINTAINER Oli Laban <olilaban@outlook.com>

ENV HUGO_VERSION 0.29
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit

RUN apk update && \
	apk add py-pygments git bash openssh rsync && \
	rm -rf /var/cache/apk/*

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tar.gz