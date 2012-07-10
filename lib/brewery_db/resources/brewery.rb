module BreweryDB
  module Resources
    class Brewery
      include Resource

      attr :id

      def initialize(client, options={})
        @id = options[:id]
        super
      end

      def beers(params={})
        get("brewery/#{id}/beers", params)
      end
    end
  end
end
