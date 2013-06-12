require 'spec_helper'

describe BreweryDB::Resources::Locations, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all(locality: 'San Francisco') }

    it 'fetches all of the breweries at once' do
      response.count.should eq 19
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find('wXmTDU') }

    it 'fetches only the location asked for' do
      response.id.should == 'wXmTDU'
    end
  end
end
