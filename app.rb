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
    user_id = session[:user_id]
    Spaces.add(name: params['name'], description: params['description'], price: params['price'], owner_id: user_id)
    redirect '/listings'
  end
  
  get '/listings' do
    @spaces = Spaces.all
    erb :listings
  end

  post '/users/new' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :sessions
  end

  post '/users/verify' do
    user = User.login(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/requests' do
    user_id = session[:user_id]
    @requests = Request.show_pending(user: user_id)
    session[:request_id] = 
    @spaces = @requests.map { |request| Spaces.find(id: request.space_id) }
    erb :requests
  end

  get '/listings/:id' do
    @space = Spaces.find(id: params['id'])
    erb :book
  end

  post '/listings/:id/request_booking' do
    Request.generate(user_id: session[:user_id], space_id: params['id'])
    redirect '/listings'
  end

  post '/requests/:id/approve' do
    Request.close_request(space_id: params['id'])
    Spaces.remove_space(space_id: params['id'])
    redirect '/requests'

  end

  post '/request/reject' do

    redirect '/listings'
  end

  run! if app_file == $0
end
