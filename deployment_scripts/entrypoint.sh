#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f /myapp/tmp/pids/server.pid ]; then
  rm /myapp/tmp/pids/server.pid
fi

bundle exec rake db:migrate
bundle exec rake assets:precompile

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"