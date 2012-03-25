require 'spec_helper'

describe BreweryDB::Breweries do
  let(:client) { BreweryDB::Client.new }

  before do
    client.configure do |config|
      config.api_key = 'A1029384756B'
      config.endpoint = 'http://api.playground.brewerydb.com'
    end
  end

  around do |example|
    VCR.use_cassette('breweries') { example.call }
  end

  context '#all' do
    subject { described_class.new(client).all(established: 2006) }

    it { should be_success }

    its(:body) { should be_a(Hashie::Mash) }
    its(:'body.data') { should be_a(Array) }
  end
end
