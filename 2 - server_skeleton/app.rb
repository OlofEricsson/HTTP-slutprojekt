require_relative 'tcp_server.rb'

routes = [
        {resource: "/hello/name", 
        content_type: "html", 
        
        html: "<h1>Hello</h1>\n"},

        {resource: "/wat", 
        content_type: "html", 
        
        html: "<h1>wat</h1>"},

        {resource: "/wat/pannkaka", 
        content_type: "html", 
        
        html: File.binread("./public/hello.html")},

        {resource: "/fancy", 
        content_type: "css", 
        
        css: File.binread("views/hello.css")},

        {resource: "/", 
        content_type: "html", 
        
        html: "<h1>Home</h1>\n"}]

server = HTTPServer.new(4567, routes)
server.start