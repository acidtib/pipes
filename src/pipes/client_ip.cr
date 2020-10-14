module Pipes
  class ClientIp < Base
    def initialize(header : String = "X-Forwarded-For")
      @headers = [header]
    end

    def initialize(@headers : Array(String))
    end

    def call(context : HTTP::Server::Context) : HTTP::Server::Context
      @headers.each do |header|
        if addresses = context.request.headers.get?(header)
          context.assigns.ip = addresses[0]
        end
      end

      context
    end
  end
end
