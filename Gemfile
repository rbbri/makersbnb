# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

group :test, :development, :production do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec'
  gem 'rubocop'
  gem 'simplecov'
  gem 'simplecov-console'
end

group :development, :production do
  gem 'activerecord'
  gem 'pg'
  gem 'rack'
  gem 'rake'
end

gem 'flog'
gem 'json', '~> 1.6'
gem 'pry'
gem 'sinatra'
gem 'sinatra-flash'
gem 'standalone_migrations'
