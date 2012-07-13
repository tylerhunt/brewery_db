require 'faraday_middleware'

module BreweryDB
  module Resource
    include Relax::Resource

    def get(path, params={})
      handle_response connection.get(path, default_params.merge(params))
    end
    private :get

    def handle_response(response)
      response.success? ? response.body.data : response.body
    end
    private :handle_response

    def default_params
      { key: @client.config.api_key }
    end
    private :default_params

    def connection
      super do |builder|
        builder.response(:mashify, mash_class: Response)
        builder.response(:json, content_type: /\bjson$/)
      end
    end
    private :connection
  end
end
