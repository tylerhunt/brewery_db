require 'spec_helper'

describe BreweryDB::Client do
  context '#config' do
    subject { described_class.new.config }

    it { should be_a(BreweryDB::Config) }

    its(:adapter) { should == BreweryDB::Config::ADAPTER }
    its(:api_key) { should == nil }
    its(:endpoint) { should == BreweryDB::Config::ENDPOINT }
  end

  context '#configure' do
    subject do
      described_class.new.configure do |config|
        config.adapter = :typhoeus
        config.api_key = 'A1029384756B'
        config.endpoint = 'http://api.playground.brewerydb.com'
      end
    end

    its(:adapter) { should == :typhoeus }
    its(:api_key) { should == 'A1029384756B' }
    its(:endpoint) { should == 'http://api.playground.brewerydb.com' }
  end

  context '#beers' do
    subject { described_class.new }

    specify do
      beers = BreweryDB::Resources::Beers.new(subject)
      BreweryDB::Resources::Beers.should_receive(:new).and_return(beers)
      subject.beers.should == beers
    end
  end

  context '#categories' do
    subject { described_class.new }

    specify do
      categories = BreweryDB::Resources::Categories.new(subject)
      BreweryDB::Resources::Categories.should_receive(:new).and_return(categories)
      subject.categories.should == categories
    end
  end

  context '#breweries' do
    subject { described_class.new }

    specify do
      breweries = BreweryDB::Resources::Breweries.new(subject)
      BreweryDB::Resources::Breweries.should_receive(:new).and_return(breweries)
      subject.breweries.should == breweries
    end
  end

  context '#styles' do
    subject { described_class.new }

    specify do
      styles = BreweryDB::Resources::Styles.new(subject)
      BreweryDB::Resources::Styles.should_receive(:new).and_return(styles)
      subject.styles.should == styles
    end
  end
end
