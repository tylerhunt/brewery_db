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

    def categories
      @categories ||= Resources::Categories.new(self)
    end

    def glassware
      @glassware ||= Resources::Glassware.new(self)
    end

    def styles
      @styles ||= Resources::Styles.new(self)
    end
  end
end
