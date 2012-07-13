require 'faraday_middleware'

module BreweryDB
  module Resource
    include Relax::Resource

    def get(path, params={})
      Request.new(connection, :get, path, params).response
    end
    private :get

    def connection
      super do |builder|
        builder.params = default_params

        builder.use(ResponseHandler)
        builder.response(:mashify, mash_class: Mash)
        builder.response(:json, content_type: /\bjson$/)
      end
    end
    private :connection

    def default_params
      { key: @client.config.api_key }
    end
    private :default_params
  end
end
