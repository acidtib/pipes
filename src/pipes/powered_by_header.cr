module Pipes
  class PoweredByHeader < Base
    def call(context : HTTP::Server::Context) : HTTP::Server::Context
      context.response.headers["X-Powered-By"] = "Grip"
    end
  end
end
