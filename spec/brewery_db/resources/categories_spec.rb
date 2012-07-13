# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Categories do
  include_context 'a resource'

  context '#all', vcr: cassette_options do
    let(:response) { described_class.new(client).all }

    subject { response }

    it { should be_a(Array) }
    it { should have(28).results }

    context 'result' do
      subject { response.first }

      it { should have(4).keys }

      its(:id) { should == 1 }
      its(:name) { should == 'Light Lager' }
      its(:bjcp_category) { should == '1' }
      its(:create_date) { should == '2012-04-05 04:00:04' }
    end
  end

  context '#find', vcr: cassette_options do
    let(:response) { described_class.new(client).find(1) }

    subject { response }

    it { should have(4).keys }

    its(:id) { should == 1 }
    its(:name) { should == 'Light Lager' }
    its(:bjcp_category) { should == '1' }
    its(:create_date) { should == '2012-04-05 04:00:04' }
  end
end
