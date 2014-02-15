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

        def paginated_list
          get('breweries', established: 2006).paginated_collection
        end

        def not_found
          get('brewery/NOT_FOUND').data
        end
      }.new(config)
    end


    context 'an OK request' do
      it 'returns the data' do
        expect(resource.ok.first.name).to eq('Rogue Ales')
      end
    end

    context 'a list of resources' do
      it 'can be enumerated' do
        expect(resource.list.inject(0) { |tally, r| tally + 1 }).to eq(50)
      end

      it 'can be paginated' do
        expect(resource.list.paginated.inject(0) { |tally, r| tally + 1 }).to eq(72)
      end

      it 'knows the original response' do
        expect(resource.list.response).to be_instance_of(BreweryDB::Response)
      end
    end

    context 'a paginated list of resources' do
      it 'can be enumerated' do
        expect(resource.paginated_list.
          inject(0) { |tally, r| tally + 1 }).to eq(72)
      end

      it 'can be converted to collection' do
        expect(resource.paginated_list.collection.
          inject(0) { |tally, r| tally + 1 }).to eq(50)
      end

      it 'knows the original response' do
        expect(resource.paginated_list.response).
          to be_instance_of(BreweryDB::Response)
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
