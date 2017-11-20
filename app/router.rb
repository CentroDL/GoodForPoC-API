# frozen_string_literal: true

require 'config/environment'
require 'config/initializer'

module GoodForPoc
  class Router < Sinatra::Base
    require 'app/configuration'
    require 'app/routes'

    use PingRoute

    get '/gql' do
      mock_graphql_host = ENV.fetch('MOCK_GRAPHQL_SERVER_HOST', 'http://localhost:3000')
      query = params.fetch('query', '')
      route = "#{mock_graphql_host}/graphql?query=#{query}"

      begin
        resp = HTTParty.get(route)
        [resp.code, resp.body]
      rescue => e
        [500, JSON.dump(error: e)]
      end
    end
  end
end
