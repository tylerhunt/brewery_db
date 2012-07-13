module BreweryDB
  class Request
    def initialize(connection, method, path, params={})
      @connection = connection
      @method = method
      @path = path
      @params = params
    end

    def response
      handle_response @connection.send(@method, @path, @params)
    end

    def handle_response(response)
      response.success? ? response.body.data : response.body
    end
    private :handle_response
  end
end
