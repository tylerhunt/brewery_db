module BreweryDB
  module Resources
    class Brewery < Resource
      attr :id

      def initialize(config, options={})
        @id = options[:id]
        super(config)
      end

      def beers(params={})
        get("brewery/#{id}/beers", params).data
      end
    end
  end
end
