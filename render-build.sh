#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile

# Clean up
bundle exec rails assets:clean

# Run database migrations
bundle exec rails db:migrate

# Run seeds if it's the first deployment
# bundle exec rails db:seed
