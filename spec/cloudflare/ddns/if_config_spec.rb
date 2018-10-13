RSpec.describe Cloudflare::Ddns::IfConfig do
  subject(:ifconfig) { described_class.new }

  describe '#execute' do
    before do
      allow(Faraday).to receive(:get).and_call_original
    end

    it 'uses faraday to get public ip' do
      ifconfig.execute

      expect(Faraday).to have_received(:get).with('http://ifconfig.so')
    end
  end

end
