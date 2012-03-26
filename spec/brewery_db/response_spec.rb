require 'spec_helper'

describe BreweryDB::Response do
  it { should be_a(Hashie::Mash) }

  it 'underscores camelcased keys' do
    described_class.new(:currentPage => 1).current_page.should == 1
  end
end
