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

  get '/listings' do
    'MakersBnB'
    @spaces = Spaces.all
    erb :listings
  end


  run! if app_file == $0
end