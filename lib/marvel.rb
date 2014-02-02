require 'marvel/client'

module Marvel
  class << self
    # Alias for Marvel::Client.new
    # @return [Marvel::Client]
    def new
      @client ||= Marvel::Client.new
    end

    # Delegate to Marvel::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end