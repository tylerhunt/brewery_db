require 'spec_helper'

describe BreweryDB::Client do
  context '#config' do
    it 'returns a configuration instance' do
      expect(subject.config).to be_a(BreweryDB::Config)
    end

    it 'memoizes the return value' do
      expect(BreweryDB::Config).to receive(:new).once.and_return(double)
      2.times { subject.config }
    end
  end

  context '#configure' do
    it 'can set the adapter' do
      expect {
        subject.configure { |config| config.adapter = :typhoeus }
      }.to change(subject.config, :adapter).to(:typhoeus)
    end

    it 'can set the API key' do
      expect {
        subject.configure { |config| config.api_key = 'secret' }
      }.to change(subject.config, :api_key).to('secret')
    end

    it 'can set the base URI' do
      expect {
        subject.configure { |config| config.base_uri = 'http://example.com' }
      }.to change(subject.config, :base_uri).to('http://example.com')
    end

    it 'can set the timeout' do
      expect {
        subject.configure { |config| config.timeout = 42 }
      }.to change(subject.config, :timeout).to(42)
    end

    it 'can set the user agent' do
      expect {
        subject.configure { |config| config.user_agent = 'Brewdega' }
      }.to change(subject.config, :user_agent).to('Brewdega')
    end
  end

  its(:beers) { should be_a(BreweryDB::Resources::Beers) }
  its(:breweries) { should be_a(BreweryDB::Resources::Breweries) }
  its(:categories) { should be_a(BreweryDB::Resources::Categories) }
  its(:glassware) { should be_a(BreweryDB::Resources::Glassware) }
  its(:locations) { should be_a(BreweryDB::Resources::Locations) }
  its(:search) { should be_a(BreweryDB::Resources::Search) }
  its(:styles) { should be_a(BreweryDB::Resources::Styles) }

  it { expect(subject.brewery('KlSsWY')).to be_a(BreweryDB::Resources::Brewery) }
end
