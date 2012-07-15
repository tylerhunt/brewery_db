module BreweryDB
  class ResponseHandler
    def initialize(response)
      @response = response
    end

    # Set the successful response body to the body's data attribute.
    def response
      case @response.status
        when 200
          if @response.body.number_of_pages
            Collection.new(@response.body.data)
          else
            @response.body.data
          end
        when 400 then raise BadRequest.new(@response.body.error_message)
        when 404 then raise NotFound.new(@response.body.error_message)
        else raise Error.new(@response.status)
      end
    end
  end
end
