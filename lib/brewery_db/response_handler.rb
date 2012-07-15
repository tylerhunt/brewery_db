module BreweryDB
  class ResponseHandler < Faraday::Response::Middleware
    def on_complete(env)
      case env[:status]
        when 200
        when 400 then raise BadRequest.new(env[:body].error_message)
        when 404 then raise NotFound.new(env[:body].error_message)
        else raise Error.new(env[:status])
      end
    end
  end
end
