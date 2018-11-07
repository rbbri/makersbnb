ENV['ENVIRONMENT'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'rspec'
require_relative './features/helper_methods'
require_relative './../app'
require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'

Coveralls.wear!
Capybara.app = MakersBNB

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.default_formatter = 'doc'
end
