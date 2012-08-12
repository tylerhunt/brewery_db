# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Breweries, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all(established: 2006) }

    it 'fetches all of the breweries at once' do
      response.count.should eq 55
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find('Idm5Y5') }

    it 'fetches only the brewery asked for' do
      response.id.should == 'Idm5Y5'
    end
  end
end
