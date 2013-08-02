module BreweryDB
  module Resources
    class Yeasts < Resource
      def all(params={})
        get('yeasts', params).data
      end

      def find(id, params={})
        get('yeast/%s' % id, params).data
      end
    end
  end
end
