require 'cloud_flare/dynamic_dns/updater'

module CloudFlare
  module DynamicDNS
    class Runner
      def execute
        data = ConfigReader.new.read
        config = ConfigParser.new(data: data)

        ip = IfConfig.new.execute

        Updater.new(
          key: config['key'],
          email: config['email'],
          zone: config['zone'],
          hostname: config['hostname'],
          ip: ip
        ).execute
      end
    end
  end
end
