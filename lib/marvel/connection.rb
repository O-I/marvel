require 'faraday_middleware'

module Marvel
  module Connection

    BASE_API_URL = 'https://gateway.marvel.com/v1/public/'

    private

    def connection
      options = {
        ssl: { verify: false },
        url: BASE_API_URL
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::Mashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end