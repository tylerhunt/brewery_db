module BreweryDB
  class Config
    ENDPOINT = 'http://api.brewerydb.com/v2'

    attr_accessor :endpoint
    attr_accessor :api_key

    def initialize
      self.endpoint = ENDPOINT
    end
  end
end
