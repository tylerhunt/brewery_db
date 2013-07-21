require 'spec_helper'

describe BreweryDB::Config do
  subject(:config) { described_class.new }

  context 'defaults' do
    its(:adapter) { should eq Faraday.default_adapter }
    its(:api_key) { should be_nil }
    its(:base_uri) { should eq described_class::BASE_URI }
    its(:timeout) { should eq described_class::TIMEOUT }
    its(:user_agent) { should eq described_class::USER_AGENT }
  end

  context '#adapter=' do
    it do
      expect {
        config.adapter = :typhoeus
      }.to change(config, :adapter).to(:typhoeus)
    end
  end

  context '#api_key=' do
    it do
      expect {
        config.api_key = 'secret'
      }.to change(config, :api_key).to('secret')
    end
  end

  context '#base_uri=' do
    it do
      expect {
        config.base_uri = 'http://example.com'
      }.to change(config, :base_uri).to('http://example.com')
    end
  end

  context 'timeout=' do
    it do
      expect {
        config.timeout = 42
      }.to change(config, :timeout).to(42)
    end
  end

  context 'user_agent=' do
    it do
      expect {
        config.user_agent = 'Brewdega'
      }.to change(config, :user_agent).to('Brewdega')
    end
  end
end
