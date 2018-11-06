require 'sinatra/base'
require 'sinatra/flash'
require 'active_record'
require_relative './models/user'
require_relative './models/space'
require 'pry'

def db_configuration
  db_configuration_file = './db/config.yml'
  YAML.safe_load(File.read(db_configuration_file), [], [], true)
end

ENV['ENVIRONMENT'] ||= 'development'

ActiveRecord::Base.establish_connection(db_configuration[ENV['ENVIRONMENT']])

# MakersBnB App
class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = session[:user]
    erb :index
  end

  post '/users' do
    if User.exists?(username: params[:username])
      flash[:error] = 'This username is already in use'
      redirect '/'
    end
    if User.exists?(email: params[:email])
      flash[:error] = 'This email is already in use'
      redirect '/'
    end
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
    Space.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      user_id: session[:user].id
    )
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
