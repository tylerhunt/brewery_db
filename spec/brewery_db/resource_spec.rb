# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resource, :resource do
  context '#get', :vcr do
    let(:resource) do
      Class.new(BreweryDB::Resource) {
        def ok
          get('breweries', name: 'Rogue Ales').data
        end

        def list
          get('breweries', established: 2006).collection
        end

        def not_found
          get('brewery/NOT_FOUND').data
        end
      }.new(config)
    end

    context 'an OK request' do
      subject { resource.ok.first }

      its(:name) { should == 'Rogue Ales' }
    end

    context 'a list of resources' do
      it 'can be enumerated' do
        resource.list.inject(0) { |tally, r| tally + 1 }.should eq 66
      end
    end

    context 'a not found request' do
      it 'raises an exception' do
        expect { resource.not_found }.to raise_error(BreweryDB::NotFound)
      end

      it 'includes the response message in the error message' do
        exception = resource.not_found rescue $!
        expect(exception.message).to match(/could not be found/)
      end

      it 'includes the response status in the error message' do
        exception = resource.not_found rescue $!
        expect(exception.message).to match(/404/)
      end
    end
  end
end
