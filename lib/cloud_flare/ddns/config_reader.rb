module CloudFlare
  module Ddns
    # Read cloudflare-dynamic-dns configuration that will be used for the cloudflare dns update.
    class ConfigReader
      DEFAULT_CONFIG_PATH = '/etc/cloudflare-dynamic-dns.conf'.freeze

      # @param [String] path to configuration, defaults to '/etc/cloudflare-dynamic-dns.conf'
      def initialize(path: DEFAULT_CONFIG_PATH)
        @path = path
      end

      # @return [Array] config as an array object
      def read
        @config = File.read(path)
      end

      private

      attr_reader :path, :config
    end
  end
end
