require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Breweries
    def initialize(client)
      @client = client
    end

    def all(params={})
      @client.get('/breweries', params)
    end
  end
end
