require 'faraday'

module BreweryDB
  class Config
    ADAPTER = Faraday.default_adapter
    ENDPOINT = 'http://api.brewerydb.com/v2'
    MIDDLEWARE = []
    USER_AGENT = "BreweryDB Ruby Gem #{BreweryDB::VERSION}"

    attr_accessor :adapter
    attr_accessor :api_key
    attr_accessor :endpoint
    attr_accessor :user_agent

    def initialize
      self.adapter = ADAPTER
      self.endpoint = ENDPOINT
      self.user_agent = USER_AGENT
    end
  end
end
