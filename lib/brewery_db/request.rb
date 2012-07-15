module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def body
      response_body = response.body

      if response_body.number_of_pages
        Collection.new(response_body.data)
      else
        response_body.data
      end
    end

    def response
      @connection.get(@path, @params)
    end
    private :response
  end
end
