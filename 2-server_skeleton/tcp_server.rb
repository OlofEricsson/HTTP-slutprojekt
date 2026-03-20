require 'socket'
require_relative 'lib/request'
require_relative 'lib/mime_mapper'
require_relative 'lib/Response'


class HTTPServer

  def initialize(port, routes)
    @port = port
    @routes = routes

  end

  def find_routes
  end

  def start
    server = TCPServer.new(@port)
    puts "Listening on #{@port}"

    while session = server.accept
      data = ''
      while line = session.gets and line !~ /^\s*$/
        data += line
      end
      puts "RECEIVED REQUEST"
      puts '-' * 40
      puts data
      puts '-' * 40

      request = Request.new(data)

      response = Response.new(request, @routes, session)
      
      response.request_routing()
      response.respond()

    end
  end
end