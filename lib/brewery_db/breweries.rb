require 'faraday'
require 'faraday_middleware'

module BreweryDB
  module Breweries
    def breweries(params={})
      get('/breweries', params)
    end
  end
end
