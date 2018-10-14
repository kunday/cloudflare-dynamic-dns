# frozen_string_literal: true

require 'cloud_flare/dynamic_dns/updater'

module CloudFlare
  module DynamicDNS
    # Main coordinator of the dynamic dns gem which fetches configuration from disk and current ip
    # and invokes the cloudflare updater to change config via API.
    class Runner
      # @param [String] path
      def initialize(path: nil)
        @path = path
      end

      # Update IP in cloudflare.
      def execute
        data = ConfigReader.new(path: path).read
        config = ConfigParser.new(data: data).execute

        ip = IfConfig.new.execute

        Updater.new(
          key: config['key'],
          email: config['email'],
          zone: config['zone'],
          hostname: config['hostname'],
          ip: ip
        ).execute
      end

      private

      attr_reader :path
    end
  end
end
