module Porni
  module Hubs
    class Client
      DEFAULT_TIMEOUT = {
        connect: 2,
        read: 5,
        write: 20,
      }.freeze

      attr_reader :page, :timeout

      def initialize(options = {})
        @page = options[:page].to_s.downcase
        @timeout = DEFAULT_TIMEOUT.merge(options[:timeout] || {})
      end
    end
  end
end
