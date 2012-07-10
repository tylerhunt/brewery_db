module BreweryDB
  module Config
    BASE_URI = 'http://api.brewerydb.com/v2'
    USER_AGENT = "BreweryDB Ruby Gem #{BreweryDB::VERSION}"

    # The BreweryDB API key used to authenticate requests.
    # @return [String]
    attr :api_key, true
  end
end
