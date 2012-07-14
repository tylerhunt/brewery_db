require 'faraday'

module BreweryDB
  class Config
    BASE_URI = 'http://api.brewerydb.com/v2'
    USER_AGENT = "BreweryDB Ruby Gem #{BreweryDB::VERSION}"
    TIMEOUT = 60

    attr :adapter, true
    attr :api_key, true
    attr :base_uri, true
    attr :timeout, true
    attr :user_agent, true

    def initialize
      self.adapter = Faraday.default_adapter
      self.base_uri = BASE_URI
      self.timeout = TIMEOUT
      self.user_agent = USER_AGENT
    end
  end
end
