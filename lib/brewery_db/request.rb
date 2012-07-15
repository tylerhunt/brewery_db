module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def response
      body = get.body

      if body.number_of_pages
        Collection.new(body.data)
      else
        body.data
      end
    end

    def get
      @connection.get(@path, @params)
    end
    private :get
  end
end
