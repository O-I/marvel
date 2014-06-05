require_relative 'response'
require_relative 'error'

module Marvel
  module Request
    include Marvel::Response

    def get(path, options = {})
      request(:get, path, options)
    end

    private

    def request(method, path, options = {})
      etag = options.delete(:etag)
      response = connection.send(method) do |request|
        request.url(path, options.merge(auth))
        request.headers['If-None-Match'] = etag if etag
      end
      prepare(response)
    end

    def prepare(response)
      case response.status
      when 200 then Marvel::Response.create(response.body)
      when 304 then Marvel::Response::Error.new(
                      { 'code' => 304, 'status' => 'Not Modified' })
      else          Marvel::Response::Error.new(response.body)
      end
    end

    def auth(nonce = timestamp)
      { ts: nonce, apikey: api_key, hash: hash(nonce) }
    end

    def hash(nonce)
      Digest::MD5.hexdigest(nonce + private_key + api_key)
    end

    def timestamp
      Time.now.to_s
    end
  end
end