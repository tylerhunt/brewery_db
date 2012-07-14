require 'spec_helper'

describe BreweryDB::ResponseHandler do
  context '#response' do
    let(:body) { stub(data: 'data') }
    let(:response) { stub(body: body) }

    subject { described_class.new(response) }

    it 'returns the response body data if the status is "success"' do
      body.stub(:status) { 'success' }
      subject.response.should eq body.data
    end

    it 'returns the response body data if the status is not "success"' do
      body.stub(:status) { 'failure' }
      subject.response.should eq body
    end
  end
end
