require 'pg'

task :setup do
  connection = PG.connect
  connection.exec("CREATE DATABASE makersbnb_test")
  connection.exec("CREATE DATABASE makersbnb_development")
end
