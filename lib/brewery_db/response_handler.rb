module BreweryDB
  class ResponseHandler < Faraday::Response::Middleware
    # Set the successful response body to the body's data attribute.
    def on_complete(env)
      env[:body] = env[:body].data if env[:body].status == 'success'
    end
  end
end
