require 'spec_helper'
require 'ostruct'

describe BreweryDB::ResponseHandler do
  context '#response' do
    let(:body) { OpenStruct.new(data: 'data') }
    let(:response) { stub(body: body) }

    subject { described_class.new(response) }

    it 'returns the response body data if the status is 200' do
      response.stub(:status) { 200 }
      subject.response.should eq body.data
    end

    it 'raises a bad request error if the status is 400' do
      response.stub(:status) { 400 }
      response.stub_chain(:body, :error_message) { 'error' }
      expect { subject.response }.to raise_error(BreweryDB::BadRequest, 'error')
    end

    it 'raises a not found error if the status is 404' do
      response.stub(:status) { 404 }
      response.stub_chain(:body, :error_message) { 'error' }
      expect { subject.response }.to raise_error(BreweryDB::NotFound, 'error')
    end

    it 'raises an error with the status if the status is unknown' do
      response.stub(:status) { 500 }
      expect { subject.response }.to raise_error(BreweryDB::Error, '500')
    end
  end
end
