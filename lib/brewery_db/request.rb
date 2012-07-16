module BreweryDB
  class Request
    def initialize(connection, path, params={})
      @connection = connection
      @path = path
      @params = params
    end

    def collection
      Collection.new(data, page_count, self)
    end

    def data
      body.data
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

    def body
      @body ||= response.body
    end
    private :body

    def page_count
      body.number_of_pages
    end
    private :page_count

    def response
      @connection.get(@path, @params)
    end
    private :response
  end
end
