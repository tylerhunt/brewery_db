require 'spec_helper'

describe BreweryDB::Resource do
  let(:client) { BreweryDB::Client.new }
  let(:resource) { Class.new { include BreweryDB::Resource }.new(client) }

  context '#get' do
    let(:connection) { stub }
    let(:response) { stub }

    before do
      client.configure { |config| config.api_key = 'secret' }
      connection.stub(:get) { response }
      resource.stub(:connection) { connection }

      response.stub(:success?) { false }
      response.stub(:body).and_return('body')
      response.body.stub(:data) { 'data' }
    end

    it 'delegates to the connection' do
      connection.should_receive(:get).with('path', key: 'secret') { response }
      resource.send(:get, 'path')
    end

    it 'merges in any additional parameters' do
      connection.should_receive(:get).with('path', key: 'secret', p: 1) { response }
      resource.send(:get, 'path', p: 1)
    end

    it 'returns the response body data if the request is successful' do
      response.stub(:success?) { true }
      resource.send(:get, 'path').should == 'data'
    end

    it 'returns the response body if the request is not successful' do
      response.stub(:success?) { false }
      resource.send(:get, 'path').should == 'body'
    end
  end

  context '#connection' do
    subject { resource.send(:connection) }

    context 'middleware' do
      let(:handlers) { subject.builder.handlers }

      [
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
