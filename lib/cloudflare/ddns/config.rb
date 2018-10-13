module Cloudflare
  module Ddns
    class Config
      DEFAULT_CONFIG_PATH = '/etc/ddclient.conf'

      def initialize(path: DEFAULT_CONFIG_PATH)
        @path = path
      end

      def read
        File.read(path)
      end

      private

      attr_reader :path
    end
  end
end
