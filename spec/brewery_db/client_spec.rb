require 'spec_helper'

describe BreweryDB::Client do
  context '#config' do
    subject { described_class.new.config }

    it { should be_a(BreweryDB::Config) }

    its(:adapter) { should == BreweryDB::Config::ADAPTER }
    its(:api_key) { should == nil }
    its(:endpoint) { should == BreweryDB::Config::ENDPOINT }
  end

  context '#configure' do
    subject do
      described_class.new.configure do |config|
        config.adapter = :typhoeus
        config.api_key = 'A1029384756B'
        config.endpoint = 'http://api.playground.brewerydb.com'
      end
    end

    its(:adapter) { should == :typhoeus }
    its(:api_key) { should == 'A1029384756B' }
    its(:endpoint) { should == 'http://api.playground.brewerydb.com' }
  end

  context '#connection' do
    let(:endpoint) { URI.parse(BreweryDB::Config::ENDPOINT) }

    subject { described_class.new.connection }

    it { should be_a(Faraday::Connection) }

    its(:scheme) { should == endpoint.scheme }
    its(:host) { should == endpoint.host }
    its(:path_prefix) { should == endpoint.path }
  end
end
