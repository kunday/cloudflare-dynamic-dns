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
        current_config
        if changed?
          puts "=> updating #{dns_record.record[:name]} to #{ip}"
          dns_record.update_content(ip)
        else
          puts '=> No changes detected.'
        end
      end

      def current_config
        puts "=> #{dns_record.record[:name]} currently pointing to -> #{dns_record.record[:content]}"
        puts "=> current public IP of your network is #{ip}."
      end

      def changed?
        ip != dns_record.record[:content]
      end

      def dns_record
        @dns_record ||= dns_zone.dns_records.find_by_name(hostname)
      end

      def dns_zone
        @dns_zone ||= connection.zones.find_by_name(zone)
      end

      def connection
        @connection ||= Cloudflare.connect(key: key, email: email)
      end

      private

      attr_reader :key, :email, :zone, :hostname, :ip
    end
  end
end
