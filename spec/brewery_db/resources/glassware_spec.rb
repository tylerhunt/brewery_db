# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Glassware do
  it_behaves_like 'a resource' do
    context '#all' do
      let(:response) { described_class.new(client).all }

      subject { response }

      it { should be_a(Array) }
      it { should have(15).results }

      context 'result' do
        subject { response.first }

        it { should have(3).keys }

        its(:id) { should == 1 }
        its(:name) { should == 'Flute' }
        its(:create_date) { should == '2012-01-03 02:41:33' }
      end
    end

    context '#find' do
      let(:response) { described_class.new(client).find(1) }

      subject { response }

      it { should have(3).keys }

      its(:id) { should == 1 }
      its(:name) { should == 'Flute' }
      its(:create_date) { should == '2012-01-03 02:41:33' }
    end
  end
end
