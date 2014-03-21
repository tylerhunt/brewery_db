require 'spec_helper'

describe BreweryDB::Config do
  subject(:config) { described_class.new }

  context 'defaults' do
    it { expect(config.adapter).to eq(Faraday.default_adapter) }

    it { expect(config.api_key).to be_nil }

    it { expect(config.base_uri).to eq(described_class::BASE_URI) }

    it { expect(config.timeout).to eq(described_class::TIMEOUT) }

    it { expect(config.user_agent).to eq(described_class::USER_AGENT) }
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
