require 'brewery_db/version'

module BreweryDB
  autoload :Client, 'brewery_db/client'
  autoload :Config, 'brewery_db/config'
  autoload :Mash, 'brewery_db/mash'
  autoload :Resource, 'brewery_db/resource'
  autoload :ResponseHandler, 'brewery_db/response_handler'

  module Resources
    autoload :Beers, 'brewery_db/resources/beers'
    autoload :Breweries, 'brewery_db/resources/breweries'
    autoload :Brewery, 'brewery_db/resources/brewery'
    autoload :Categories, 'brewery_db/resources/categories'
    autoload :Glassware, 'brewery_db/resources/glassware'
    autoload :Search, 'brewery_db/resources/search'
    autoload :Styles, 'brewery_db/resources/styles'
  end
end
