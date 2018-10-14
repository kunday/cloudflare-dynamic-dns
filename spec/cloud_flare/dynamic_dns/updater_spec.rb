RSpec.describe CloudFlare::DynamicDNS::Updater do
  subject(:updater) { described_class.new(key: key, email: email, zone: zone, hostname: hostname, ipv4: ipv4) }

  let(:key) { 'super-secret-key' }
  let(:email) { 'email' }
  let(:zone) { 'zone' }
  let(:hostname) { 'hostname' }
  let(:ipv4) { 'new-ipv4' }
  let(:cloudflare_ipv4) { 'ipv4' }
  let(:connection) { instance_double(Cloudflare::Connection) }
  let(:zones) { instance_double(Cloudflare::Zones) }
  let(:zone) { instance_double(Cloudflare::Zone) }
  let(:dns_records) { instance_double(Cloudflare::DNSRecords) }
  let(:dns_record) { instance_double(Cloudflare::DNSRecord, record: {content: cloudflare_ipv4}) }

  before do
    allow(Cloudflare).to receive(:connect).and_return(connection)
    allow(connection).to receive(:zones).and_return(zones)
    allow(zones).to receive(:find_by_name).and_return(zone)
    allow(zone).to receive(:dns_records).and_return(dns_records)
    allow(dns_records).to receive(:find_by_name).and_return(dns_record)
    allow(dns_record).to receive(:update_content)
  end

  describe '#update' do
    it 'connects to cloudflare with provided config' do
      updater.update

      expect(Cloudflare).to have_received(:connect).with(key: key, email: email)
    end

    it 'looks up the correct dns zone' do
      updater.update

      expect(zones).to have_received(:find_by_name).with(zone)
    end

    it 'looks up the correct dns record' do
      updater.update

      expect(dns_records).to have_received(:find_by_name).with(hostname)
    end

    it 'updates cloudflare' do
      updater.update

      expect(dns_record).to have_received(:update_content).with(ipv4)
    end

    context 'when ip address has not changed' do
      let(:ipv4) { 'ipv4' }
      it 'does not update cloudflare' do
        updater.update

        expect(dns_record).not_to have_received(:update_content).with(ipv4)
      end
    end
  end
end
