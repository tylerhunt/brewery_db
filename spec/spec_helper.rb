require 'dotenv'
Dotenv.load
require 'brewery_db'

# This API key is only for use when developing this client library. Please do
# not use it in your own applications. You may request your own API key here:
# http://www.brewerydb.com/developers
ENV['BREWERY_DB_API_KEY'] ||= '1c394d8947e4a5873920d2333c9e9364'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each do |file|
  require(file)
end
