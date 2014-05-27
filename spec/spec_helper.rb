require 'simplecov'

SimpleCov.start

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'webmock/rspec'
require 'marvel_api'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end

WebMock.disable_net_connect!(allow_localhost: true)

def marvel_test_client
  Marvel::Client.new.tap do |client|
    client.configure do |config|
      config.api_key = '1234'
      config.private_key = 'abcd'
    end
  end
end

AUTH = '?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150'

def stub_get(path, options = {})
  file = options.fetch(:returns)
  stub_request(:get, Marvel::Connection::BASE_API_URL + path + AUTH).
    to_return(body: fixture(file))
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

module Marvel
  module Request
    private
    def timestamp
      '1'
    end
  end
end