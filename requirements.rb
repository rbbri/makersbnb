require 'bcrypt'
require 'sinatra/flash'
require 'active_record'
Dir["./models/*.rb"].each {|file| require file }
require_relative './lib/booking_converter'
require 'json'
require 'date'

def db_configuration
  db_configuration_file = './db/config.yml'
  YAML.safe_load(File.read(db_configuration_file), [], [], true)
end

ENV['ENVIRONMENT'] ||= 'development'

ActiveRecord::Base.establish_connection(
  db_configuration[ENV['ENVIRONMENT'] || 'postgres://localhost/mydb']
)
