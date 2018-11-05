require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{env}")

# require './lib'

DataMapper.finalize

DataMapper.auto_upgrade!
