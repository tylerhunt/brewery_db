shared_examples_for 'a resource' do
  let(:client) { BreweryDB::Client.new }
  let(:api_key) { ENV['BREWERY_DB_API_KEY'] }

  before { client.config.api_key = api_key }

  around do |example|
    name = described_class.name.split(/::/).last.downcase
    VCR.use_cassette(name, erb: { api_key: api_key }, &example)
  end
end
