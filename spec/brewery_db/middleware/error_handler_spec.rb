require 'spec_helper'

describe BreweryDB::Middleware::ErrorHandler do
  context '#on_complete' do
    let(:error_body) { stub(error_message: 'error') }
    let(:over_ratelimit) { { 'x-ratelimit-remaining' => '0' } }

    it 'does not raise an error when the status is 200' do
      expect { subject.on_complete(status: 200) }.to_not raise_error
    end

    it 'raises a bad request error when the status is 400' do
      expect {
        subject.on_complete(status: 400, body: error_body)
      }.to raise_error(BreweryDB::BadRequest, 'error')
    end

    it 'raises an rate limit exceeded error when the status is 401 and x-ratelimit-remaining is 0' do
      expect {
        subject.on_complete(status: 401, body: error_body, response_headers: over_ratelimit)
      }.to raise_error(BreweryDB::RateLimitExceeded, 'error')
    end

    it 'raises an unauthorized error when the status is 401 and not over rate limit' do
      expect {
        subject.on_complete(status: 401, body: error_body, response_headers: {})
      }.to raise_error(BreweryDB::Unauthorized, 'error')
    end

    it 'raises a not found error when the status is 404' do
      expect {
        subject.on_complete(status: 404, body: error_body)
      }.to raise_error(BreweryDB::NotFound, 'error')
    end

    it 'raises an error with the status when the status is unknown' do
      expect {
        subject.on_complete(status: 500)
      }.to raise_error(BreweryDB::Error, '500')
    end
  end
end
