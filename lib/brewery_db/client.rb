module BreweryDB
  class Client
    include Relax::Client

    # Returns a new client instance and configures its default values.
    def initialize
      config.base_uri = Config::BASE_URI
      config.user_agent = Config::USER_AGENT
      config.extend(Config)
    end

    def beers
      @beers ||= Resources::Beers.new(self)
    end

    # Builds a new instance of the brewery resource.
    #
    # @param id [String] the brewery ID
    # @return <Resources::Breweries> an instance of the brewery resource
    def brewery(id)
      Resources::Brewery.new(self, id: id)
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

    def search
      @search ||= Resources::Search.new(self)
    end

    def styles
      @styles ||= Resources::Styles.new(self)
    end
  end
end
