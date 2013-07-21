require 'spec_helper'

describe BreweryDB::Resources::Brewery do
  context '#beers' do
    let(:config) { double }
    let(:id) { 'KlSsWY' }
    let(:response) { double(data: nil) }

    subject { described_class.new(config, id: id) }

    context 'without params' do
      it 'returns the beers for a brewery' do
        expect(subject).to receive(:get).with('brewery/KlSsWY/beers', {}) { response }
        subject.beers
      end
    end

    context 'with params' do
      let(:params) { double }

      it 'returns the beers for a brewery with params' do
        expect(subject).to receive(:get).with('brewery/KlSsWY/beers', params) { response }
        subject.beers(params)
      end
    end
  end
end
