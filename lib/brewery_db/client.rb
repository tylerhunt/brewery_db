require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Client
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      config
    end

    def breweries
      @breweries ||= Breweries.new(self)
    end

    def connection
      # TODO: Convert to use instance-level options once faraday_middleware is
      # updated to allow it.
      FaradayMiddleware::Mashify.mash_class = Response

      Faraday.new(
        url: config.endpoint,
        headers: { user_agent: config.user_agent }
      ) do |connection|
        connection.response(:mashify)
        connection.response(:json, content_type: /\bjson$/)

        connection.adapter(config.adapter)
      end
    end
  end
end
