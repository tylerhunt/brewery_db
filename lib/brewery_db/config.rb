module BreweryDB
  class Config
    ADAPTER = :net_http
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
