FROM ruby:2.6.4-alpine3.10
ENV LANG C.UTF-8
RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
      build-base \
      bash \
      curl-dev \
      git \
      linux-headers \
      libc-dev \
      libxml2-dev \
      libxslt-dev \
      nodejs \
      postgresql-client \
      postgresql-dev \
      ruby-dev \
      tzdata \
      zlib-dev
EXPOSE 5432