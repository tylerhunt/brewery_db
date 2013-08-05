module BreweryDB
  module Resources
    class Breweries < Resource
      def all(params={})
        get('breweries', params).paginated_collection
      end

      def find(id, params={})
        get('brewery/%s' % id, params).data
      end
    end
  end
end
