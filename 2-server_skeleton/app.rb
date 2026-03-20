require_relative 'tcp_server.rb'
require_relative 'lib/Routes.rb'

r = Router.new()

r.get("/banan/paj") do |params|
  p (params)
  File.binread("./public/hello.html")
end

r.get("/add/:num1/and/:num2") do |grillkorv, num2|
  "<h1>#{grillkorv.to_i + num2.to_i}</h1>"

end

r.get("/hejsan/") do
  "<h1>Hello</h1>"
end

r.get("/") do
  "<h1>Welcome home</h1>"
end
r.get("/hej") do
  "<h1>banan</h1>"
end

#p (r.routes[0][:method])

server = HTTPServer.new(4567, r)
server.start