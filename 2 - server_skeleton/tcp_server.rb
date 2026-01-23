require 'socket'
require_relative 'lib/request'

class HTTPServer

  def initialize(port)
    @port = port
  end

  def find_routes

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

      status = 404
      content_type = "html"

      request = Request.new(data)
      p request

      routes = [
        {resource: "/hello/:name", html: "<h1>Hello</h1>\n"},
        {resource: "/wat", html: "<h1>wat</h1>"},
        {resource: "/wat/pannkaka", html: File.read("views/hello.html")}]

      html = "<h1>Error #{status}</h1>"
      routes.each do |rot|
        if request.resource == rot[:resource]
          html = rot[:html]
          status = 200
        end
      end

      # if request.resource == "/hello"
      #   html = "<h1>Hello, World!</h1>"
      # else
      #    html = "<h1>WAT</h1>"
      # end

      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: text/#{content_type}\r\n"
      session.print "\r\n"
      session.print html
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start