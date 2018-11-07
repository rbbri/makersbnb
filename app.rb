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
    start_date = "#{params[:in_year]}-#{params[:in_month]}-#{params[:in_date]}"
    end_date = "#{params[:out_year]}-#{params[:out_month]}-#{params[:out_date]}"
    @user.requests.create(
      start_date: start_date,
      end_date: end_date,
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
    request.update(confirmation_status: params[:status])
    space = Space.find(request.space_id)
    if params[:status] == "Confirmed"
      space.bookings.create(
        request_id: request.id,
        start_date: request.start_date,
        end_date: request.end_date
      )
    end
    redirect '/requests'
  end
end
