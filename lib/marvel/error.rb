module Marvel
  module Response
    class Error < StandardError
      attr_reader :code, :status

      def initialize(response_hash)
        @code = response_hash['code']
        @status = response_hash['status'] || response_hash['message']
      end

      def to_s
        "#{@code} #{@status}"
      end
    end
  end
end