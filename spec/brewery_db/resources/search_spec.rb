# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Search, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all(q: 'IPA') }

    it 'fetches all of the search results at once' do
      response.count.should eq 905
    end
  end

  {
    beers: 'beer',
    breweries: 'brewery',
    guilds: 'guild',
    events: 'event'
  }.each do |method, type|
    context "##{method}" do
      subject { described_class.new(config) }

      specify do
        results = double(:results)
        subject.should_receive(:all).with(type: type, q: 'IPA').and_return(results)
        subject.send(method, q: 'IPA').should == results
      end
    end
  end
end
