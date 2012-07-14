module BreweryDB
  module Resources
    class Styles < Resource
      def all(params={})
        get('styles', params)
      end

      def find(id, params={})
        get('style/%s' % id, params)
      end
    end
  end
end
