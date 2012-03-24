require 'brewery_db/version'

module BreweryDB
  class Config
    DEFAULT_ENDPOINT = 'http://api.brewerydb.com/v2'

    attr_accessor :endpoint
    attr_accessor :api_key

    def initialize
      self.endpoint = DEFAULT_ENDPOINT
    end
  end

  class Client
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      config
    end
  end

  class << self
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
end
