require 'spec_helper'

describe BreweryDB::Mash do
  it { should be_a(Hashie::Mash) }

  context '#convert_key' do
    it 'underscores camelcased keys' do
      response = described_class.new(currentPage: 1)
      response.current_page.should == 1
    end
  end

  context '#convert_value' do
    it 'converts CR+LF to LF' do
      response = described_class.new(description: "This.\r\nThat.")
      response.description.should == "This.\nThat."
    end
  end
end
