require 'faraday'

module BreweryDB
  class Config
    ENDPOINT = 'http://api.brewerydb.com/v2'
    MIDDLEWARE = []
    USER_AGENT = "BreweryDB Ruby Gem #{BreweryDB::VERSION}"

    attr_accessor :adapter
    attr_accessor :api_key
    attr_accessor :endpoint
    attr_accessor :user_agent

    def initialize
      self.adapter = Faraday.default_adapter
      self.endpoint = ENDPOINT
      self.user_agent = USER_AGENT
    end
  end
end
