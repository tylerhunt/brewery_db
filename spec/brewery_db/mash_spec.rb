require 'spec_helper'

describe BreweryDB::Mash do
  it { is_expected.to be_a(Hashie::Mash) }

  context '#convert_key' do
    it 'underscores camelcased keys' do
      response = described_class.new(currentPage: 1)
      expect(response.current_page).to eq(1)
    end
  end

  context '#convert_value' do
    it 'converts CR+LF to LF' do
      response = described_class.new(description: "This.\r\nThat.")
      expect(response.description).to eq("This.\nThat.")
    end
  end
end
