# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Yeasts, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the yeasts at once' do
      expect(response.length).to eq(50)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1836) }

    it 'fetches only the yeast asked for' do
      expect(response.id).to eq(1836)
    end
  end
end
