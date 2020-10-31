FROM ruby:2.7.1-alpine

ARG BUILD_PACKAGES="build-base"
ARG DEV_PACKAGES="postgresql-dev git nodejs yarn vim"
ARG RUBY_PACKAGES="tzdata"

## Install Packages ##
RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES

RUN mkdir /app
WORKDIR /app

COPY Gemfile* package.json yarn.lock ./

RUN gem install bundler -v 2.0.1

RUN ["/bin/sh", "-c", "bundle install"]

RUN yarn install

COPY . /app

RUN bin/rails assets:precompile --trace

EXPOSE 3000
