RSpec.describe CloudFlare::DynamicDNS::Runner do
  subject(:runner) { described_class.new }
  let(:config_reader) { instance_double(CloudFlare::DynamicDNS::ConfigReader) }
  let(:config_parser) { instance_double(CloudFlare::DynamicDNS::ConfigParser) }
  let(:ifconfig) { instance_double(CloudFlare::DynamicDNS::IfConfig) }
  let(:updater) { instance_double(CloudFlare::DynamicDNS::Updater) }
  let(:ipv4) { 'ipv4' }
  let(:config) do
    {
      'key' => 'key',
      'email' => 'email',
      'zone' => 'zone',
      'hostname' => 'hostname'
    }
  end
  before do
    allow(CloudFlare::DynamicDNS::ConfigReader).to receive(:new).and_return(config_reader)
    allow(config_reader).to receive(:read)
    allow(CloudFlare::DynamicDNS::ConfigParser).to receive(:new).and_return(config_parser)
    allow(config_parser).to receive(:execute).and_return(config)
    allow(CloudFlare::DynamicDNS::IfConfig).to receive(:new).and_return(ifconfig)
    allow(ifconfig).to receive(:execute).and_return(ipv4)
    allow(CloudFlare::DynamicDNS::Updater).to receive(:new).and_return(updater)
    allow(updater).to receive(:update)
  end

  describe '#execute' do
    it 'fetches configuration from file system' do
      runner.execute

      expect(config_reader).to have_received(:read)
    end

    it 'parses configuration into a hash' do
      runner.execute

      expect(config_parser).to have_received(:execute)
    end

    it 'fetches current ip up from ifconfig' do
      runner.execute

      expect(ifconfig).to have_received(:execute)
    end

    it 'invokes updater with right config' do
      runner.execute

      expect(CloudFlare::DynamicDNS::Updater).to have_received(:new).with(
        key: config['key'],
        email: config['email'],
        zone: config['zone'],
        hostname: config['hostname'],
        ipv4: ipv4
      )
    end
  end

end
