require 'faraday'

module BreweryDB
  class Client
    def config
      @config ||= Config.new
    end

    def configure
      yield(config)
      config
    end

    def connection
      Faraday.new(
        url: config.endpoint,
        headers: { user_agent: config.user_agent }
      ) do |connection|
        connection.adapter(config.adapter)
      end
    end
  end
end
