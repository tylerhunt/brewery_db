module BreweryDB
  module Resources
    class Glassware < Resource
      def all(params={})
        get('glassware', params).data
      end

      def find(id, params={})
        get('glass/%s' % id, params).data
      end
    end
  end
end
