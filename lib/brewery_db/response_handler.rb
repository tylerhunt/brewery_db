module BreweryDB
  class ResponseHandler
    def initialize(response)
      @response = response
    end

    # Set the successful response body to the body's data attribute.
    def response
      body = @response.body
      body.status == 'success' ? body.data : body
    end
  end
end
