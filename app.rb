require 'sinatra/base'
require 'sinatra/reloader'
require './lib/spaces'
require './lib/user'
require './lib/request'

class MakersBnB < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end
  
  get '/' do
    erb :index
  end

  get '/listings/new' do
    erb :new
  end

  post '/listings/space_added' do
    Spaces.add(name: params['name'], description: params['description'], price: params['price'])
    redirect '/listings'
  end
  
  get '/listings' do
    @spaces = Spaces.all
    erb :listings
  end

  post '/users/new' do
    user = User.create(email: params['email'], password: params['password'])
    $user_id = user.id
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :sessions
  end

  post '/users/verify' do
    User.login(email: params['email'], password: params['password'])
    redirect '/listings'
  end

  get '/requests' do
    erb :requests
  end

  get '/listings/:id' do
    @space = Spaces.find(id: params['id'])
    erb :book
  end

  post '/listings/:id/request_booking' do
    Request.generate(user_id: $user_id, space_id: params['id'])
    redirect '/listings'
  end

  run! if app_file == $0
end
