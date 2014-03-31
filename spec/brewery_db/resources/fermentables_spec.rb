# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Fermentables, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the fermentables at once' do
      expect(response.count).to eq(222)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1924) }

    it 'fetches only the fermentable asked for' do
      expect(response.id).to eq(1924)
    end
  end
end
