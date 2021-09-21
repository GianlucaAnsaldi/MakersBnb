require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/listings/new' do
    erb :new
  end

  post '/listings/space_added' do
    Space.add(name: params['name'], description: params['description'], price: params['price'])
    redirect '/listings'
  end

  run! if app_file == $0
end