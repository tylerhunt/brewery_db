module BreweryDB
  module Resources
    class Menu < Resource
      def beer_availability(params={})
        get_menu('beer-availability', params).data
      end

      def get_menu(name, params)
        get("menu/#{name}", params)
      end
      private :get_menu
    end
  end
end

