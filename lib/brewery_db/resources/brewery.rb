module BreweryDB
  module Resources
    class Brewery < Resource
      attr_reader :id

      def initialize(config, options={})
        @id = options[:id]
        super(config)
      end

      def beers(params={})
        get("brewery/#{id}/beers", params).collection
      end
    end
  end
end
