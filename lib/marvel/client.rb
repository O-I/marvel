require 'marvel/configuration'

module Marvel
  class Client
    include Marvel::Configuration

    BASE_URL = 'https://gateway.marvel.com/'

    def initialize
      reset
    end
  end
end