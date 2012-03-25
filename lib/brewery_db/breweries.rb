require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Breweries < Resource
    def all(params={})
      get('/breweries', params)
    end
  end
end
