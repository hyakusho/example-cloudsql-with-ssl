#!/bin/sh
set -xeuo pipefail

dockerize --wait tcp://mysql:3306 -timeout 600s

bundle exec rails db:create db:migrate

exec "$@"
