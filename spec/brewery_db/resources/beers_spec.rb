# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Beers, :resource do
  subject(:beers_resource) { described_class.new(config) }

  context '#all', :vcr do
    let(:response) { beers_resource.all(abv: '5.5') }

    it 'fetches all of the beers at once' do
      expect(response.count).to eq(985)
    end
  end

  context '#find', :vcr do
    let(:response) { beers_resource.find('99Uj1n') }

    it 'fetches only the beer asked for' do
      expect(response.id).to eq('99Uj1n')
    end
  end

  context '#random', :vcr do
    let(:response) { beers_resource.random(hasLabels: 'Y') }

    it 'fetches a random beer' do
      expect(response.status).to eq('verified')
      expect(response.labels.size).to eq(3)
    end
  end
end
