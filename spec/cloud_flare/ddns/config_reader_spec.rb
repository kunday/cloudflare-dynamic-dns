RSpec.describe CloudFlare::Ddns::ConfigReader do
  subject(:config) { described_class.new(path: path) }

  let(:path) { '/etc/cloudflare-dynamic-dns.conf' }

  describe '#read' do
    before do
      allow(File).to receive(:read)
    end

    it 'reads config from file system' do
      config.read

      expect(File).to have_received(:read).with(path)
    end
  end
end
