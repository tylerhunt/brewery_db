# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Categories do
  it_behaves_like 'a resource' do
    context '#all' do
      let(:response) { described_class.new(client).all }

      subject { response }

      its(:current_page) { should be_nil }
      its(:number_of_pages) { should be_nil }
      its(:status) { should == 'success' }
      its(:data) { should be_a(Array) }
      its(:data) { should have(28).results }

      context 'result' do
        subject { response.data.first }

        it { should have(4).keys }

        its(:id) { should == 1 }
        its(:name) { should == 'Light Lager' }
        its(:bjcp_category) { should == '1' }
        its(:create_date) { should == '2012-04-05 04:00:04' }
      end
    end

    context '#find' do
      let(:response) { described_class.new(client).find(1) }

      subject { response }

      its(:status) { should == 'success' }

      context 'data' do
        subject { response.data }

        it { should have(4).keys }

        its(:id) { should == 1 }
        its(:name) { should == 'Light Lager' }
        its(:bjcp_category) { should == '1' }
        its(:create_date) { should == '2012-04-05 04:00:04' }
      end
    end
  end
end
