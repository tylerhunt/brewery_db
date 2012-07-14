module BreweryDB
  module Resources
    class Categories < Resource
      def all(params={})
        get('categories', params)
      end

      def find(id, params={})
        get('category/%s' % id, params)
      end
    end
  end
end
