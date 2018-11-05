require 'sinatra/base'
require 'active_record'
require_relative './models/user'
require 'pry'

def db_configuration
  db_configuration_file = "./db/config.yml"
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

class MakersBNB < Sinatra::Base
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
    p params
    # binding.pry
    session[:user] = user
    redirect '/'
  end

  get'/sessions/new' do
    erb :login
  end

end
