RSpec.describe Cloudflare::Ddns::Config do
  subject(:config) { Cloudflare::Ddns::Config.new(path: path) }

  let(:path) { '/etc/ddclient.conf' }

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
