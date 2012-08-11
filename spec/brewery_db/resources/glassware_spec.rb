# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Glassware, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the glassware at once' do
      response.length.should eq 12
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the glassware asked for' do
      response.id.should eq 1
    end
  end
end
