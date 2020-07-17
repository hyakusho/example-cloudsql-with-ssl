#!/bin/sh
set -xeuo pipefail

dockerize --wait tcp://rails:3000 -timeout 600s

exec "$@"
