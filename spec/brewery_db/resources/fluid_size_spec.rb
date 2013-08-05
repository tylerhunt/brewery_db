require 'spec_helper'

describe BreweryDB::Resources::FluidSize, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the fluid sizes at once' do
      expect(response.length).to eq(17)
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the fluid size asked for' do
      expect(response.id).to eq(1)
    end
  end
end

