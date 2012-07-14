# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Glassware, :resource do
  context '#all', vcr: cassette_options do
    let(:response) { described_class.new(config).all }

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

  context '#find', vcr: cassette_options do
    let(:response) { described_class.new(config).find(1) }

    subject { response }

    it { should have(3).keys }

    its(:id) { should == 1 }
    its(:name) { should == 'Flute' }
    its(:create_date) { should == '2012-01-03 02:41:33' }
  end
end
