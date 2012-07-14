module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def response
      ResponseHandler.new(get).response
    end

    def get
      @connection.get(@path, @params)
    end
    private :get
  end
end
