require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Client
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      config
    end

    def beers
      @beers ||= Resources::Beers.new(self)
    end

    def breweries
      @breweries ||= Resources::Breweries.new(self)
    end
  end
end
