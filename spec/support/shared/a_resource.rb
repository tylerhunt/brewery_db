shared_examples_for 'a resource', :resource do
  let(:client) { BreweryDB::Client.new }
  let(:api_key) { ENV['BREWERY_DB_API_KEY'] }

  before { client.config.api_key = api_key }
end
