require 'socket'
require_relative 'lib/request'
require_relative 'lib/mime_mapper'
require_relative 'lib/Response'


class HTTPServer

  def initialize(port, router)
    @port = port
    @router = router

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

      path = "./public#{request.resource}"
      status = 404
      block = "<h1>Error #{status} page not found</h1>"
      content_type = "text/html"

      res = @router.match(request)
      if res
        status = 200
        block = @router.block

      elsif File.exist?(path) && File.file?(path)
        p (request.resource)
        block = File.binread(path)
        status = 200
        _, type = request.resource.split(".")
        type.downcase!
        p type
        content_type = Mime.mimer(type)

      end

      response = Response.new(session)
      response.respond(status, block, content_type)

    end
  end
end