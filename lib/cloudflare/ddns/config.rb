module Cloudflare
  module Ddns
    class Config
      def initialize(path:)
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
