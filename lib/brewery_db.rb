require 'brewery_db/version'
require 'relax'

module BreweryDB
  extend Relax::Delegator[:client]

  autoload :Client, 'brewery_db/client'
  autoload :Config, 'brewery_db/config'
  autoload :Mash, 'brewery_db/mash'
  autoload :Request, 'brewery_db/request'
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

  # @return a memoized instance of the client
  # @!visibility private
  def self.client
    @client ||= Client.new
  end
  private_class_method :client
end
