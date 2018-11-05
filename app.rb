require 'sinatra/base'
require 'active_record'
require_relative './models/user'

def db_configuration
  db_configuration_file = "./db/config.yml"
  YAML.load(File.read(db_configuration_file))
end

ActiveRecord::Base.establish_connection(db_configuration["development"])

class MakersBNB < Sinatra::Base

  get '/' do
    erb :index
  end

end
