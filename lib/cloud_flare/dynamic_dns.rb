# frozen_string_literal: true

require 'cloud_flare/dynamic_dns/version'
require 'cloud_flare/dynamic_dns/config_reader'
require 'cloud_flare/dynamic_dns/config_parser'
require 'cloud_flare/dynamic_dns/if_config'
require 'cloud_flare/dynamic_dns/runner'
require 'cloud_flare/dynamic_dns/updater'

module CloudFlare
  # Module that updates DNS entries in Cloudflare dynamically.
  module DynamicDNS
  end
end
