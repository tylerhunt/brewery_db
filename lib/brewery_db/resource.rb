require 'faraday'
require 'faraday_middleware'

module BreweryDB
  class Resource
    def initialize(config)
      @config = config
    end

  private

    def get(path, params={})
      Request.new(connection, path, params).response
    end

    def connection
      Faraday.new(request: { timeout: @config.timeout }) do |builder|
        builder.url_prefix = @config.base_uri
        builder.headers[:user_agent] = @config.user_agent
        builder.params[:key] = @config.api_key

        builder.response(:logger, @config.logger) if @config.logger
        builder.use(Middleware::ErrorHandler)
        builder.response(:mashify, mash_class: Mash)
        builder.response(:json, content_type: /\bjson$/)

        builder.adapter(@config.adapter)
      end
    end
  end
end
