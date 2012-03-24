require 'brewery_db/version'

module BreweryDB
  autoload :Client, 'brewery_db/client'
  autoload :Config, 'brewery_db/config'

  extend self

  def client
    @client ||= Client.new
  end

  def method_missing(method, *args, &block)
    if client.respond_to?(method)
      client.send(method, *args, &block)
    else
      super
    end
  end
end
