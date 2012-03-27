require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Resource
    def initialize(client)
      @client = client
    end

    # TODO: Make this private once the appropriate test coverage is in place.
    def connection
      # TODO: Use an instance-level option once faraday_middleware is updated.
      FaradayMiddleware::Mashify.mash_class = Response

      Faraday.new(
        url: @client.config.endpoint,
        headers: { user_agent: @client.config.user_agent }
      ) do |connection|
        connection.response(:mashify)
        connection.response(:json, content_type: /\bjson$/)

        connection.adapter(@client.config.adapter)
      end
    end

    def get(path, params={})
      connection.get(path, default_params.merge(params)).body
    end
    private :get

    def default_params
      { key: @client.config.api_key }
    end
    private :default_params
  end
end
