module BreweryDB
  module Resources
    class Glassware < Resource
      def all(params={})
        get('glassware', params)
      end

      def find(id, params={})
        get('glass/%s' % id, params)
      end
    end
  end
end
