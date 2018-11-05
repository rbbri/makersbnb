require 'sinatra/base'
require './data_mapper_setup.rb'

class MakersBNB < Sinatra::Base

  get '/' do
    erb :index
  end

end
