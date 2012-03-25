require 'spec_helper'

describe BreweryDB::Config do
  {
    ADAPTER: Faraday.default_adapter,
    ENDPOINT: 'http://api.brewerydb.com/v2'
  }.each do |constant, value|
    context constant do
      subject { described_class.const_get(constant) }

      it { should == value }
    end
  end

  context 'defaults' do
    its(:endpoint) { should == described_class::ENDPOINT }
    its(:api_key) { should == nil }
    its(:adapter) { should == described_class::ADAPTER }
  end

  context '#adapter=' do
    specify do
      expect {
        subject.adapter = :typhoeus
      }.to change(subject, :adapter).to(:typhoeus)
    end
  end

  context '#api_key=' do
    specify do
      expect {
        subject.api_key = 'A1029384756B'
      }.to change(subject, :api_key).to('A1029384756B')
    end
  end

  context '#endpoint=' do
    specify do
      expect {
        subject.endpoint = 'http://api.playground.brewerydb.com'
      }.to change(subject, :endpoint).to('http://api.playground.brewerydb.com')
    end
  end
end
