module BreweryDB
  class Resource
    def initialize(client)
      @client = client
    end

    def get(path, params={})
      @client.connection.get(path, default_params.merge(params)).body
    end
    private :get

    def default_params
      { key: @client.config.api_key }
    end
    private :default_params
  end
end
