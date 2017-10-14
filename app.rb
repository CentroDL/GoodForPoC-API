# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'production'

require 'bundler'
require 'json'
Bundler.require :default, ENV['RACK_ENV'].to_sym

class App < Sinatra::Base
  # TODO: Create fixed list of helpers to load.
  # TODO: Define sessions.
  # TODO: Secure sessions by this
  #= begin
  # require 'sysrandom/securerandom'
  # set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
  #= end
  configure :production, :development do
    enable :logging
  end

  get '/ping' do
    'pong'
  end

  post '/gql' do
    mock_graphql_host = ENV.fetch('MOCK_GRAPHQL_SERVER_HOST',
                                  'http://localhost:3000')
    query = params.fetch('q', '')
    route = "#{mock_graphql_host}/graphql?query=#{query}"
    begin
      resp = HTTParty.get(route)
      [resp.code, resp.body]
    rescue => e
      [500, JSON.dump(error: e)]
    end
  end
end
