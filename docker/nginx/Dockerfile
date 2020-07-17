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

# nginx
FROM nginx:1.18.0-alpine
COPY nginx.conf /etc/nginx/
COPY default.conf /etc/nginx/conf.d/
COPY --from=dockerize /usr/local/bin/dockerize /usr/local/bin/dockerize
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
