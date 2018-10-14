# frozen_string_literal: true

require 'cloudflare'

module CloudFlare
  module DynamicDNS
    # Update DNS zone / domain information in cloudflare with the new IP address if it has changed.
    class Updater
      # @param [String] key
      # @param [String] email
      # @param [String] zone
      # @param [String] hostname
      # @param [String] ipv4
      def initialize(key:, email:, zone:, hostname:, ipv4:)
        @key = key
        @email = email
        @zone = zone
        @hostname = hostname
        @ip = ipv4
      end

      # Update Cloudflare with the new IP addr
      def update
        current_config
        if changed?
          logger.info "=> updating #{dns_record.record[:name]} to #{ip}"
          dns_record.update_content(ip)
        else
          logger.info '=> No changes detected.'
        end
      end

      private

      def current_config
        logger.info "=> #{dns_record.record[:name]} currently pointing to -> #{dns_record.record[:content]}"
        logger.info "=> current public IP of your network is #{ip}."
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

      def logger
        Logger.new(STDOUT)
      end

      attr_reader :key, :email, :zone, :hostname, :ip
    end
  end
end
