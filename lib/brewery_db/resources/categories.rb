module BreweryDB
  module Resources
    class Categories < Resource
      def all(params={})
        get('categories', params).collection
      end

      def find(id, params={})
        get('category/%s' % id, params).data
      end
    end
  end
end
