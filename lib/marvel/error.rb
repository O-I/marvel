module Marvel
  module Response
    class Error < StandardError

      def initialize(response_hash)
        response_hash.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      def to_s
        instance_variables.map { |var| instance_variable_get(var) } * ' '
      end
    end
  end
end