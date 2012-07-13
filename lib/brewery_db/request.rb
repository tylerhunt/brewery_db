module BreweryDB
  class Request
    def initialize(connection, method, path, params={})
      @connection = connection
      @method = method
      @path = path
      @params = params
    end

    def response
      @connection.send(@method, @path, @params).body
    end
  end
end
