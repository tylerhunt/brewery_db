require 'spec_helper'

describe BreweryDB::Client do
  context '.config' do
    subject { described_class.new.config }

    its(:endpoint) { should == BreweryDB::Config::ENDPOINT }
    its(:api_key) { should be_nil }
  end

  context '.configure' do
    subject do
      described_class.new.configure do |config|
        config.endpoint = 'http://api.playground.brewerydb.com'
        config.api_key = 'A1029384756B'
      end
    end

    its(:endpoint) { should == 'http://api.playground.brewerydb.com' }
    its(:api_key) { should == 'A1029384756B' }
  end
end
