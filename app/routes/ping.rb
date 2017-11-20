class PingRoute < Sinatra::Base
  get '/ping' do
    'pong'
  end
end
