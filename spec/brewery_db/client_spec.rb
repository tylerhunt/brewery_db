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

    its(:'builder.handlers') { should include(FaradayMiddleware::ParseJson) }

    its(:scheme) { should == endpoint.scheme }
    its(:host) { should == endpoint.host }
    its(:path_prefix) { should == endpoint.path }

    its(:headers) do
      should == { 'User-Agent' => BreweryDB::Config::USER_AGENT }
    end
  end

  context '#beers' do
    subject { described_class.new }

    specify do
      beers = BreweryDB::Beers.new(subject)
      BreweryDB::Beers.should_receive(:new).and_return(beers)
      subject.beers.should == beers
    end
  end

  context '#breweries' do
    subject { described_class.new }

    specify do
      breweries = BreweryDB::Breweries.new(subject)
      BreweryDB::Breweries.should_receive(:new).and_return(breweries)
      subject.breweries.should == breweries
    end
  end
end
