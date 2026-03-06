#https://rubular.com/
#Den här konverteringen är det som ska bli resorce i routen, aka dehär är mysuperregex funktionen
#regex har inte "" i sina uttryck kom ihåg

res = "/add/:num1/:num2"
#ska bli 
"/^\/add\/(?<num1>\d+)\/(?<num2>\d+)$/" #dehär ska bli resource som sparas i routen så att det sedan går att jämföra med requesten yäää

# Regexp.new(str) #sparas i resource

#   irb(main):010> "/add/3/5".match(/^\/add\/(?<num1>\d+)\/(?<num2>\d+)$/)[:num1]
#   => "3"

#   irb(main):012> "hej hopp banan".gsub(" ", ":")
#   => "hej:hopp:banan"

res.gsub("/", ) #konvertera "/" till regex
res.gsub(":foo",) # kovertera ":foo" till regex som kollar om första tecknet mellan två "/" är ":"

x = Regexp.new("^\/add\/(?<num1>\d+)\/(?<num2>\d+)$")
p (x)
#   => /^\/add\/(?<num1>d+)\/(?<num2>d+)$/

p (Regexp.new(":"))