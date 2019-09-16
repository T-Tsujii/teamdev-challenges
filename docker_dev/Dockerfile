FROM ruby:2.6.4-alpine
ENV LANG C.UTF-8
ENV APP /teamdev_challenges
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
      zlib-dev \
 && gem install -q -N \
      bundler \
      pkg-config \
      rails:5.2.3 \
      nokogiri
WORKDIR $APP
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4 --retry=3
ENV RAILS_SERVE_STATIC_FILES=1
EXPOSE 4306
EXPOSE 4000
