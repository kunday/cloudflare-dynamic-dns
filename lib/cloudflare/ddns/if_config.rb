require 'faraday'

module Cloudflare
  module Ddns
    # Fetch public IP address of the network. use https://ifconfig.so to fetch ip address.
    class IfConfig
      def execute
        Faraday.get('http://ifconfig.so')
      end
    end
  end
end
