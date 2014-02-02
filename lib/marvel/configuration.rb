module Marvel
  module Configuration

    attr_accessor :api_key

    def configure
      yield self
    end

    def reset
      self.api_key = nil
      self
    end
  end
end