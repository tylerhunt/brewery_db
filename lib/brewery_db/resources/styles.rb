module BreweryDB
  module Resources
    class Styles < Resource
      def all(params={})
        get('styles', params).collection
      end

      def find(id, params={})
        get('style/%s' % id, params).data
      end
    end
  end
end
