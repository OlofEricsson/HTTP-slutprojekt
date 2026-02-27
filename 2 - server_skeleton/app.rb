require_relative 'tcp_server.rb'
require_relative 'lib/Routes.rb'

r = Router.new()

r.get("/banan/paj") do
  File.binread("./public/hello.html")
end

#print(r.routes[0][:method])

server = HTTPServer.new(4567, r)
server.start