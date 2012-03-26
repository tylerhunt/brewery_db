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
    VCR.use_cassette('breweries', record: :new_episodes) { example.call }
  end

  context '#all' do
    let(:response) { described_class.new(client).all(established: 2006) }

    subject { response }

    its(:current_page) { should == 1 }
    its(:number_of_pages) { should == 1 }
    its(:status) { should == 'success' }

    context 'data' do
      subject { response.data }

      it { should be_a(Array) }

      its(:'first.name') { should == '612 Brew LLC' }
    end
  end

  context '#find' do
    let(:response) { described_class.new(client).find('d1zSa7') }

    subject { response }

    its(:status) { should == 'success' }

    context 'data' do
      subject { response.data }

      its(:name) { should == 'Lonerider Brewing Company' }
    end
  end
end
