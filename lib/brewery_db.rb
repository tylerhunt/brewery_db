require 'brewery_db/version'

module BreweryDB
  Error = Class.new(StandardError)
  BadRequest = Class.new(Error)
  NotFound = Class.new(Error)
  RateLimitExceeded = Class.new(Error)
  Unauthorized = Class.new(Error)

  autoload :Client, 'brewery_db/client'
  autoload :Collection, 'brewery_db/collection'
  autoload :Config, 'brewery_db/config'
  autoload :Mash, 'brewery_db/mash'
  autoload :Request, 'brewery_db/request'
  autoload :Resource, 'brewery_db/resource'
  autoload :Response, 'brewery_db/response'

  module Middleware
    autoload :ErrorHandler, 'brewery_db/middleware/error_handler'
  end

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
