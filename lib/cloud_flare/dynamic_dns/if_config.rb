# frozen_string_literal: true

require 'faraday'

module CloudFlare
  module DynamicDNS
    # Fetch public IP address of the network. use https://ifconfig.so to fetch ip address.
    class IfConfig
      # returns ipv4 address of your home internet connection.
      def execute
        Faraday.get('http://ifconfig.so').body
      end
    end
  end
end
