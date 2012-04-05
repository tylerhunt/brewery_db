# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Search do
  let(:client) { BreweryDB::Client.new }

  before do
    client.configure do |config|
      config.api_key = 'A1029384756B'
      config.endpoint = 'http://api.playground.brewerydb.com'
    end
  end

  around do |example|
    VCR.use_cassette('search', record: :new_episodes) { example.call }
  end

  context '#all' do
    let(:response) { described_class.new(client).all(q: 'IPA') }

    subject { response }

    its(:current_page) { should == 1 }
    its(:number_of_pages) { should == 14 }
    its(:status) { should == 'success' }
    its(:data) { should be_a(Array) }
    its(:data) { should have(50).results }

    context 'result' do
      subject { response.data.first }

      it { should have(9).keys }

      its(:type) { should be_nil }
      its(:id) { should == 'ZnS2BI' }
      its(:name) { should == 'IPA' }
      its(:abv) { should == '6' }
      its(:is_organic) { should == 'N' }
      its(:'style.id') { should == 49 }
      its(:'style.abv_max') { should == '7.5' }
      its(:'style.abv_min') { should == '5.5' }
      its(:'style.bjcp_subcategory') { should == 'B' }
      its(:'style.category.id') { should == 14 }
      its(:'style.category.name') { should == 'India Pale Ale (IPA)' }
      its(:'style.category.bjcp_category') { should == '14' }
      its(:'style.category.create_date') { should == '2012-04-05 04:00:04' }
      its(:'style.category_id') { should == 14 }
      its(:'style.name') { should == 'American IPA' }
      its(:'style.fg_max') { should == '1.018' }
      its(:'style.fg_min') { should == '1.01' }
      its(:'style.ibu_max') { should == '70' }
      its(:'style.ibu_min') { should == '40' }
      its(:'style.og_max') { should == '1.075' }
      its(:'style.og_min') { should == '1.056' }
      its(:'style.srm_max') { should == '15' }
      its(:'style.srm_min') { should == '6' }
      its(:'style.simple_url') { should == 'american-ipa' }
      its(:'style.create_date') { should == '2012-04-05 04:00:04' }
      its(:style_id) { should == 49 }
      its(:status) { should == 'verified' }
      its(:status_display) { should == 'Verified' }
      its(:create_date) { should == '2012-04-05 04:01:50' }
    end
  end

  {
    beers: 'beer',
    breweries: 'brewery',
    guilds: 'guild',
    events: 'event'
  }.each do |method, type|
    context "##{method}" do
      subject { described_class.new(client) }

      specify do
        results = mock(:results)
        subject.should_receive(:all).with(type: type, q: 'IPA').and_return(results)
        subject.send(method, q: 'IPA').should == results
      end
    end
  end
end
