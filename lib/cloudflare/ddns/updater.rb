module Cloudflare
  module Ddns
    class Updater
      def execute
        config = Config.new.read
        ip = IfConfig.new.execute
      end
    end
  end
end
