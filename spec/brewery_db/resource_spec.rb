require 'spec_helper'

describe BreweryDB::Resource do
  let(:client) { BreweryDB::Client.new }
  let(:resource) { Class.new { include BreweryDB::Resource }.new(client) }

  context '#connection' do
    before { client.config.api_key = 'secret' }

    subject { resource.send(:connection) }

    its(:params) { should == { 'key' => 'secret' } }

    context 'middleware' do
      let(:handlers) { subject.builder.handlers }

      [
        BreweryDB::ResponseHandler,
        FaradayMiddleware::Mashify,
        FaradayMiddleware::ParseJson,
        Faraday::Adapter::NetHttp
      ].each.with_index do |middleware, index|
        it "uses #{middleware}" do
          handlers.index(middleware).should == index
        end
      end
    end
  end
end
