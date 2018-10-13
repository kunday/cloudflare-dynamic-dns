# frozen_string_literal: true

require 'cloudflare'

module CloudFlare
  module DynamicDNS
    class Updater
      def initialize(key:, email:, zone:, hostname:, ip:)
        @key = key
        @email = email
        @zone = zone
        @hostname = hostname
        @ip = ip
      end

      def execute
        connection = Cloudflare.connect(key: config['key'], email: config['email'])
        zone = connection.zones.find_by_name(config['zone'])
        dns_record = zone.dns_records.find_by_name(config['hostname'])
        dns_record.update_content(ip)
      end

      private

      attr_reader :key, :email, :zone, :hostname, :ip
    end
  end
end
