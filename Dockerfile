FROM ruby:2.6.4-alpine3.10
ENV LANG C.UTF-8
ENV APP /teamdev_challenges
RUN apk update \
 && apk upgrade --no-cache \
 && apk add --update --no-cache \
      build-base \
      bash \
      git \
      linux-headers \
      libc-dev \
      libxml2-dev \
      libxslt-dev \
      nodejs \
      postgresql \
      postgresql-dev \
      tzdata \
 && gem install -q -N \
      bundler \
      pkg-config \
      rails:5.2.3 \
      nokogiri
WORKDIR $APP
COPY Gemfile Gemfile.lock $APP/
RUN bundle install --jobs=4 --retry=3
COPY . $APP
ENV RAILS_SERVE_STATIC_FILES=1
EXPOSE 5432
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]