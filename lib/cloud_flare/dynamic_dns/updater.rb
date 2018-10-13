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
        connection = Cloudflare.connect(key: key, email: email)
        dns_zone = connection.zones.find_by_name(zone)
        dns_record = dns_zone.dns_records.find_by_name(hostname)
        puts "=> #{dns_record.record[:name]} currently pointing to -> #{dns_record.record[:content]}"
        puts "=> current public IP of your network is #{ip}."
        if ip == dns_record.record[:content]
          puts '=> No changes detected.'
          return
        end
        puts "=> updating #{dns_record.record[:name]} to #{ip}"
        dns_record.update_content(ip)
      end

      private

      attr_reader :key, :email, :zone, :hostname, :ip
    end
  end
end
