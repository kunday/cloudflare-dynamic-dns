# frozen_string_literal: true

RSpec.describe CloudFlare::DynamicDNS::ConfigParser do
  let(:parser) { described_class.new(data: data) }
  let(:data) do
    "email=cloudflare-email\napi_key=cloudflare-global-api-key\nzone=cloudflare-domain\nhostname=full-hostname\n"
  end

  describe '#execute' do
    it 'returns config in hash format' do
      expect(parser.execute).to eq(
        'email' => 'cloudflare-email',
        'api_key' => 'cloudflare-global-api-key',
        'zone' => 'cloudflare-domain',
        'hostname' => 'full-hostname'
      )
    end
  end
end
