module Marvel
  module Response
    def self.create(response_hash)
      results = response_hash.data.results.dup rescue response_hash
      results.extend(self)
      results.instance_exec do
        @code   = response_hash.code
        @status = response_hash.status
        @etag   = response_hash.etag
        @offset = response_hash.data.offset
        @limit  = response_hash.data.limit
        @total  = response_hash.data.total
        @count  = response_hash.data.count
      end
      results
    end

    attr_reader :code, :status, :etag,
                :offset, :limit, :total, :count
  end
end