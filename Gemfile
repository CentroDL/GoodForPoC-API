# frozen_string_literal: true

source 'https://rubygems.org'

# Querying language of client
gem 'graphql'

# Web server of choice.
gem 'puma'

# Micro web-framework of choice.
gem 'sinatra'

# Redis
gem 'redis-store'

# Secure secret generation.
gem 'sysrandom'

# Use Postgres.
gem 'pg'

# ORM for Postgres.
gem 'sequel'

# Tasks for Postgres.
gem 'sequel-rake'

# Seed for Postgres
gem 'sequel-seed'

# Generate slugs for Models
gem 'sequel_sluggable'

# Faker for Seeds
gem 'faker'

# Task runner.
gem 'rake'

# HTTP Client tool.
gem 'httparty'

# Enable CORS support.
gem 'sinatra-cross_origin', '~> 0.3.1'

# Block & Throttle requests.
gem 'rack-attack'

group :development, :test do
  # Audit gems for vulnerabilities.
  gem 'bundler-audit', '~> 0.6.0'
end

group :test do
  # Test support for Rack.
  gem 'rack-test', require: false

  # Test runner and framework.
  gem 'rspec', require: false

  # Code style checking.
  gem 'rubocop', require: false

  # Capture HTTP calls.
  gem 'vcr', require: false

  # Coverage detection.
  gem 'simplecov', require: false

  # Remote collection of coverage.
  gem 'codecov', require: false

  # Mock out HTTP requests.
  gem 'webmock', require: false
end
