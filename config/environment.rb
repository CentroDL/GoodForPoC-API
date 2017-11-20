# frozen_string_literal: true

# Check we have the necessary ENV vars set
[
  'RACK_ENV',
  'DATABASE_URL',
  'REDIS_URL'
].each { |v| raise("#{v} is not set.") if ENV[v].nil? }

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

# Connect to DB
DB = Sequel.connect(ENV['DATABASE_URL'])

# Enable pg_json extension
DB.extension :pg_json

# Enable timestamp plugin
Sequel::Model.plugin :timestamps
