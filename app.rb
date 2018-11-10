require 'bcrypt'
require 'sinatra/base'
require 'sinatra/flash'
require 'active_record'
Dir["./models/*.rb"].each {|file| require file }
require_relative './lib/booking_converter'


def db_configuration
  db_configuration_file = './db/config.yml'
  YAML.safe_load(File.read(db_configuration_file), [], [], true)
end

ENV['ENVIRONMENT'] ||= 'development'

ActiveRecord::Base.establish_connection(
  db_configuration[ENV['ENVIRONMENT'] || 'postgres://localhost/mydb']
)

# MakersBnB App
class MakersBNB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  register Sinatra::Flash

  before do
    @user = session[:user]
  end

  get '/' do
    erb :index, layout: :welcome_header
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
    password = BCrypt::Password.create(params[:password])
    user = User.create(
      name: params[:name],
      username: params[:username],
      password: password,
      email: params[:email]
    )
    session[:user] = user
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces, layout: :logged_in_header
  end

  get '/sessions/new' do
    erb :login, layout: :welcome_header
  end

  post '/sessions' do
    user = User.find_by(
      username: params[:username]
    )
    if user.nil? || BCrypt::Password.new(user.password) != params[:password]
      flash[:error] = 'Incorrect username or password'
      redirect '/sessions/new'
    end
    session[:user] = user
    redirect '/spaces'
  end

  delete '/sessions' do
    session[:user] = nil
    redirect '/sessions/new'
  end

  get '/spaces/new' do
    erb :new_space, layout: :logged_in_header
  end

  post '/spaces' do
    @user.spaces.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    redirect '/spaces'
  end

  get '/spaces/:id' do
    @space = Space.find(params[:id])
    @min = BookingConverter.arrayify([@space.start_date, Date.today].max)
    @max = BookingConverter.arrayify(@space.end_date)
    @ranges = @space.bookings.all.map do |booking|
      BookingConverter.convert(booking)
    end
    @unavailable_dates = Booking.all.map { |booking| booking.start_date.to_s }
    @unavailable_dates.push((@space.end_date + 1).to_s)
    erb :space_id, layout: :logged_in_header
  end

  post '/requests' do
    start_date = params[:start_date].to_s
    @user.requests.create(
      start_date: start_date,
      nights: params[:nights],
      space_id: params[:id]
    )
    redirect '/requests'
  end

  get '/requests' do
    user_space_requests = @user.spaces.map(&:requests)
    @requests_received = user_space_requests.flatten
    @requests_made = @user.requests
    erb :requests, layout: :logged_in_header
  end

  post '/requests/:id' do
    request = Request.find(params[:id])
    request.update(confirmation_status: params[:status])
    space = Space.find(request.space_id)
    if params[:status] == 'Confirmed'
      space.bookings.create(
        request_id: request.id,
        start_date: request.start_date,
        nights: request.nights
      )
    end
    redirect '/requests'
  end

  get '/calendar' do
    erb :calendar
  end
end
