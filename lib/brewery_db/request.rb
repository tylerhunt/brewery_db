module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def body
      response_body = response.body

      if !@params[:p] && page_count = response_body.number_of_pages
        Collection.new(response_body.data, page_count, self)
      else
        response_body.data
      end
    end

    def page_number
      @params[:p] ||= 1
    end

    def page_number=(page_number)
      @params[:p] = page_number
    end

    def next_page
      self.page_number += 1
    end

    def response
      @connection.get(@path, @params)
    end
    private :response
  end
end
