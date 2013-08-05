module BreweryDB
  module Resources
    class Locations < Resource
      def all(params={})
        get('locations', params).paginated_collection
      end

      def find(id, params={})
        get('location/%s' % id, params).data
      end
    end
  end
end
