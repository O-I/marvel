module Marvel
  module Configuration

    attr_accessor :api_key, :private_key

    def configure
      yield self
    end

    def reset
      self.api_key = nil
      self.private_key = nil
      self
    end
  end
end