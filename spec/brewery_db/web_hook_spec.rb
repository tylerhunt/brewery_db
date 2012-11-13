require 'spec_helper'

describe BreweryDB::WebHook do
  let(:action) { 'edit' }
  let(:attribute) { 'beer' }
  let(:attribute_id) { 'x6bRxw' }
  let(:key) { 'cfae72cf7db09b7508905573c174baf1f026c051' }
  let(:nonce) { '576a8003ab8936d99fb104401141d613' }
  let(:sub_action) { 'none' }
  let(:timestamp) { '1350573527' }

  let(:brewery_db_payload) {
    {
      key: key,
      nonce: nonce,
      attribute: attribute,
      attributeId: attribute_id,
      action: action,
      subAction: sub_action,
      timestamp: timestamp
    }
  }

  subject(:web_hook) { described_class.new(brewery_db_payload) }

  describe '.new' do
    it 'extracts the action' do
      expect(web_hook.action).to eq(action)
    end

    it 'extracts the attribute' do
      expect(web_hook.attribute).to eq(attribute)
    end

    it 'extracts the attribute ID' do
      expect(web_hook.attribute_id).to eq(attribute_id)
    end

    it 'extracts the key' do
      expect(web_hook.key).to eq(key)
    end

    it 'extracts the nonce' do
      expect(web_hook.nonce).to eq(nonce)
    end

    it 'extracts the sub-action' do
      expect(web_hook.sub_action).to eq(sub_action)
    end

    it 'extracts the timestamp' do
      expect(web_hook.timestamp).to eq(timestamp)
    end
  end

  describe '#valid?' do
    let(:api_key) { ENV['BREWERY_DB_API_KEY'] }

    it 'is valid for a legit key and nonce' do
      expect(web_hook).to be_valid(api_key)
    end

    context 'invalid nonce' do
      let(:nonce) { '316d141104401bf99d6398ba3008a675' }

      it 'is not valid' do
        expect(web_hook).to_not be_valid(api_key)
      end
    end

    context 'invalid key' do
      let(:key) { '150c620f1fab471c3755098057b90bd7fc27eafc' }

      it 'is not valid' do
        expect(web_hook).to_not be_valid(api_key)
      end
    end
  end
end
