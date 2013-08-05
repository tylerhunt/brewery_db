require 'spec_helper'

describe BreweryDB::Resources::Brewery do
  context '#beers' do
    let(:config) { double }
    let(:id) { 'KlSsWY' }
    let(:response) { double(collection: :some_beers) }

    subject(:brewery) { described_class.new(config, id: id) }

    context 'without params' do
      it 'returns the beers for a brewery' do
        brewery.stub(:get).with('brewery/KlSsWY/beers', {}) { response }
        expect(brewery.beers).to eq(:some_beers)
      end
    end

    context 'with params' do
      let(:params) { double }

      it 'returns the beers for a brewery with params' do
        brewery.stub(:get).with('brewery/KlSsWY/beers', params) { response }
        expect(brewery.beers(params)).to eq(:some_beers)
      end
    end
  end
end
