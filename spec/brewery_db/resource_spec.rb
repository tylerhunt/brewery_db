require 'spec_helper'

describe BreweryDB::Resource do
  let(:client) { BreweryDB::Client.new }

  context '.new' do
    it 'accepts a client' do
      described_class.new(client).should be_a(described_class)
    end

    it 'raises an exception without a client' do
      expect { described_class.new }.to raise_error
    end
  end

  context '#connection' do
    let(:endpoint) { URI.parse(BreweryDB::Config::ENDPOINT) }

    subject { described_class.new(client).connection }

    it { should be_a(Faraday::Connection) }

    its(:'builder.handlers') { should include(FaradayMiddleware::ParseJson) }

    its(:scheme) { should == endpoint.scheme }
    its(:host) { should == endpoint.host }
    its(:path_prefix) { should == endpoint.path }

    its(:headers) do
      should == { 'User-Agent' => BreweryDB::Config::USER_AGENT }
    end
  end
end
