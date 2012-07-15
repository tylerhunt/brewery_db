require 'spec_helper'

describe BreweryDB::ResponseHandler do
  context '#on_complete' do
    let(:error_body) { stub(error_message: 'error') }

    it 'does not raise an error if the status is 200' do
      expect { subject.on_complete(status: 200) }.to_not raise_error
    end

    it 'raises a bad request error if the status is 400' do
      expect {
        subject.on_complete(status: 400, body: error_body)
      }.to raise_error(BreweryDB::BadRequest, 'error')
    end

    it 'raises a not found error if the status is 404' do
      expect {
        subject.on_complete(status: 404, body: error_body)
      }.to raise_error(BreweryDB::NotFound, 'error')
    end

    it 'raises an error with the status if the status is unknown' do
      expect {
        subject.on_complete(status: 500)
      }.to raise_error(BreweryDB::Error, '500')
    end
  end
end
