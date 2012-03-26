require 'brewery_db/version'

module BreweryDB
  autoload :Breweries, 'brewery_db/breweries'
  autoload :Client, 'brewery_db/client'
  autoload :Config, 'brewery_db/config'
  autoload :Resource, 'brewery_db/resource'
  autoload :Response, 'brewery_db/response'

  extend self

  def client
    @client ||= Client.new
  end

  def respond_to?(method, include_private=false)
    client.respond_to?(method) || super
  end

  def method_missing(method, *args, &block)
    if client.respond_to?(method)
      client.send(method, *args, &block)
    else
      super
    end
  end
end
