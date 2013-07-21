# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Styles, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the styles at once' do
      expect(response.length).to eq(157)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the style asked for' do
      expect(response.id).to eq(1)
    end
  end
end
