#!/bin/bash
set -e
# Remove a potentially pre-existing server.pid for Rails.

echo "Executing migrations" && rake db:migrate

echo "Initializing rails..."
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"