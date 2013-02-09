module BreweryDB
  module Middleware
    class ErrorHandler < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status]
          when 200
          when 400 then raise BadRequest.new(env[:body].error_message)
          when 401 then raise rate_limit_exceeded_or_unauthorized(env[:response_headers]).new(env[:body].error_message)
          when 404 then raise NotFound.new(env[:body].error_message)
          else fail with(Error, env)
        end
      end

      def rate_limit_exceeded_or_unauthorized(headers)
        rate_limit = headers.fetch('x-ratelimit-remaining') { :rate_limit_unknown }

        rate_limit == '0' ? RateLimitExceeded : Unauthorized
      end
      private :rate_limit_exceeded_or_unauthorized

      def with(error, env)
        message = "Status => #{env[:status]}. Error message => #{env[:body].error_message}"
        error.new(message)
      end
      private :with
    end
  end
end
