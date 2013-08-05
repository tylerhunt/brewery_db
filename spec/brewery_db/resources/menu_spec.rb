# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Menu, :resource do

  describe '#beer_availability', :vcr do
    let(:availabilities) { described_class.new(config).beer_availability }

    it 'fetches all of the beer availabilities at once' do
      expect(availabilities.count).to eq(8)
    end
  end

end
