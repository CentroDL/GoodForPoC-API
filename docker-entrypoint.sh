#!/bin/sh

# Run migrations
bundle exec rake sequel:migrate

exec "$@"
