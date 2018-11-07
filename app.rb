require 'sinatra/base'
require 'sinatra/flash'
require 'active_record'
require_relative './models/user'
require_relative './models/space'
require_relative './models/request'
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

  before do
    @user = session[:user]
  end

  get '/' do
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

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/sessions/new' do
    erb :login
  end

  post '/sessions' do
    user = User.find_by(
      username: params[:username],
      password: params[:password]
    )
    if user.nil?
      flash[:error] = 'Incorrect username or password'
      redirect '/sessions/new'
    end
    session[:user] = user
    redirect '/spaces'
  end

  delete '/sessions' do
    session[:user] = nil
    redirect '/'
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces' do
    @user.spaces.create(
      name: params[:name],
      description: params[:description],
      price: params[:price]
    )
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.find(params[:id])
    erb :space_id
  end

  post '/requests' do
    dates = [
      params[:in_date],
      params[:in_month],
      params[:in_year],
      params[:out_date],
      params[:out_month],
      params[:out_year]
    ]
    @user.requests.create(
      booking_date: dates.join(' '),
      space_id: params[:id]
    )
    redirect '/requests'
  end

  get '/requests' do
    user_space_requests = @user.spaces.map { |space| space.requests }
    @requests_received = user_space_requests.flatten
    @requests_made = @user.requests
    erb :requests
  end

  post '/requests/:id' do
    request = Request.find(params[:id])
    request.update(confirmation_status: "Confirmed")
    redirect '/requests'
  end
end
