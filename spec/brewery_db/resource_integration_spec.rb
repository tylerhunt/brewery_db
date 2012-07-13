# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resource, :resource do
  context '#get', vcr: cassette_options do
    let(:resource) { Class.new { include BreweryDB::Resource }.new(client) }

    context 'an OK request' do
      subject { resource.send(:get, 'breweries', name: 'Rogue Ales').first }

      its(:name) { should == 'Rogue Ales' }
    end

    context 'a bad request' do
      subject { resource.send(:get, 'breweries') }

      its(:errorMessage) { should match /data.*invalid/ }
      its(:status) { should eq 'failure' }
    end

    context 'a not found request' do
      subject { resource.send(:get, 'brewery/NOT_FOUND') }

      its(:errorMessage) { should match /not\s+found/ }
      its(:status) { should eq 'failure' }
    end
  end
end
