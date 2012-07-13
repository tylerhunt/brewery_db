require 'faraday_middleware'

module BreweryDB
  module Resource
    include Relax::Resource

    def get(path, params={})
      Request.new(connection, :get, path, default_params.merge(params)).response
    end
    private :get

    def default_params
      { key: @client.config.api_key }
    end
    private :default_params

    def connection
      super do |builder|
        builder.response(:mashify, mash_class: Mash)
        builder.response(:json, content_type: /\bjson$/)
      end
    end
    private :connection
  end
end
