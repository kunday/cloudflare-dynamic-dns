module CloudFlare
  module Ddns
    # reads cloudflare-dynamic-dns config and converts into a Hash object.
    class ConfigParser
      # @param [String] data config file read as is from file system.
      def initialize(data:)
        @data = data
      end

      # @return [Hash] k,v of configuration specified in cloudflare-dynamic-dns.conf
      def execute
        items = data.chomp.split("\n").map { |item| item.split('=') }
        Hash[*items.flatten]
      end

      private

      attr_reader :data

    end
  end
end
