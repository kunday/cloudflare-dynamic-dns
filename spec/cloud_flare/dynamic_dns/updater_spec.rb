RSpec.describe CloudFlare::DynamicDNS::Updater do
  subject(:updater) { described_class.new(key: key, email: email, zone: zone, hostname: hostname, ipv4: ipv4) }

  let(:key) { 'super-secret-key' }
  let(:email) { 'email' }
  let(:zone) { 'zone' }
  let(:hostname) { 'hostname' }
  let(:ipv4) { 'ipv4' }

  describe '#update' do
    context 'when ip address has changed' do
      it 'updates cloudflare' do

      end
    end

    context 'when ip address has not changed' do
      it 'does not update cloudflare' do

      end
    end
  end
end
