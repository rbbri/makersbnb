require 'sinatra/base'
require 'active_record'
require_relative './models/user'
require_relative './models/space'

def db_configuration
  db_configuration_file = "./db/config.yml"
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

class MakersBNB < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/sessions/new' do
    erb :login
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  get '/spaces/new' do
    erb :new_space
  end

  post '/spaces' do
    space = Space.create(name: params[:name])
    redirect ('/spaces')
  end

end
