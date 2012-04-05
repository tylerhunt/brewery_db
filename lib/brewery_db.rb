require 'brewery_db/version'

module BreweryDB
  autoload :Client, 'brewery_db/client'
  autoload :Config, 'brewery_db/config'
  autoload :Resource, 'brewery_db/resource'
  autoload :Response, 'brewery_db/response'

  module Resources
    autoload :Beers, 'brewery_db/resources/beers'
    autoload :Breweries, 'brewery_db/resources/breweries'
    autoload :Categories, 'brewery_db/resources/categories'
    autoload :Styles, 'brewery_db/resources/styles'
  end

  extend self

  def respond_to?(method, include_private=false)
    super || client.respond_to?(method, include_private)
  end

  def method_missing(method, *args, &block)
    if client.respond_to?(method)
      client.send(method, *args, &block)
    else
      super
    end
  end

  def client
    @client ||= Client.new
  end
  private :client
end
