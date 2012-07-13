# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Beers do
  include_context 'a resource'

  context '#all', vcr: cassette_options do
    let(:response) { described_class.new(client).all(abv: '5.5') }

    subject { response }

    it { should be_a(Array) }
    it { should have(50).results }

    context 'result' do
      subject { response.first }

      it { should have(14).keys }

      its(:id) { should == 'VjQIQW' }
      its(:name) { should == '2011 Christmas Ale' }
      its(:description) { should == "Every year since 1975 the brewers at Anchor have brewed a distinctive and unique Christmas Ale, which is available from early November to mid-January. The Ale's recipe is different every year—as is the tree on the label—but the intent with which we offer it remains the same: joy and celebration of the newness of life." }
      its(:abv) { should == '5.5' }
      its(:glassware_id) { should == 5 }
      its(:available_id) { should == 4 }
      its(:is_organic) { should == 'N' }
      its(:status) { should == 'verified' }
      its(:status_display) { should == 'Verified' }
      its(:'glass.id') { should == 5 }
      its(:'glass.name') { should == 'Pint' }
      its(:'glass.create_date') { should == '2012-03-26 04:00:04' }
      its(:'available.name') { should == 'Seasonal' }
      its(:'available.description') { should == 'Available at the same time of year, every year.' }
      its(:style_id) { should == 98 }
      its(:'style.id') { should == 98 }
      its(:'style.category.id') { should == 23 }
      its(:'style.category.name') { should == 'Specialty Beer' }
      its(:'style.category.bjcp_category') { should == '23' }
      its(:'style.category.create_date') { should == '2012-03-26 04:00:04' }
      its(:'style.category_id') { should == 23 }
      its(:'style.name') { should == 'Specialty Beer' }
      its(:'style.simple_url') { should == 'specialty-beer' }
      its(:'style.create_date') { should == '2012-03-26 04:00:04' }
      its(:create_date) { should == '2012-03-26 04:00:59' }
      its(:update_date) { should be_nil }
    end
  end

  context '#find', vcr: cassette_options do
    let(:response) { described_class.new(client).find('vYlBZQ') }

    subject { response }

    it { should have(16).keys }

    its(:id) { should == 'vYlBZQ' }
    its(:name) { should == 'Peacemaker' }
    its(:description) { should == 'Peace is a dangerous thing.  Peacemaker is a west coast style American Pale Ale that uses several hop varieties to produces a unique and bountiful hop aroma with well balanced bitterness.  A special blend of American and European malts make this a very well rounded, characterful beer.' }
    its(:abv) { should == '5.7' }
    its(:glassware_id) { should == 5 }
    its(:available_id) { should == 1 }
    its(:is_organic) { should == 'N' }
    its(:status) { should == 'verified' }
    its(:status_display) { should == 'Verified' }
    its(:'glass.id') { should == 5 }
    its(:'glass.name') { should == 'Pint' }
    its(:'glass.create_date') { should == '2012-03-26 04:00:04' }
    its(:'available.name') { should == 'Year Round' }
    its(:'available.description') { should == 'Available year round as a staple beer.' }
    its(:style_id) { should == 33 }
    its(:'style.id') { should == 33 }
    its(:'style.category.id') { should == 10 }
    its(:'style.category.name') { should == 'American Ale' }
    its(:'style.category.bjcp_category') { should == '10' }
    its(:'style.category.create_date') { should == '2012-03-26 04:00:04' }
    its(:'style.category_id') { should == 10 }
    its(:'style.name') { should == 'American Pale Ale' }
    its(:'style.simple_url') { should == 'american-pale-ale' }
    its(:'style.create_date') { should == '2012-03-26 04:00:04' }
    its(:create_date) { should == '2012-03-26 04:02:10' }
    its(:update_date) { should == '2012-03-26 04:38:49' }
  end
end
