# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Search, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all(q: 'IPA') }

    it 'fetches all of the search results at once' do
      expect(response.count).to eq(6260)
    end
  end

  {
    beers: 'beer',
    breweries: 'brewery',
    guilds: 'guild',
    events: 'event'
  }.each do |method, type|
    context "##{method}" do
      subject(:search) { described_class.new(config) }

      specify do
        results = double(:results)
        search.stub(:all).with(type: type, q: 'IPA') { results }
        expect(search.send(method, q: 'IPA')).to eq(results)
      end
    end
  end

  context "#upc", :vcr do
    subject(:search) { described_class.new(config) }

    context "for an existing upc code" do
      let(:upc) { '030613000043' }

      it "returns a collection with the matched beer" do
        expect(search.upc(code: upc).map(&:id)).to eq(['LVjHK1'])
      end
    end
  end
end
