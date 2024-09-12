#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Install dependencies
bundle install --without development test

# Migrate the database
bundle exec rails db:migrate

# Precompile assets
bundle exec rails assets:precompile
# Run server
bundle exex rails server
