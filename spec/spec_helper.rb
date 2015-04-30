require "codeclimate-test-reporter"
require "simplecov"
require "vcr"
Dir[File.dirname(__FILE__) + "/helpers/**/*.rb"].each {|f| require f }
SimpleCov.start "rails"
CodeClimate::TestReporter.start

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation, { except: %w[public.schema_migrations] }
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

  VCR.configure do |config|
    config.cassette_library_dir = "spec/vcr_cassettes"
    config.hook_into :webmock
    config.default_cassette_options = { serialize_with: :json }
    config.preserve_exact_body_bytes do |http_message|
      http_message.body.encoding.name == 'ASCII-8BIT' ||
      !http_message.body.valid_encoding?
    end
  end
end
