# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resource, :resource do
  context '#get', vcr: cassette_options do
    let(:resource) do
      Class.new(BreweryDB::Resource) {
        def ok
          get('breweries', name: 'Rogue Ales').data
        end

        def bad_request
          get('breweries').data
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

    context 'a bad request' do
      it 'raises an exception' do
        expect { resource.bad_request }.to raise_error(BreweryDB::BadRequest)
      end

      it 'sets the exception message to the error message in the response' do
        exception = resource.bad_request rescue $!
        exception.message.should match /data.*invalid/
      end
    end

    context 'a not found request' do
      it 'raises an exception' do
        expect { resource.not_found }.to raise_error(BreweryDB::NotFound)
      end

      it 'sets the exception message to the error message in the response' do
        exception = resource.not_found rescue $!
        exception.message.should match /not\s+found/
      end
    end
  end
end
