# frozen_string_literal: true

require 'cloud_flare/dynamic_dns/updater'

module CloudFlare
  module DynamicDNS
    class Runner
      def initialize(path: nil)
        @path = path
      end

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
