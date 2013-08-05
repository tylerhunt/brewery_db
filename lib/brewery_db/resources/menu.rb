module BreweryDB
  module Resources
    class Menu < Resource
      def beer_availability(params={})
        get_menu('beer-availability', params).collection
      end

    private

      def get_menu(name, params)
        get("menu/#{name}", params)
      end
    end
  end
end
