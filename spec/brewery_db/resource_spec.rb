require 'spec_helper'

describe BreweryDB::Resource do
  let(:client) { BreweryDB::Client.new }

  context '.new' do
    it 'accepts a client' do
      described_class.new(client).should be_a(described_class)
    end

    it 'raises an exception without a client' do
      expect { described_class.new }.to raise_error
    end
  end
end
