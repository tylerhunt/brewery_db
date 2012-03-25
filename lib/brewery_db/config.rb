require 'faraday'

module BreweryDB
  class Config
    ADAPTER = Faraday.default_adapter
    ENDPOINT = 'http://api.brewerydb.com/v2'

    attr_accessor :adapter
    attr_accessor :api_key
    attr_accessor :endpoint

    def initialize
      self.adapter = ADAPTER
      self.endpoint = ENDPOINT
    end
  end
end
