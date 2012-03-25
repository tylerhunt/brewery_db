require 'spec_helper'

describe BreweryDB::Config do
  {
    ADAPTER: Faraday.default_adapter,
    ENDPOINT: 'http://api.brewerydb.com/v2',
    MIDDLEWARE: [],
    USER_AGENT: "BreweryDB Ruby Gem #{BreweryDB::VERSION}"
  }.each do |constant, value|
    context constant do
      subject { described_class.const_get(constant) }

      it { should == value }
    end
  end

  context 'defaults' do
    its(:adapter) { should == described_class::ADAPTER }
    its(:api_key) { should == nil }
    its(:endpoint) { should == described_class::ENDPOINT }
    its(:middleware) { should == described_class::MIDDLEWARE }
    its(:user_agent) { should == described_class::USER_AGENT }
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

  context '#middleware=' do
    specify do
      expect {
        subject.middleware << Faraday::Response::Logger
      }.to change(subject, :middleware).to([Faraday::Response::Logger])
    end
  end

  context '#user_agent=' do
    specify do
      expect {
        subject.user_agent = 'A BreweryDB Application'
      }.to change(subject, :user_agent).to('A BreweryDB Application')
    end
  end
end
