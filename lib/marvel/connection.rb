require 'faraday_middleware'
require_relative 'version'

module Marvel
  module Connection

    BASE_API_URL = 'https://gateway.marvel.com/v1/public/'
    HEADERS = {
                accept: 'application/json',
                user_agent: "marvel_api gem #{Marvel::Version}"
              }

    private

    def connection
      options = {
        headers: HEADERS,
        ssl: { verify: false },
        url: BASE_API_URL
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::Mashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end