set :allow_origin, :any
set :allow_methods, %i[get post put options]
set :allow_credentials, true
set :max_age, 1_728_000
set :expose_headers, ['Content-Type']

enable :cross_origin

configure :production, :development do
  enable :logging
  use Rack::Attack
end
