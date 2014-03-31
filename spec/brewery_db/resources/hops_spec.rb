# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Hops, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the hops at once' do
      expect(response.count).to eq(166)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the hop asked for' do
      expect(response.id).to eq(1)
    end
  end
end
