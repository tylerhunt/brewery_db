# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Beers, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all(abv: '5.5') }

    it 'fetches all of the beers at once' do
      pending 'API update'
      response.count.should eq 50
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find('99Uj1n') }

    it 'fetches only the beer asked for' do
      response.id.should == '99Uj1n'
    end
  end
end
