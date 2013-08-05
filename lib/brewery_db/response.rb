module BreweryDB
  class Response
    def initialize(body, request)
      @body = body
      @request = request
    end

    def data
      @body.data
    end

    def collection
      Collection.new(self)
    end

    def paginated_collection
      PaginatedCollection.new(self)
    end

    def next_page
      @request.next_page.response
    end

    def page_number
      @body.current_page
    end

    def page_count
      @body.number_of_pages
    end

    def count
      @body.total_results
    end
  end
end
