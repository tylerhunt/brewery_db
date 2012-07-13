require 'spec_helper'

describe BreweryDB::ResponseHandler do
  it { should be_a(Faraday::Response::Middleware) }

  context '#on_complete' do
    let(:body) { stub(data: 'data') }
    let(:env) { { body: body } }

    it 'returns the response body data if the status is "success"' do
      body.stub(:status) { 'success' }

      expect {
        subject.on_complete(env)
      }.to change { env[:body] }.from(body).to(body.data)
    end

    it 'returns the response body data if the status is not "success"' do
      body.stub(:status) { 'failure' }

      expect {
        subject.on_complete(env)
      }.to_not change { env[:body] }
    end
  end
end
