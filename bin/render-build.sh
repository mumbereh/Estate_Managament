#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean

# Perform database migrations
bundle exec rails db:migrate
