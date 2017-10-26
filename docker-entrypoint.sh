#!/bin/sh

# Run migrations
rake sequel:migrate

exec "$@"
