# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resources::Categories, :resource do
  context '#all', :vcr do
    let(:response) { described_class.new(config).all }

    it 'fetches all of the cagtegories at once' do
      response.length.should eq 12
    end
  end

  context '#find', :vcr do
    let(:response) { described_class.new(config).find(1) }

    it 'fetches only the category asked for' do
      response.id.should == 1
    end
  end
end
