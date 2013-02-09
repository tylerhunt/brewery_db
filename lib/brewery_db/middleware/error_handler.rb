module BreweryDB
  module Middleware
    class ErrorHandler < Faraday::Response::Middleware
      def on_complete(env)
        case env[:status]
          when 200
          when 400 then fail with(BadRequest, env)
          when 401 then fail with(rate_limit_exceeded_or_unauthorized(env[:response_headers]), env)
          when 404 then fail with(NotFound, env)
          else fail with(Error, env)
        end
      end

      def rate_limit_exceeded_or_unauthorized(headers)
        rate_limit = headers.fetch('x-ratelimit-remaining') { :rate_limit_unknown }

        rate_limit == '0' ? RateLimitExceeded : Unauthorized
      end
      private :rate_limit_exceeded_or_unauthorized

      def with(error_class, env)
        message = "Status => #{env[:status]}. Error message => #{env[:body].error_message}"
        error_class.new(message)
      end
      private :with
    end
  end
end
