#p request
      #gör till en route klass (routes, html, if satsen)

      routes = @routes

        #get("/home", "index.html")
      

      html = "<h1>Error #{status} page not found</h1>"

      #Om det är en post så finns det en nyckel med namnet Content-Length

      #p request.method   #=> 'POST'
      #p request.resource #=> '/login'
      #p request.version  #=> 'HTTP/1.1'
      #p request.headers  #=> {'Host' => 'foo.example',
      #                        'Content-Type' => 'application/x-www-form-urlencoded',
      #                        'Content-Length' => '39'}
      #p request.params   #=> {'username' => 'grillkorv', 'password' => 'verys3cret!'}


      
      #if request.headers.has_key?('Content-Length')
        #content_length = request.headers['Content-Length'].to_i
      #end

      path = "./public#{request.resource}"
      found = false

      if File.exist?(path) && File.file?(path)
        p (request.resource)
        html = File.binread(path)
        status = 200
        type = request.resource.split(".")
        content_type = mime_map["#{type[1]}"]
      else
        routes.routes.each do |rot|
          method = rot[:method]
          resource = rot[:resource]
          p method
          if request.method == method && request.resource.match?(resource)
            found = true
            banan = request.resource.match(resource)
            captures = banan.captures
            html = rot[:block].call(captures) #behöver kunna hämta parametrarna
            status = 200
            content_type = "text/html"
          end
          if found
            break
          end
        end
      end

      content_length = html.bytesize
      session.print "HTTP/1.1 #{status}\r\n"
      session.print "Content-Type: #{content_type}\r\n"
      session.print "Content-Length: #{content_length}\r\n"
      p ("Content-Type: #{content_type}\r\n")
      session.print "\r\n"
      session.print html
      session.close