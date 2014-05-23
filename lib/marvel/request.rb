module Marvel
  module Request
    def get(path, options = {})
      request(:get, path, options)
    end

    private

    def request(method, path, options = {})
      response = connection.send(method) do |request|
        request.url(path, options.merge(auth))
      end
      response.body
    end

    def auth
      ts = timestamp
      hsh = hash(ts)
      { ts: ts, apikey: api_key, hash: hsh }
    end

    def hash(ts)
      Digest::MD5.hexdigest(ts + private_key + api_key)
    end

    def timestamp
      Time.now.to_s
    end
  end
end