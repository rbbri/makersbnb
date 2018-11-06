require 'sinatra/base'
require 'active_record'
require_relative './models/user'
require_relative './models/space'
require 'pry'

def db_configuration
  db_configuration_file = './db/config.yml'
  YAML.safe_load(File.read(db_configuration_file), [], [], true)
end

ActiveRecord::Base.establish_connection(db_configuration['development'])

# MakersBnB App
class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions

  get '/' do
    @user = session[:user]
    erb :index
  end

  post '/users' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      password: params[:password],
      email: params[:email]
    )
    session[:user] = user
    redirect '/spaces'
  end

  post '/sessions' do
    user = User.find_by(
      username: params[:username],
      password: params[:password]
    )
    session[:user] = user
    redirect '/spaces'
  end

  get '/sessions/new' do
    erb :login
  end

  delete '/sessions' do
    session[:user] = nil
    redirect '/'
  end

  get '/spaces' do
    @user = session[:user]
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces' do
    Space.create(name: params[:name])
    redirect '/spaces'
  end


  get '/spaces/:id' do
    Space.find(params[:id])
    erb :spaces_id
  end

  get '/requests' do
    erb :requests
  end


end
