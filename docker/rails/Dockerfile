# syntax=docker/dockerfile:experimental

# dockerize
FROM alpine:3.12.0 AS dockerize
ENV DOCKERIZE_VERSION=v0.6.1
RUN \
  --mount=type=cache,target=/var/cache/apk \
  --mount=type=cache,target=/var/lib/apk \
  --mount=type=cache,target=/etc/apk/cache \
  wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz  && \
  tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
  rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

# rails
FROM ruby:2.7.1-alpine3.12
WORKDIR /app
RUN \
  --mount=type=cache,target=/var/cache/apk \
  --mount=type=cache,target=/var/lib/apk \
  --mount=type=cache,target=/etc/apk/cache \
  apk add -U \
    build-base \
    git \
    mariadb-client \
    mariadb-connector-c-dev \
    nodejs \
    openssl \
    tzdata \
    yarn \
    && \
  gem install rails && \
  rails new -d mysql .
COPY database.yml /app/config/
COPY docker-entrypoint.sh /usr/local/bin/
COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-u", "puma", "-b", "0.0.0.0"]
