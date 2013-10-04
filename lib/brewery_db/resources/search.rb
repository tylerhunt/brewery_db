module BreweryDB
  module Resources
    class Search < Resource
      def all(params={})
        get('search', params).paginated_collection
      end

      def beers(params={})
        all(params.merge(type: 'beer'))
      end

      def breweries(params={})
        all(params.merge(type: 'brewery'))
      end

      def guilds(params={})
        all(params.merge(type: 'guild'))
      end

      def events(params={})
        all(params.merge(type: 'event'))
      end

      def upc(params={})
        get('search/upc', params).paginated_collection
      end
    end
  end
end
