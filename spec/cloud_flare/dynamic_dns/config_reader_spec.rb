# frozen_string_literal: true

RSpec.describe CloudFlare::DynamicDNS::ConfigReader do
  subject(:config) { described_class.new(path: path) }

  let(:path) { '/etc/cloudflare-dynamic-dns.conf' }

  before do
    allow(File).to receive(:read)
  end

  describe '#new' do
    let(:path) { nil }

    it 'falls to system path when provided path is nil' do
      config.read

      expect(File).to have_received(:read).with(CloudFlare::DynamicDNS::ConfigReader::DEFAULT_CONFIG_PATH)
    end
  end

  describe '#read' do
    it 'reads config from file system' do
      config.read

      expect(File).to have_received(:read).with(path)
    end
  end
end
