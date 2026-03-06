require_relative 'tcp_server.rb'
require_relative 'lib/Routes.rb'

r = Router.new()

r.get("/banan/paj") do |params|
  p (params)
  File.binread("./public/hello.html")
end

r.get("/add/:num1/:num2") do |grillkorv, num2|
  return "#{grillkorv}.to_i + num2.to_i}"

end

r.get("/hejsan") do
  "<h1>Hello</h1>"
end

#print(r.routes[0][:method])

server = HTTPServer.new(4567, r)
server.start