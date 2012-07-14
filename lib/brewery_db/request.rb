module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def response
      @connection.get(@path, @params)
    end
  end
end
