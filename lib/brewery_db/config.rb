module BreweryDB
  class Config
    DEFAULT_ENDPOINT = 'http://api.brewerydb.com/v2'

    attr_accessor :endpoint
    attr_accessor :api_key

    def initialize
      self.endpoint = DEFAULT_ENDPOINT
    end
  end
end
