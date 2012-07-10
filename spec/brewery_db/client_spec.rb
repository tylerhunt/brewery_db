require 'spec_helper'

describe BreweryDB::Client do
  context '#config' do
    subject { described_class.new.config }

    it { should be_a(BreweryDB::Config) }

    its(:adapter) { should == Faraday.default_adapter }
    its(:base_uri) { should == BreweryDB::Config::BASE_URI }
    its(:user_agent) { should == BreweryDB::Config::USER_AGENT }

    its(:api_key) { should be_nil }
  end

  context '#configure' do
    let(:client) { described_class.new }

    before do
      client.configure do |config|
        config.adapter = :typhoeus
        config.base_uri = 'http://api.playground.brewerydb.com'
        config.user_agent = 'A BreweryDB Application'

        config.api_key = 'A1029384756B'
      end
    end

    subject { client.config }

    its(:adapter) { should == :typhoeus }
    its(:base_uri) { should == 'http://api.playground.brewerydb.com' }
    its(:user_agent) { should == 'A BreweryDB Application' }

    its(:api_key) { should == 'A1029384756B' }
  end

  {
    beers: BreweryDB::Resources::Beers,
    breweries: BreweryDB::Resources::Breweries,
    categories: BreweryDB::Resources::Categories,
    glassware: BreweryDB::Resources::Glassware,
    search: BreweryDB::Resources::Search,
    styles: BreweryDB::Resources::Styles
  }.each do |method, resource_class|
    context "##{method}" do
      specify { subject.send(method).should be_a(resource_class) }
    end
  end
end
