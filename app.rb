require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'

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
    Spaces.add(name: params['name'], description: params['description'], price: params['price'])
    redirect '/listings'
  end
  
  get '/listings' do
    'MakersBnB'
    @spaces = Spaces.all
    erb :listings
  end

  run! if app_file == $0
end