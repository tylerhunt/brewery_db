module BreweryDB
  module Resources
    class Hops < Resource
      def all(params={})
        get('hops', params).data
      end

      def find(id, params={})
        get('hop/%s' % id, params).data
      end
    end
  end
end
