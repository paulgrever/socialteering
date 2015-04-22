require "simplecov"
require "codeclimate-test-reporter"
Dir[File.dirname(__FILE__) + "/helpers/**/*.rb"].each {|f| require f }
SimpleCov.start "rails"
CodeClimate::TestReporter.start

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, {except: %w[public.schema_migrations]}
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
