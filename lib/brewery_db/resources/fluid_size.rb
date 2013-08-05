module BreweryDB
  module Resources
    class FluidSize < Resource
      def all(params={})
        get('fluidsizes', params).data
      end

      def find(id, params={})
        get('fluidsize/%s' % id, params).data
      end
    end
  end
end
