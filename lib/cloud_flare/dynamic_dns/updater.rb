module CloudFlare
  module DynamicDNS
    class Updater
      def execute
        config = ConfigReader.new.read
        parsed_config = ConfigParser.new(data: config)
        ip = IfConfig.new.execute
      end
    end
  end
end
