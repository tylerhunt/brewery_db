module BreweryDB
  module Resources
    class Beers < Resource
      def all(params={})
        get('beers', params)
      end

      def find(id, params={})
        get('beer/%s' % id, params)
      end
    end
  end
end
