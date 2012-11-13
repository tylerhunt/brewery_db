require 'faraday'

module BreweryDB
  class Config
    BASE_URI = 'http://api.brewerydb.com/v2'
    USER_AGENT = "BreweryDB Ruby Gem #{BreweryDB::VERSION}"
    TIMEOUT = 60

    attr_accessor :adapter
    attr_accessor :api_key
    attr_accessor :base_uri
    attr_accessor :timeout
    attr_accessor :user_agent

    def initialize
      self.adapter = Faraday.default_adapter
      self.base_uri = BASE_URI
      self.timeout = TIMEOUT
      self.user_agent = USER_AGENT
    end
  end
end
