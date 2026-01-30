require 'socket'
require_relative 'lib/request'

class HTTPServer

  def initialize(port)
    @port = port
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

      status = 404
      content_subtype = "html"
      content_type = "text"
      mime_types = {
        ".png" => "image/png",
        ".css" => "text/css"
      }
      imagemedia = ["apng", "avif", "bmp", "gif", "ico", "png", "svg", "tif", "tiff", "webp"]

      request = Request.new(data)
      p request

      routes = [
        {resource: "/hello/name", content_type: "html", html: "<h1>Hello</h1>\n", },
        {resource: "/wat", content_type: "html", html: "<h1>wat</h1>"},
        {resource: "/wat/pannkaka", content_type: "html", html: File.read("views/hello.html")},
        {resource: "/fancy", content_type: "css", css: File.read("views/hello.css")}]

      html = "<h1>Error #{status}</h1>"
      routes.each do |rot|


        if request.resource == rot[:resource]
          html = rot[:html]
          status = 200
          content_type = rot[:content_type]
        elsif File.exist?("./public#{request.resource}")
          html = File.read("./public#{request.resource}")
          status = 200
          type = request.resource.split(".")
          if imagemedia.include?(type[1])
            content_type = "image"
            content_subtype = type[1]
          else
            content_subtype = type[1]
          end
        end
      end

      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: #{content_type}/#{content_subtype}\r\n"
      p "Content-Type: #{content_type}/#{content_subtype}\r\n"
      session.print "\r\n"
      session.print html
      session.close
    end
  end
end

server = HTTPServer.new(4567)
server.start