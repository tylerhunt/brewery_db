module BreweryDB
  module Resources
    class Beers < Resource
      def all(params={})
        get('beers', params).paginated_collection
      end

      def find(id, params={})
        get('beer/%s' % id, params).data
      end
    end
  end
end
