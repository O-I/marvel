require 'faraday/middleware'

module Marvel
  module Connection
    private

    def connection
      options = {
        ssl: { verify: false },
        url: { 'http://https://gateway.marvel.com/v1/public/' }
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Rashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end