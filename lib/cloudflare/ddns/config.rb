module Cloudflare
  module Ddns
    # Read ddclient configuration that will be used for the cloudflare dns update.
    class Config
      DEFAULT_CONFIG_PATH = '/etc/ddclient.conf'

      # @param [String] path to ddclient configuration, defaults to '/etc/ddclient.conf'
      def initialize(path: DEFAULT_CONFIG_PATH)
        @path = path
      end

      # @return [Array] config as an array object
      def read
        File.read(path)
      end

      private

      attr_reader :path
    end
  end
end
