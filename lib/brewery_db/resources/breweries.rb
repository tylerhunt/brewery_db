module BreweryDB
  module Resources
    class Breweries
      include Resource

      def all(params={})
        get('breweries', params)
      end

      def find(id, params={})
        get('brewery/%s' % id, params)
      end
    end
  end
end
