ENV['ENVIRONMENT'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './features/helper_methods'
require_relative './../app'

Capybara.app = MakersBNB

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start

require 'database_cleaner'

RSpec.configure do |config|

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
