# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Breweries do
  include_context 'a resource'

  context '#all', vcr: cassette_options do
    let(:response) { described_class.new(client).all(established: 2006) }

    subject { response }

    it { should be_a(Array) }
    it { should have(38).results }

    context 'result' do
      subject { response.first }

      it { should have(9).keys }

      its(:id) { should == 'Qt4daP' }
      its(:name) { should == '612 Brew LLC' }
      its(:description) { should == "At 612Brew, the newest beer company in the 612, we want to make your newest favorite beer you’ve never had.\n\nWith our operation moving to a larger location in Uptown, we have the opportunity to make and test out much larger batches of hand crafted beer and present them for you to try. You never know what we may brew next, a Porter, a Pilsner, a Bock or a Belgian. We are excited for each new beer that we make and hope you get excited to try them." }
      its(:website) { should == 'http://612brew.com/' }
      its(:established) { should == '2006' }
      its(:is_organic) { should == 'N' }
      its(:images) { should be_nil }
      its(:status) { should == 'verified' }
      its(:status_display) { should == 'Verified' }
      its(:create_date) { should == '2012-03-25 04:00:17' }
      its(:update_date) { should be_nil }
    end
  end

  context '#find', vcr: cassette_options do
    let(:response) { described_class.new(client).find('d1zSa7') }

    subject { response }

    it { should have(11).keys }

    its(:id) { should == 'd1zSa7' }
    its(:name) { should == 'Lonerider Brewing Company' }
    its(:description) { should == "We opened our doors on January 23rd, 2009 and since then we have been impressed with the enthusiasm of craft beer aficionados we meet daily. The craft brewing industry is booming and you can find a tremendous variety out there. North Carolina has undoubtedly become the Southern State for beer with Asheville reigning supreme and Raleigh/Durham/CH not far behind. We hope you continue to support the variety and encourage new brewers to experiment with and craft new styles for everybody’s pleasure.\n\n\"Effect change; don't be an audience. Walk your own path, and instead of thinking outside the box, imagine if there was no box.\"" }
    its(:website) { should == 'http://www.loneriderbeer.com/' }
    its(:established) { should == '2009' }
    its(:is_organic) { should == 'N' }
    its(:'images.icon') { should == 'http://s3.amazonaws.com/brewerydbapi/brewery/d1zSa7/upload_kwaFB7-icon.png' }
    its(:'images.medium') { should == 'http://s3.amazonaws.com/brewerydbapi/brewery/d1zSa7/upload_kwaFB7-medium.png' }
    its(:'images.large') { should == 'http://s3.amazonaws.com/brewerydbapi/brewery/d1zSa7/upload_kwaFB7-large.png' }
    its(:status) { should == 'verified' }
    its(:status_display) { should == 'Verified' }
    its(:create_date) { should == '2012-03-25 04:00:30' }
    its(:update_date) { should == '2012-03-25 04:40:10' }
  end

  context 'a bad request', vcr: cassette_options do
    subject { described_class.new(client) }

    it 'returns full body' do
      result = subject.find('NOSUCKEY')
      result.status.should == 'failure'
    end
  end
end
