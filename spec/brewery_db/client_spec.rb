require 'spec_helper'

describe BreweryDB::Client do
  context '#config' do
    subject { described_class.new.config }

    it { should be_a(BreweryDB::Config) }

    its(:adapter) { should == BreweryDB::Config::ADAPTER }
    its(:api_key) { should == nil }
    its(:endpoint) { should == BreweryDB::Config::ENDPOINT }
    its(:user_agent) { should == BreweryDB::Config::USER_AGENT }
  end

  context '#configure' do
    subject do
      described_class.new.configure do |config|
        config.adapter = :typhoeus
        config.api_key = 'A1029384756B'
        config.endpoint = 'http://api.playground.brewerydb.com'
        config.user_agent = 'A BreweryDB Application'
      end
    end

    its(:adapter) { should == :typhoeus }
    its(:api_key) { should == 'A1029384756B' }
    its(:endpoint) { should == 'http://api.playground.brewerydb.com' }
    its(:user_agent) { should == 'A BreweryDB Application' }
  end

  {
    beers: BreweryDB::Resources::Beers,
    breweries: BreweryDB::Resources::Breweries,
    categories: BreweryDB::Resources::Categories,
    glassware: BreweryDB::Resources::Glassware,
    search: BreweryDB::Resources::Search,
    styles: BreweryDB::Resources::Styles
  }.each do |method, resource|
    context "##{method}" do
      specify do
        endpoint = resource.new(subject)
        resource.should_receive(:new).and_return(endpoint)
        subject.send(method).should == endpoint
      end
    end
  end
end
