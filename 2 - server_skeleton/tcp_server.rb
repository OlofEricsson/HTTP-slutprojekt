require 'socket'
require_relative 'lib/request'
require_relative 'lib/mime_mapper'

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

      status = 404
      content = "text/html"
      mime_map = parse_mime_table()

      request = Request.new(data)
      #p request
      #gör till en route klass (routes, html, if satsen)

      routes = @routes

        #get("/home", "index.html")
      

      html = "<h1>Error #{status} page not found</h1>"

      if File.exist?("./public#{request.resource}")
        p (request.resource)
        html = File.binread("./public#{request.resource}")
        status = 200
        type = request.resource.split(".")
        content = mime_map["#{type[1]}"]
      else
        routes.each do |rot|
          if request.resource == rot[:resource]
           html = rot[:html]
            status = 200
            content_type = rot[:content_type]
          end
        end
      end

      content_length = html.bytesize
      #ska bli en klass, Response
      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: #{content}\r\n"
      session.print "Content-Length: #{content_length}\r\n"
      p ("Content-Type: #{content}\r\n")
      session.print "\r\n"
      session.print html
      session.close
    end
  end
end