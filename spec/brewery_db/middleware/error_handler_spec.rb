require 'spec_helper'

describe BreweryDB::Middleware::ErrorHandler do
  subject(:handler) { described_class.new }

  describe '#on_complete' do
    let(:error_body) { double(error_message: error_message, status: 'failure') }
    let(:error_message) { 'error' }
    let(:over_ratelimit) { { 'x-ratelimit-remaining' => '0' } }

    it 'does not raise an error when the status is 200' do
      expect { handler.on_complete(status: 200) }.to_not raise_error
    end

    it 'raises a bad request error when the status is 400' do
      expect {
        handler.on_complete(status: 400, body: error_body)
      }.to raise_error(BreweryDB::BadRequest, 'Status => 400. Error message => error')
    end

    it 'raises an rate limit exceeded error when the status is 401 and x-ratelimit-remaining is 0' do
      expect {
        handler.on_complete(status: 401, body: error_body, response_headers: over_ratelimit)
      }.to raise_error(BreweryDB::RateLimitExceeded, 'Status => 401. Error message => error')
    end

    it 'raises an unauthorized error when the status is 401 and not over rate limit' do
      expect {
        handler.on_complete(status: 401, body: error_body, response_headers: {})
      }.to raise_error(BreweryDB::Unauthorized, 'Status => 401. Error message => error')
    end

    it 'raises a not found error when the status is 404' do
      expect {
        handler.on_complete(status: 404, body: error_body)
      }.to raise_error(BreweryDB::NotFound, 'Status => 404. Error message => error')
    end

    context 'the status is unknown' do
      let(:error_message) { 'SQLSTATE[40001]: Serialization failure: 1213 Deadlock found when trying to get lock; try restarting transaction' }

      it 'raises an error with the status and error message' do
        expect {
          handler.on_complete(status: 500, body: error_body)
        }.to raise_error(BreweryDB::Error, "Status => 500. Error message => #{error_message}")
      end
    end
  end
end
