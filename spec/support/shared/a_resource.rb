shared_examples_for 'a resource', :resource do
  let(:api_key) { ENV['BREWERY_DB_API_KEY'] }
  let(:client) { BreweryDB::Client.new { |config| config.api_key = api_key } }
  let(:config) { client.config }
end
